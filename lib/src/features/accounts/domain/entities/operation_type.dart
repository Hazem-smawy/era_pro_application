import 'package:era_pro_application/src/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OperationUIType {
  final int type;
  final String name;
  final IconData icon;
  final Color iconColor;
  final Color textColor;
  final String subName;

  OperationUIType({
    required this.type,
    required this.name,
    required this.icon,
    required this.iconColor,
    required this.textColor,
    required this.subName,
  });

  static final Map<int, OperationUIType> _operationTypes = {
    1: OperationUIType(
      type: 1,
      name: 'سند صرف',
      icon: FontAwesomeIcons.arrowTrendUp,
      iconColor: Colors.green,
      textColor: Colors.purple,
      subName: 'السند',
    ),
    2: OperationUIType(
      type: 2,
      name: 'سند قبض',
      icon: FontAwesomeIcons.arrowTrendDown,
      iconColor: Colors.red,
      textColor: Colors.purple,
      subName: 'السند',
    ),
    3: OperationUIType(
      type: 3,
      name: 'قيود اليومية',
      icon: FontAwesomeIcons.arrowDown,
      iconColor: AppColors.secondaryColor,
      textColor: Colors.grey,
      subName: 'القيد',
    ),
    4: OperationUIType(
      type: 4,
      name: 'قيد إفتتاحي',
      icon: FontAwesomeIcons.arrowsToCircle,
      iconColor: Colors.red,
      textColor: Colors.purple,
      subName: 'القيد',
    ),
    5: OperationUIType(
      type: 5,
      name: 'مخزون إفتتاحي',
      icon: FontAwesomeIcons.arrowRightToBracket,
      iconColor: Colors.green,
      textColor: const Color(0xff37B6BD),
      subName: 'القيد',
    ),
    6: OperationUIType(
      type: 6,
      name: 'فاتورة مشتريات',
      icon: FontAwesomeIcons.arrowTrendDown,
      iconColor: Colors.red,
      textColor: Colors.purple,
      subName: 'الفاتورة',
    ),
    7: OperationUIType(
      type: 7,
      name: 'مرتجع مشتريات',
      icon: FontAwesomeIcons.arrowTrendDown,
      iconColor: Colors.red,
      textColor: Colors.purple,
      subName: 'الفاتورة',
    ),
    8: OperationUIType(
      type: 8,
      name: 'فاتورة بيع',
      icon: FontAwesomeIcons.arrowUpFromBracket,
      iconColor: Colors.green,
      textColor: AppColors.secondaryColor,
      subName: 'الفاتورة',
    ),
    9: OperationUIType(
      type: 9,
      name: 'فاتورة مرتجع',
      icon: FontAwesomeIcons.arrowTurnDown,
      iconColor: Colors.red,
      textColor: AppColors.primaryColor,
      subName: 'الفاتورة',
    ),
    10: OperationUIType(
      type: 10,
      name: 'امر توريد مخزني',
      icon: FontAwesomeIcons.arrowsToDot,
      iconColor: Colors.red,
      textColor: const Color.fromARGB(255, 231, 153, 20),
      subName: 'القيد',
    ),
    11: OperationUIType(
      type: 11,
      name: 'امر صرف مخزني',
      icon: FontAwesomeIcons.arrowTrendDown,
      iconColor: Colors.red,
      textColor: Colors.purple,
      subName: 'القيد',
    ),
    12: OperationUIType(
      type: 12,
      name: 'تحويل مخزني',
      icon: FontAwesomeIcons.arrowTrendDown,
      iconColor: Colors.red,
      textColor: Colors.purple,
      subName: 'القيد',
    ),
    13: OperationUIType(
      type: 13,
      name: 'استلام مخزني',
      icon: FontAwesomeIcons.arrowTurnDown,
      iconColor: const Color.fromARGB(255, 231, 153, 20),
      textColor: Colors.blue,
      subName: 'القيد',
    ),
    14: OperationUIType(
      type: 14,
      name: 'تسوية كميات المخزون',
      icon: FontAwesomeIcons.arrowTrendDown,
      iconColor: Colors.red,
      textColor: Colors.purple,
      subName: 'القيد',
    ),
    15: OperationUIType(
      type: 15,
      name: 'تسوية تكلفة المخزون',
      icon: FontAwesomeIcons.arrowTrendDown,
      iconColor: Colors.red,
      textColor: Colors.purple,
      subName: 'القيد',
    ),
    16: OperationUIType(
      type: 16,
      name: 'قيد اقفال',
      icon: FontAwesomeIcons.arrowTrendDown,
      iconColor: Colors.red,
      textColor: Colors.purple,
      subName: 'القيد',
    ),
  };

  static OperationUIType fromType(int type) {
    print('type: $type');
    return _operationTypes[type] ?? _operationTypes[1]!;
  }
}
