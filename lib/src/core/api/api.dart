library api;

import 'package:era_pro_applicationlication/src/core/api/end_points.dart';
import 'package:get/get.dart';

class ApiConnection extends GetxController {
  final ip = "".obs;
  final port = "".obs;

  String get authUrl => 'http://$ip:$port/api/{endpoints}'
      .replaceFirst('{endpoints}', EndPoints.authUrl);

  String get getIp {
    return ip.value;
  }

  set setIp(String newIp) {
    ip.value = newIp;
  }

  String get getPort {
    return port.value;
  }

  set setPort(String newPort) {
    port.value = newPort;
  }
}
