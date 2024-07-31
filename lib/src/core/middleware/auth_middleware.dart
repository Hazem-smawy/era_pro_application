// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:era_pro_applicationlication/src/core/services/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {
  final SharedPreferencesService _sharedPreferencesService = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (_sharedPreferencesService.getString('userId') != null) {
      return const RouteSettings(name: '/home');
    }
    return null;
  }
}
