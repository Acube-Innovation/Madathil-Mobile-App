import 'package:madathil/model/services/local_db/hive_constants.dart';
import 'package:madathil/model/services/local_db/hive_local.dart';

HiveLocal? hiveInstance;

String? username = hiveInstance?.getData(DataBoxKey.kUserName);
String? employeeId = hiveInstance?.getData(DataBoxKey.kEmpId);
