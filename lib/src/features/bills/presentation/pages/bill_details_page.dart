import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/extensions/padding_extension.dart';
import 'package:era_pro_application/src/core/widgets/circle_back_btn_widget.dart';
import 'package:era_pro_application/src/core/widgets/thin_divider_widget.dart';
import 'package:era_pro_application/src/features/bills/domain/entities/bill_entity.dart';
import 'package:era_pro_application/src/features/bills/domain/entities/bill_ui_entity.dart';
import 'package:era_pro_application/src/features/bills/presentation/getX/bill_controller.dart';
import 'package:era_pro_application/src/features/bills/presentation/pages/all_bills_page.dart';
import 'package:era_pro_application/src/features/bills/presentation/widgets/bill_widget/bill_type_widget.dart';
import 'package:era_pro_application/src/features/bills/presentation/widgets/bill_widget/pyment_method_widget.dart';
import 'package:era_pro_application/src/features/main_info/domain/entities/main_info_entity.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as date_formater;

class BillDetailsPage extends StatefulWidget {
  const BillDetailsPage(
      {super.key,
      required this.billEntity,
      required this.customer,
      required this.curencyEntity});
  final BillEntity billEntity;
  final String? customer;
  final CurencyEntity? curencyEntity;

  @override
  State<BillDetailsPage> createState() => _BillDetailsPageState();
}

class _BillDetailsPageState extends State<BillDetailsPage> {
  BillController billController = Get.find();
  @override
  void initState() {
    super.initState();

    billController.getBillDetailsUI(widget.billEntity.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.whiteColor,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                context.g4,
                IconButton(
                  onPressed: () {
                    billController.updateOldBill(
                        widget.billEntity, widget.billEntity.billType, 'e');
                  },
                  icon: Icon(
                    FontAwesomeIcons.penToSquare,
                    size: 20,
                    color: context.secondaryTextColor,
                  ),
                ),
                if (widget.billEntity.billType == 8)
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: IconButton(
                      onPressed: () async {
                        billController.updateOldBill(widget.billEntity, 9, 'a');
                      },
                      icon: FaIcon(
                        FontAwesomeIcons.arrowTurnDown,
                        color: context.secondaryTextColor,
                        size: 20,
                      ),
                    ),
                  ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    FontAwesomeIcons.trashCan,
                    size: 20,
                    color: context.secondaryTextColor,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    FontAwesomeIcons.share,
                    size: 20,
                    color: context.secondaryTextColor,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    FontAwesomeIcons.print,
                    size: 20,
                    color: context.secondaryTextColor,
                  ),
                ),
                const Spacer(),
                const CircleBackBtnWidget(),
                context.g8,
              ],
            ),
            context.g12,
            Expanded(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: context.secondaryTextColor.withOpacity(0.2)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              date_formater.DateFormat.MEd()
                                  .format(widget.billEntity.billDate),
                              style: context.bodySmall,
                            ),
                            const Spacer(),
                            Text(
                              widget.billEntity.billNumber.toString(),
                              style: context.titleMedium,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              'رقم الفاتورة',
                              style: context.bodySmall,
                            ),
                          ],
                        ),
                        context.g8,
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'العملة',
                                  style: context.bodySmall,
                                ),
                                Text(
                                  widget.curencyEntity?.name ?? '',
                                  style: context.titleMedium,
                                ),
                              ],
                            ),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'اسم العميل',
                                  style: context.bodySmall,
                                ),
                                Text(
                                  widget.customer ?? '',
                                  style: context.titleMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  context.g20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      PymentMethodWidget(bill: widget.billEntity),
                      context.g8,
                      BillTypeWidget(bill: widget.billEntity),
                      const Spacer(),
                      context.g8,
                      Text(
                        'تفاصيل الفاتورة',
                        style: context.titleMedium,
                      ),
                    ],
                  ),
                  const ThinDividerWidget(),
                  Expanded(
                    child: Obx(
                      () => ListView.separated(
                        shrinkWrap: true,
                        itemCount: billController.billDetails.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return const ThinDividerWidget();
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return BillDetailsItemWidget(
                            billDetailsUI: billController.billDetails[index],
                          );
                        },
                      ),
                    ),
                  ),
                  // const ThinDividerWidget(),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: context.secondaryTextColor.withOpacity(0.2)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'الخصم والضريبة',
                          style: context.titleLarge,
                        ),
                        context.g8,
                        Row(
                          children: [
                            Text(
                              widget.billEntity.billDiscount.toString(),
                              style: context.titleMedium,
                            ),
                            context.g8,
                            Text(
                              'الخصم المضاف:',
                              textDirection: TextDirection.rtl,
                              style: context.bodyLarge,
                            ),
                            const Spacer(),
                            Text(
                              widget.billEntity.itemsDiscount.toString(),
                              style: context.titleMedium,
                            ),
                            context.g8,
                            Text(
                              'خصم المواد:',
                              textDirection: TextDirection.rtl,
                              style: context.bodyLarge,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  context.g4,
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: context.secondaryTextColor.withOpacity(0.2),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Text(
                              '%${widget.billEntity.salesTaxRate.toStringAsFixed(2)}',
                              style: context.titleMedium,
                            ),
                            context.g8,
                            Text(
                              'ضريبة المبيعات:',
                              textDirection: TextDirection.rtl,
                              style: context.bodyLarge,
                            ),
                            const Spacer(),
                            Text(
                              '${widget.billEntity.totalVat}',
                              style: context.titleMedium,
                            ),
                            context.g8,
                            Text(
                              "الضريبة المضافة:",
                              textDirection: TextDirection.rtl,
                              style: context.bodyLarge,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),

                  context.g8,
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: context.secondaryTextColor.withOpacity(0.2),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Text(
                          widget.billEntity.billFinalCost.toString(),
                          style: context.displayLarge.copyWith(
                            color: context.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        Text("الإجمالي:",
                            textDirection: TextDirection.rtl,
                            style: context.displayMedium.copyWith(
                              color: context.primary,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                  ),
                  context.g20,
                ],
              ).ph(16),
            )
          ],
        ),
      ),
    );
  }
}

class BillDetailsItemWidget extends StatelessWidget {
  final BillDetailsUI billDetailsUI;
  BillDetailsItemWidget({
    super.key,
    required this.billDetailsUI,
  });
  final BillController billController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: Get.width / 6,
              child: Text(
                billDetailsUI.billDetailsEntity.totalSellPrice.toString(),
                style: context.bodyLarge.copyWith(color: context.blackColor),
              ),
            ),
            SizedBox(
              width: Get.width / 10,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  billDetailsUI.billDetailsEntity.quantity.toString(),
                  style: context.bodySmall.copyWith(
                    color: context.blackColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: Get.width / 6,
              child: Text(
                billDetailsUI.billDetailsEntity.sellPrice.toString(),
                style: context.bodySmall.copyWith(
                  color: context.blackColor,
                ),
              ),
            ),
            SizedBox(
              width: Get.width / 7,
              child: Text(
                billDetailsUI.unitName,
                style: context.bodySmall.copyWith(
                  color: context.blackColor,
                ),
              ),
            ),
            Expanded(
              child: FittedBox(
                alignment: Alignment.centerRight,
                fit: BoxFit.scaleDown,
                child: Text(
                  billDetailsUI.itemName,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                  style: context.bodySmall.copyWith(
                    color: context.blackColor,
                  ),
                ),
              ),
            )
          ],
        ),
        const Row(
          children: [],
        )
      ],
    );
  }
}
