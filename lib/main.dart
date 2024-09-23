import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:madathil/constants.dart';
import 'package:madathil/model/services/api_service/api_repository.dart';
import 'package:madathil/model/services/local_db/hive_local.dart';
import 'package:madathil/view/screens/splash_screen/splash_screen.dart';
import 'package:madathil/viewmodel/auth_viewmodel.dart';
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
    return MultiProvider(
      providers: providerList(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }

  //============= provider list =============
  List<SingleChildWidget> providerList() {
    //add new providers here
    return [
      ChangeNotifierProvider(
          create: (_) => AuthViewmodel(apiRepository: ApiRepository())),
    ];
  }
}
