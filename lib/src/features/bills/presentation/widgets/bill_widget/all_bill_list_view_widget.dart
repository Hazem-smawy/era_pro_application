import 'package:era_pro_application/src/core/constants/assets.dart';
import 'package:era_pro_application/src/core/widgets/empty_widget.dart';
import 'package:era_pro_application/src/core/widgets/thin_divider_widget.dart';
import 'package:era_pro_application/src/features/bills/domain/repositories/bill_repository.dart';
import 'package:era_pro_application/src/features/bills/presentation/getX/bill_controller.dart';
import 'package:era_pro_application/src/features/bills/presentation/pages/bill_details_page.dart';
import 'package:era_pro_application/src/features/bills/presentation/widgets/bill_widget/bill_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBillListViewWidget extends StatelessWidget {
  AllBillListViewWidget({super.key, required this.bills});
  final List<BillWithDetailsUI> bills;
  final BillController billController = Get.find();

  @override
  Widget build(BuildContext context) {
    return bills.isEmpty
        ? const EmptyWidget(
            imageName: Assets.assetsImagesCurencies,
            label: "لاتوجد اي منتجات",
          )
        : ListView.separated(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            itemCount: bills.length,
            shrinkWrap: true,
            separatorBuilder: (BuildContext context, int index) {
              return const ThinDividerWidget();
            },
            itemBuilder: (BuildContext context, int index) {
              final billDetails = bills[index];
              return GestureDetector(
                onTap: () {
                  Get.to(() => BillDetailsPage(
                      billEntity: billDetails.bill,
                      customer: billDetails.customer.accName,
                      curencyEntity: billDetails.curencyEntity));
                },
                child: BillItemWidget(
                  billWithDetailsUI: billDetails,
                ),
              );
            },
          );
  }
}
