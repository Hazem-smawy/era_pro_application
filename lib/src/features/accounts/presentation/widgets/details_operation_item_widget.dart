// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/material.dart';

// import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:intl/intl.dart';

// class DetailsOperationItemWidget extends StatelessWidget {
//   final DateTime date;
//   final int type;

//   final double price;
//   final int number;
//   final String currencySymbole;

//   const DetailsOperationItemWidget({
//     super.key,
//     required this.date,
//     required this.type,
//     required this.price,
//     required this.currencySymbole,
//     required this.number,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         color: context.whiteColor,
//       ),
//       child: Row(
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Text(
//                     currencySymbole,
//                     style: context.titleLarge.copyWith(
//                       color: context.primary,
//                       fontWeight: FontWeight.normal,
//                     ),
//                   ),
//                   Text(
//                     price.toString(),
//                     style: context.titleLarge.copyWith(
//                       color: context.primary,
//                       fontWeight: FontWeight.normal,
//                     ),
//                   ),
//                 ],
//               ),
//               Text(
//                 DateFormat.yMEd().format(date),
//                 style: context.bodySmall,
//               ),
//             ],
//           ),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 Text(
//                   "رقم $number",
//                   style: context.bodyLarge,
//                 ),
//                 context.g4,
//                 OperationTypeWidget(type: type)
//               ],
//             ),
//           ),
//           context.g8,
//           CircleAvatar(
//             radius: 25,
//             backgroundColor: Colors.red.withOpacity(0.1),
//             child: const Icon(
//               FontAwesomeIcons.arrowDown,
//               color: Colors.red,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// class OperationTypeWidget extends StatelessWidget {
//   const OperationTypeWidget({
//     super.key,
//     required this.type,
//   });

//   final int type;

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.centerLeft,
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15),
//           color: type == 8
//               ? context.secondary.withOpacity(0.06)
//               : const Color.fromARGB(255, 19, 3, 198).withOpacity(0.06),
//         ),
//         child: Text(
//           type == 8 ? 'فاتورة بيع' : 'فاتورة مرتجع',
//           style: context.bodySmall.copyWith(
//             color: type == 8
//                 ? context.secondary
//                 : const Color.fromARGB(255, 19, 3, 198),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:era_pro_application/src/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailsOperationItemWidget extends StatelessWidget {
  final DateTime date;
  final int type;
  final double price;
  final int number;
  final String currencySymbole;

  const DetailsOperationItemWidget({
    super.key,
    required this.date,
    required this.type,
    required this.price,
    required this.currencySymbole,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    final operationType = OperationType.fromType(type);

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: context.whiteColor,
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    currencySymbole,
                    style: context.titleLarge.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  context.g4,
                  Text(
                    price.abs().toString(),
                    style: context.titleLarge.copyWith(
                      color: context.blackColor,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              context.g4,
              Text(
                DateFormat.yMEd().format(date),
                style: context.bodySmall,
              ),
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      number.toString(),
                      style: context.titleLarge,
                    ),
                    context.g4,
                    Text(
                      "رقم  ${operationType.subName}",
                      style: context.bodySmall,
                    ),
                  ],
                ),
                context.g4,
                OperationTypeWidget(type: type)
              ],
            ),
          ),
          context.g12,
          CircleAvatar(
            radius: 25,
            backgroundColor: operationType.iconColor.withOpacity(0.1),
            child: Icon(
              operationType.icon,
              color: operationType.iconColor,
            ),
          )
        ],
      ),
    );
  }
}

class OperationTypeWidget extends StatelessWidget {
  const OperationTypeWidget({
    super.key,
    required this.type,
  });

  final int type;

  @override
  Widget build(BuildContext context) {
    final operationType = OperationType.fromType(type);

    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: operationType.backgroundColor.withOpacity(0.06),
        ),
        child: Text(
          operationType.name,
          style: context.bodySmall.copyWith(
            color: operationType.textColor,
          ),
        ),
      ),
    );
  }
}

class OperationType {
  final int type;
  final String name;
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final Color textColor;
  final String subName;

  OperationType({
    required this.type,
    required this.name,
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
    required this.textColor,
    required this.subName,
  });

  static final Map<int, OperationType> _operationTypes = {
    8: OperationType(
      type: 8,
      name: 'فاتورة بيع',
      icon: FontAwesomeIcons.arrowUpFromBracket,
      iconColor: Colors.green,
      backgroundColor: AppColors.primaryColor,
      textColor: AppColors.primaryColor,
      subName: 'الفاتورة',
    ),
    9: OperationType(
      type: 9,
      name: 'فاتورة مرتجع',
      icon: FontAwesomeIcons.arrowTurnDown,
      iconColor: Colors.red,
      backgroundColor: AppColors.primaryColor,
      textColor: AppColors.primaryColor,
      subName: 'الفاتورة',
    ),
    1: OperationType(
      type: 1,
      name: 'سند صرف',
      icon: FontAwesomeIcons.arrowTrendUp,
      iconColor: Colors.green,
      backgroundColor: Colors.purple,
      textColor: Colors.purple,
      subName: 'السند',
    ),
    2: OperationType(
      type: 2,
      name: 'سند قبض',
      icon: FontAwesomeIcons.arrowTrendDown,
      iconColor: Colors.red,
      backgroundColor: Colors.purple,
      textColor: Colors.purple,
      subName: 'السند',
    ),
  };

  static OperationType fromType(int type) {
    return _operationTypes[type] ?? _operationTypes[1]!;
  }
}
