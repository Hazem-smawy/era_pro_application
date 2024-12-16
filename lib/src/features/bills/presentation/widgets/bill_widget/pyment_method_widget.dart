import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/features/bills/domain/entities/bill_entity.dart';
import 'package:flutter/material.dart';

class PymentMethodWidget extends StatelessWidget {
  const PymentMethodWidget({
    super.key,
    required this.bill,
  });

  final BillEntity bill;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: bill.paymentMethed != 0
              ? const Color(0xff37BD6D).withOpacity(0.1)
              : Colors.red.withOpacity(0.1),
        ),
        child: Text(
          bill.paymentMethed != 0 ? 'نقداً' : 'اجل',
          style: context.bodySmall.copyWith(
            color:
                bill.paymentMethed != 0 ? const Color(0xff37BD6D) : Colors.red,
          ),
        ),
      ),
    );
  }
}
