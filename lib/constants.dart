import 'package:madathil/model/services/local_db/hive_constants.dart';
import 'package:madathil/model/services/local_db/hive_local.dart';

HiveLocal? hiveInstance;

String? username = hiveInstance?.getData(DataBoxKey.kUserName);
String? employeeId = hiveInstance?.getData(DataBoxKey.kEmpId);
String? roleProfile = hiveInstance?.getData(DataBoxKey.kroleProfile);
String? userEmail = hiveInstance?.getData(DataBoxKey.kUserEmail);

updateVlaue() {
  username = hiveInstance?.getData(DataBoxKey.kUserName);
  employeeId = hiveInstance?.getData(DataBoxKey.kEmpId);
  roleProfile = hiveInstance?.getData(DataBoxKey.kroleProfile);
  userEmail = hiveInstance?.getData(DataBoxKey.kUserEmail);
}
