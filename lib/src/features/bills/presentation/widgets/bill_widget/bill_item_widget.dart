import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/features/bills/domain/repositories/bill_repository.dart';
import 'package:era_pro_application/src/features/bills/presentation/getX/bill_controller.dart';
import 'package:era_pro_application/src/features/bills/presentation/pages/all_bills_page.dart';
import 'package:era_pro_application/src/features/bills/presentation/widgets/bill_widget/bill_type_widget.dart';
import 'package:era_pro_application/src/features/bills/presentation/widgets/bill_widget/pyment_method_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as date_formater;

class BillItemWidget extends StatelessWidget {
  BillItemWidget({
    super.key,
    required this.billWithDetailsUI,
  });

  final BillWithDetailsUI billWithDetailsUI;
  final BillController billController = Get.find();

  @override
  Widget build(BuildContext context) {
    final iconColor = context.blackColor.withOpacity(0.8);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          context.g4,
          Row(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    date_formater.DateFormat.yMEd()
                        .format(billWithDetailsUI.bill.billDate),
                    style: context.bodyMedium,
                  ),
                  context.g8,
                  Icon(
                    Icons.calendar_today_outlined,
                    size: 17,
                    color: context.secondaryTextColor,
                  )
                ],
              ),
              const Spacer(),
              context.g4,
              Text(
                billWithDetailsUI.bill.billNumber.toString(),
                style: context.titleLarge.copyWith(
                  color: context.secondary,
                ),
              ),
              context.g4,
              Text(
                ':رقم الفاتورة',
                style: context.bodySmall,
              ),
              context.g8,
              BillTypeWidget(bill: billWithDetailsUI.bill),
            ],
          ),
          context.g8,
          Row(
            children: [
              Text(
                billWithDetailsUI.curencyEntity.symbol,
                style: context.bodySmall,
              ),
              context.g4,
              Text(
                billWithDetailsUI.bill.billFinalCost.toString(),
                style: context.titleMedium.copyWith(
                  color: context.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              Text(
                billWithDetailsUI.customer.accName,
                style: context.titleLarge.copyWith(
                  color: context.blackColor,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          context.g12,
          Row(
            children: [
              SizedBox(
                width: Get.width / 2.5,
                child: PymentMethodWidget(bill: billWithDetailsUI.bill),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: billWithDetailsUI.bill.billType == 8
                          ? IconButton(
                              onPressed: () async {
                                billController.updateOldBill(
                                    billWithDetailsUI.bill, 9, 'a');
                              },
                              icon: FaIcon(
                                FontAwesomeIcons.arrowTurnDown,
                                color: iconColor,
                                size: 17,
                              ),
                            )
                          : const SizedBox(),
                    ),
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: IconButton(
                        onPressed: () async {
                          billController.updateOldBill(
                            billWithDetailsUI.bill,
                            billWithDetailsUI.bill.billType,
                            'e',
                          );
                        },
                        icon: FaIcon(
                          FontAwesomeIcons.penToSquare,
                          color: iconColor,
                          size: 17,
                        ),
                      ),
                    ),
                    FaIcon(
                      FontAwesomeIcons.share,
                      color: iconColor,
                      size: 17,
                    ),
                    FaIcon(
                      FontAwesomeIcons.print,
                      color: iconColor,
                      size: 17,
                    ),
                  ],
                ),
              )
            ],
          ),
          context.g4,
        ],
      ),
    );
  }
}
