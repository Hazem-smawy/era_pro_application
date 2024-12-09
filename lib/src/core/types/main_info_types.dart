/*

 InfoItemWidget(
                    title: 'الفواتير',
                    color: const Color(0xff37B6BD),
                    icon: FontAwesomeIcons.fileInvoice,
                    action: () {},
                  ),
*/
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../routes/app_pages.dart';

class MainInfoItemTypes {
  final int id;
  final String title;
  final Color color;
  final IconData icon;
  final VoidCallback action;

  MainInfoItemTypes({
    required this.id,
    required this.title,
    required this.color,
    required this.icon,
    required this.action,
  });
}

class MainInfoTypes {
  static List<MainInfoItemTypes> items = [
    MainInfoItemTypes(
      id: 7,
      title: 'الحسابات',
      color: const Color(0xffED3C56),
      icon: FontAwesomeIcons.user,
      action: () => Get.toNamed(Routes.ACCOUNTS),
    ),
    MainInfoItemTypes(
      id: 1,
      title: 'الفواتير',
      color: const Color(0xff37B6BD),
      icon: FontAwesomeIcons.fileInvoice,
      action: () {
        Get.toNamed(Routes.ALLBILLS);
      },
    ),
    MainInfoItemTypes(
      id: 3,
      title: 'المخزون',
      color: Colors.blue,
      icon: FontAwesomeIcons.building,
      action: () {
        Get.toNamed(Routes.STORE);
      },
    ),
    MainInfoItemTypes(
      id: 5,
      title: 'العملات',
      color: Colors.green,
      icon: FontAwesomeIcons.dollarSign,
      action: () => Get.toNamed(Routes.CURRENCIES),
    ),
    MainInfoItemTypes(
      id: 6,
      title: 'معلومات الشركة',
      color: const Color.fromARGB(255, 231, 153, 20),
      icon: FontAwesomeIcons.circleInfo,
      action: () => Get.toNamed(Routes.COMPANYINFO),
    ),
    MainInfoItemTypes(
      id: 8,
      title: 'الوحدات',
      color: Colors.blue,
      icon: FontAwesomeIcons.glassWater,
      action: () => Get.toNamed(Routes.UNTIS),
    ),
  ];
}
