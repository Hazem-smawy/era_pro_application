// // ignore_for_file: public_member_api_docs, sort_constructors_first
// library api;

// import 'package:era_pro_application/src/core/services/shared_preferences.dart';
// import 'package:get/get.dart';

// import 'package:era_pro_application/src/core/api/end_points.dart';

// class ApiConnection extends GetxController {
//   // SharedPreferences sharedPreferences;
//   // ApiConnection({
//   //   required this.sharedPreferences,
//   // });
//   final SharedPreferencesService _sharedPreferencesService = Get.find();

//   String get getBaseUrl => 'http://$getIp:$getPort';

//   String? get getIp {
//     return _sharedPreferencesService.getString('ip');
//   }

//   set setIp(String newIp) {
//     _sharedPreferencesService.setString('ip', newIp);
//   }

//   String? get getPort {
//     return _sharedPreferencesService.getString('port');
//   }

//   set setPort(String newPort) {
//     _sharedPreferencesService.setString('port', newPort);
//   }

//   //set a request

//   //end points
//   String get authUrl => '$getBaseUrl/api/{endpoints}'
//       .replaceFirst('{endpoints}', EndPoints.authUrl);
//   String get userUrl => '$getBaseUrl/api/{endpoints}'
//       .replaceFirst('{endpoints}', EndPoints.userUrl);
//   String get branchUrl => '$getBaseUrl/api/{endpoints}'
//       .replaceFirst('{endpoints}', EndPoints.branchUrl);
//   String get companUrl => '$getBaseUrl/api/{endpoints}'
//       .replaceFirst('{endpoints}', EndPoints.companyUrl);
//   String get curencyUrl => '$getBaseUrl/api/{endpoints}'
//       .replaceFirst('{endpoints}', EndPoints.curencyUrl);
//   String get itemGroupsUrl => '$getBaseUrl/api/{endpoints}'
//       .replaceFirst('{endpoints}', EndPoints.itemGroups);
//   String get unitsUrl => '$getBaseUrl/api/{endpoints}'
//       .replaceFirst('{endpoints}', EndPoints.units);
//   String get userStoreUrl => '$getBaseUrl/api/{endpoints}'
//       .replaceFirst('{endpoints}', EndPoints.userStore);
//   String get itemUnitsUrl => '$getBaseUrl/api/{endpoints}'
//       .replaceFirst('{endpoints}', EndPoints.itemUnitsUrl);
//   String get itemsUrl => '$getBaseUrl/api/{endpoints}'
//       .replaceFirst('{endpoints}', EndPoints.items);

//   String get paymentsUrl => '$getBaseUrl/api/{endpoints}'
//       .replaceFirst('{endpoints}', EndPoints.paymentsMethod);
//   String get userSettingsUrl => '$getBaseUrl/api/{endpoints}'
//       .replaceFirst('{endpoints}', EndPoints.userSettings);
//   String get systemDocsUrl => '$getBaseUrl/api/{endpoints}'
//       .replaceFirst('{endpoints}', EndPoints.systemDocs);

//   String get itemBarcodesUrl => '$getBaseUrl/api/{endpoints}'
//       .replaceFirst('{endpoints}', EndPoints.itembarcode);
//   String get itemAlterUrl => '$getBaseUrl/api/{endpoints}'
//       .replaceFirst('{endpoints}', EndPoints.itemAlter);
//   String get storeOperation => '$getBaseUrl/api/{endpoints}'.replaceFirst(
//         '{endpoints}',
//         EndPoints.storeOperation,
//       );

// //accounts
//   String get accountsUrl => '$getBaseUrl/api/{endpoints}'.replaceFirst(
//         '{endpoints}',
//         EndPoints.accounts,
//       );
//   String get refAcountsUrl => '$getBaseUrl/api/{endpoints}'.replaceFirst(
//         '{endpoints}',
//         EndPoints.refAccount,
//       );
//   String get midAccountsUrl => '$getBaseUrl/api/{endpoints}'.replaceFirst(
//         '{endpoints}',
//         EndPoints.midAccount,
//       );
//   String get accOperationUrl => '$getBaseUrl/api/{endpoints}'.replaceFirst(
//         '{endpoints}',
//         EndPoints.accOperation,
//       );
// }
// ignore_for_file: public_member_api_docs, sort_constructors_first
library api;

import 'package:era_pro_application/src/core/services/shared_preferences.dart';
import 'package:get/get.dart';

import 'package:era_pro_application/src/core/api/end_points.dart';

class ApiConnection extends GetxController {
  final SharedPreferencesService _sharedPreferencesService = Get.find();

  String get getBaseUrl => 'http://$getIp:$getPort';

  String? get getIp {
    return _sharedPreferencesService.getString('ip');
  }

  set setIp(String newIp) {
    _sharedPreferencesService.setString('ip', newIp);
  }

  String? get getPort {
    return _sharedPreferencesService.getString('port');
  }

  set setPort(String newPort) {
    _sharedPreferencesService.setString('port', newPort);
  }

  // Endpoints
  String get authUrl => '$getBaseUrl/api/{endpoints}'
      .replaceFirst('{endpoints}', EndPoints.authUrl);
  String get userUrl => '$getBaseUrl/api/{endpoints}'
      .replaceFirst('{endpoints}', EndPoints.userUrl);
  String get branchUrl => '$getBaseUrl/api/{endpoints}'
      .replaceFirst('{endpoints}', EndPoints.branchUrl);
  String get companUrl => '$getBaseUrl/api/{endpoints}'
      .replaceFirst('{endpoints}', EndPoints.companyUrl);
  String get curencyUrl => '$getBaseUrl/api/{endpoints}'
      .replaceFirst('{endpoints}', EndPoints.curencyUrl);
  String get itemGroupsUrl => '$getBaseUrl/api/{endpoints}'
      .replaceFirst('{endpoints}', EndPoints.itemGroups);
  String get unitsUrl => '$getBaseUrl/api/{endpoints}'
      .replaceFirst('{endpoints}', EndPoints.units);
  String get userStoreUrl => '$getBaseUrl/api/{endpoints}'
      .replaceFirst('{endpoints}', EndPoints.userStore);
  String get itemUnitsUrl => '$getBaseUrl/api/{endpoints}'
      .replaceFirst('{endpoints}', EndPoints.itemUnitsUrl);
  String get itemsUrl => '$getBaseUrl/api/{endpoints}'
      .replaceFirst('{endpoints}', EndPoints.items);
  String get paymentsUrl => '$getBaseUrl/api/{endpoints}'
      .replaceFirst('{endpoints}', EndPoints.paymentsMethod);
  String get userSettingsUrl => '$getBaseUrl/api/{endpoints}'
      .replaceFirst('{endpoints}', EndPoints.userSettings);
  String get systemDocsUrl => '$getBaseUrl/api/{endpoints}'
      .replaceFirst('{endpoints}', EndPoints.systemDocs);
  String get itemBarcodesUrl => '$getBaseUrl/api/{endpoints}'
      .replaceFirst('{endpoints}', EndPoints.itembarcode);
  String get itemAlterUrl => '$getBaseUrl/api/{endpoints}'
      .replaceFirst('{endpoints}', EndPoints.itemAlter);
  String get storeOperation => '$getBaseUrl/api/{endpoints}'.replaceFirst(
        '{endpoints}',
        EndPoints.storeOperation,
      );
  String get accountsUrl => '$getBaseUrl/api/{endpoints}'.replaceFirst(
        '{endpoints}',
        EndPoints.accounts,
      );
  String get refAcountsUrl => '$getBaseUrl/api/{endpoints}'.replaceFirst(
        '{endpoints}',
        EndPoints.refAccount,
      );
  String get midAccountsUrl => '$getBaseUrl/api/{endpoints}'.replaceFirst(
        '{endpoints}',
        EndPoints.midAccount,
      );
  String get accOperationUrl => '$getBaseUrl/api/{endpoints}'.replaceFirst(
        '{endpoints}',
        EndPoints.accOperation,
      );
  String get sandUrl => '$getBaseUrl/api/{endpoints}'.replaceFirst(
        '{endpoints}',
        EndPoints.sand,
      );
}
