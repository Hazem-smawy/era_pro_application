import 'package:era_pro_application/src/core/utils/arabic_date_formater.dart';
import 'package:era_pro_application/src/core/utils/currency_format.dart';
import 'package:flutter/material.dart';
import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../domain/entities/operation_type.dart';

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
    final operationType = OperationUIType.fromType(type);

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
                  Icon(
                    price > 0 ? Icons.arrow_downward : Icons.arrow_upward,
                    color: price > 0 ? Colors.red : Colors.green,
                    size: 18,
                  ),
                  context.g8,
                  Text(
                    currencySymbole,
                    style: context.titleLarge.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  context.g4,
                  Text(
                    currencyFormat(number: price.abs().toStringAsFixed(2)),
                    style: context.titleLarge.copyWith(
                      color: context.blackColor,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              context.g4,
              Text(
                formatDateToArabic(date),
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
              size: 20,
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
    final operationType = OperationUIType.fromType(type);

    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: operationType.textColor.withOpacity(0.06),
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
