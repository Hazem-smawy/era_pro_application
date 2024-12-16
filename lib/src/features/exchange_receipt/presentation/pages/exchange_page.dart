import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/widgets/empty_widget.dart';
import 'package:era_pro_application/src/core/widgets/loading_widget.dart';
import 'package:era_pro_application/src/core/widgets/thin_divider_widget.dart';
import 'package:era_pro_application/src/features/exchange_receipt/domain/entities/exchange_entity.dart';
import 'package:era_pro_application/src/features/exchange_receipt/presentation/getX/exchange_receipt_controller.dart';
import 'package:era_pro_application/src/features/exchange_receipt/presentation/pages/add_new_exchange_sheet.dart';
import 'package:era_pro_application/src/features/exchange_receipt/presentation/pages/exchange_details_page.dart';
import 'package:era_pro_application/src/features/exchange_receipt/presentation/widgets/exchange_header_widget.dart';
import 'package:era_pro_application/src/features/exchange_receipt/presentation/widgets/exchange_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../core/constants/assets.dart';

class AllExhangePage extends StatefulWidget {
  const AllExhangePage({
    super.key,
  });

  @override
  State<AllExhangePage> createState() => _AllExhangePageState();
}

class _AllExhangePageState extends State<AllExhangePage> {
  ExchangeReceiptController exchangeReceiptController = Get.find();
  @override
  void initState() {
    super.initState();
    exchangeReceiptController.initPaymentsMethod();
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
              ExchangeHeaderWidget(),
              context.g4,
              Expanded(
                child: Obx(
                  () {
                    // Check the status value directly
                    final status = exchangeReceiptController.status.value;

                    if (status == RxStatus.empty()) {
                      // Show EmptyWidget when status is empty
                      return const EmptyWidget(
                        imageName: Assets.assetsImagesCurencies,
                        label: "لاتوجد اي سندات",
                      );
                    } else if (status == RxStatus.loading()) {
                      // Show LoadingWidget when status is loading
                      return const LoadingWidget();
                    } else {
                      return ExchangeListViewWidget(
                        exchange:
                            exchangeReceiptController.filteredExchangeList,
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.bottomSheet(
            const AddNewExhangeSheet(),
            isScrollControlled: true,
            elevation: 0,
          );
        },
        child: const Icon(
          FontAwesomeIcons.plus,
        ),
      ),
    );
  }
}

class ExchangeListViewWidget extends StatelessWidget {
  const ExchangeListViewWidget({super.key, required this.exchange});
  final List<ExchangeEntity> exchange;

  @override
  Widget build(BuildContext context) {
    return exchange.isEmpty
        ? const EmptyWidget(
            imageName: Assets.assetsImagesCurencies,
            label: "لاتوجد اي سندات",
          )
        : ListView.separated(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            itemCount: exchange.length,
            shrinkWrap: true,
            separatorBuilder: (BuildContext context, int index) {
              return const ThinDividerWidget();
            },
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Get.to(ExchangeDetailsPage(
                    exchange: exchange[index],
                  ));
                },
                child: ExchangeItemWidget(
                  exchangeEntity: exchange[index],
                ),
              );
            },
          );
  }
}
