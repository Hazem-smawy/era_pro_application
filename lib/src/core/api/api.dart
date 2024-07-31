// ignore_for_file: public_member_api_docs, sort_constructors_first
library api;

import 'package:era_pro_applicationlication/src/core/services/shared_pref.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:era_pro_applicationlication/src/core/api/end_points.dart';

class ApiConnection extends GetxController {
  // SharedPreferences sharedPreferences;
  // ApiConnection({
  //   required this.sharedPreferences,
  // });
  final SharedPreferencesService _sharedPreferencesService = Get.find();

  String get getBaseUrl => 'http://$getIp:$getPort';

  String get authUrl => '$getBaseUrl/api/{endpoints}'
      .replaceFirst('{endpoints}', EndPoints.authUrl);
  String get userUrl => '$getBaseUrl/api/{endpoints}'
      .replaceFirst('{endpoints}', EndPoints.userUrl);

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
}
