import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/features/bills/domain/entities/bill_entity.dart';
import 'package:flutter/material.dart';

class BillTypeWidget extends StatelessWidget {
  const BillTypeWidget({
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
          color: bill.billType == 8
              ? context.secondary.withOpacity(0.06)
              : const Color.fromARGB(255, 19, 3, 198).withOpacity(0.06),
        ),
        child: Text(
          bill.billType == 8 ? 'فاتورة بيع' : 'فاتورة مرتجع',
          style: context.bodySmall.copyWith(
            color: bill.billType == 8
                ? context.secondary
                : const Color.fromARGB(255, 19, 3, 198),
          ),
        ),
      ),
    );
  }
}
