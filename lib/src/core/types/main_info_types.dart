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

import '../routes/routes.dart';

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
      id: 1,
      title: 'الفواتير',
      color: const Color(0xff37B6BD),
      icon: FontAwesomeIcons.fileInvoice,
      action: () {},
    ),
    MainInfoItemTypes(
        id: 2,
        title: 'العملاء',
        color: const Color(0xffED3C56),
        icon: FontAwesomeIcons.user,
        action: () {}),
    MainInfoItemTypes(
      id: 3,
      title: 'المخزون',
      color: Colors.blue,
      icon: FontAwesomeIcons.building,
      action: () {
        Get.toNamed(AppRouteName.store.name);
      },
    ),
    MainInfoItemTypes(
      id: 4,
      title: 'العملاء',
      color: const Color(0xffED3C56),
      icon: FontAwesomeIcons.user,
      action: () {},
    ),
    MainInfoItemTypes(
        id: 5,
        title: 'العملات',
        color: Colors.green,
        icon: FontAwesomeIcons.dollarSign,
        action: () {
          Get.toNamed(AppRouteName.curency.name);
        }),
    MainInfoItemTypes(
      id: 6,
      title: 'معلومات الشركة',
      color: const Color.fromARGB(255, 231, 153, 20),
      icon: FontAwesomeIcons.circleInfo,
      action: () {
        Get.toNamed(AppRouteName.companyInfo.name);
      },
    ),
    MainInfoItemTypes(
      id: 7,
      title: 'العملاء',
      color: const Color(0xffED3C56),
      icon: FontAwesomeIcons.user,
      action: () {},
    ),
    MainInfoItemTypes(
      id: 8,
      title: 'المخزون',
      color: Colors.blue,
      icon: FontAwesomeIcons.building,
      action: () {},
    ),
  ];
}
