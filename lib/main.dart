import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:madathil/app_theme.dart';
import 'package:madathil/constants.dart';
import 'package:madathil/model/services/api_service/api_repository.dart';
import 'package:madathil/model/services/local_db/hive_local.dart';
import 'package:madathil/size_config.dart';
import 'package:madathil/view/screens/splash_screen/splash_screen.dart';
import 'package:madathil/viewmodel/auth_viewmodel.dart';
import 'package:madathil/viewmodel/call_viewmodel.dart';
import 'package:madathil/viewmodel/common_viewmodel.dart';
import 'package:madathil/viewmodel/customer_viewmodel.dart';
import 'package:madathil/viewmodel/leads_viewmodel.dart';
import 'package:madathil/viewmodel/order_viewmodel.dart';
import 'package:madathil/viewmodel/payment_viewmodel.dart';
import 'package:madathil/viewmodel/product_viewmodel.dart';
import 'package:madathil/viewmodel/salary_viewmodel.dart';
import 'package:madathil/viewmodel/task_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  hiveInstance = await HiveLocal.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MultiProvider(
      providers: providerList(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Madathil',
          theme: AppTheme.appTheme,
          home: const SplashScreen()),
    );
  }

  //============= provider list =============
  List<SingleChildWidget> providerList() {
    //add new providers here
    return [
      ChangeNotifierProvider(
          create: (_) => AuthViewmodel(apiRepository: ApiRepository())),
      ChangeNotifierProvider(
          create: (_) => CommonDataViewmodel(apiRepository: ApiRepository())),
      ChangeNotifierProvider(
          create: (_) => ProductViewmodel(apiRepository: ApiRepository())),
      ChangeNotifierProvider(
          create: (_) => CustomerViewmodel(apiRepository: ApiRepository())),
      ChangeNotifierProvider(
          create: (_) => LeadsViewmodel(apiRepository: ApiRepository())),
      ChangeNotifierProvider(
          create: (_) => PaymentViewmodel(apiRepository: ApiRepository())),
      ChangeNotifierProvider(
          create: (_) => TasksViewmodel(apiRepository: ApiRepository())),
      ChangeNotifierProvider(
          create: (_) => PaymentViewmodel(apiRepository: ApiRepository())),
      ChangeNotifierProvider(
          create: (_) => OrderViewmodel(apiRepository: ApiRepository())),
      ChangeNotifierProvider(
          create: (_) => CallViewModel(apiRepository: ApiRepository())),
      ChangeNotifierProvider(
          create: (_) => SalaryViewmodel(apiRepository: ApiRepository())),
    ];
  }
}
