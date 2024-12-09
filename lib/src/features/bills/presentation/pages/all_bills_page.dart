import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/types/status_types.dart';
import 'package:era_pro_application/src/core/widgets/empty_widget.dart';
import 'package:era_pro_application/src/core/widgets/loading_widget.dart';
import 'package:era_pro_application/src/features/bills/presentation/getX/bill_controller.dart';
import 'package:era_pro_application/src/features/bills/presentation/widgets/bill_widget/all_bill_list_view_widget.dart';
import 'package:era_pro_application/src/features/bills/presentation/widgets/bill_widget/bill_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/routes/app_pages.dart';

class AllBillsPage extends StatefulWidget {
  const AllBillsPage({super.key});

  @override
  State<AllBillsPage> createState() => _AllBillsPageState();
}

class _AllBillsPageState extends State<AllBillsPage> {
  BillController billController = Get.find();

  @override
  void initState() {
    super.initState();
    billController.getAllBills();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.whiteColor,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: Column(
            children: [
              context.g8,
              BillHeaderWidget(),
              context.g4,
              Expanded(
                child: Obx(() {
                  switch (billController.currentStatus) {
                    case BillsStatus.loading:
                      return const LoadingWidget();
                    case BillsStatus.success:
                      return AllBillListViewWidget(
                        bills: billController.filteredBills,
                      );
                    case BillsStatus.error:
                      return const EmptyWidget(
                        imageName: Assets.assetsImagesCurencies,
                        label: "لاتوجد اي فواتير",
                      );

                    default:
                      return const EmptyWidget(
                        imageName: Assets.assetsImagesCurencies,
                        label: "لاتوجد اي فواتير",
                      );
                  }
                }),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.SELLINGPAGE, arguments: {'type': 8});
        },
        child: const Icon(
          FontAwesomeIcons.plus,
        ),
      ),
    );
  }
}
