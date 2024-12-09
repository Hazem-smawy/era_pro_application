import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/widgets/empty_widget.dart';
import 'package:era_pro_application/src/core/widgets/thin_divider_widget.dart';
import 'package:era_pro_application/src/features/exchange_receipt/domain/entities/exchange_entity.dart';
import 'package:era_pro_application/src/features/exchange_receipt/presentation/getX/exchange_receipt_controller.dart';
import 'package:era_pro_application/src/features/exchange_receipt/presentation/pages/add_new_exchange_sheet.dart';
import 'package:era_pro_application/src/features/exchange_receipt/presentation/pages/exchange_details_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as date_formater;

import '../../../../core/constants/assets.dart';
import '../../../../core/utils/text_field_formater.dart';

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
              BillHeaderWidget(),
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

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 50,
        height: 50,
        child: CircularProgressIndicator(
          color: context.primaryColor,
        ),
      ),
    );
  }
}

class BillHeaderWidget extends StatelessWidget {
  BillHeaderWidget({
    super.key,
  });
  final ExchangeReceiptController exchangeReceiptController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.filter_alt_outlined,
              size: 27,
              color: context.secondaryTextColor,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: AnimatedContainer(
              duration: const Duration(microseconds: 200),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: context.backgroundColor,
              ),
              child: TextFormField(
                inputFormatters: [
                  ArabicToEnglishNumberFormatter(),
                ],
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                style: context.bodyLarge.copyWith(
                  color: context.blackColor,
                  fontWeight: FontWeight.bold,
                ),
                onChanged: (value) {
                  exchangeReceiptController.filterExchange(value);
                },
                onTap: () {},
                decoration: InputDecoration(
                  suffixIcon: Center(
                    child: FaIcon(
                      FontAwesomeIcons.magnifyingGlass,
                      color: context.secondaryTextColor,
                      size: 20,
                    ),
                  ),
                  suffixIconConstraints: const BoxConstraints(
                    maxWidth: 40,
                    maxHeight: 40,
                  ),
                  border: InputBorder.none,
                  hintText: 'البحث عن',
                  hintStyle: context.bodySmall.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
                  contentPadding: const EdgeInsets.only(
                    right: 20,
                    left: 10,
                    // bottom: 6,
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.chevron_right_outlined,
              size: 27,
              color: context.secondaryTextColor,
            ),
          )
        ],
      ),
    );
  }
}

class ExchangeItemWidget extends StatelessWidget {
  ExchangeItemWidget({
    super.key,
    required this.exchangeEntity,
  });
  final ExchangeEntity exchangeEntity;
  final ExchangeReceiptController exchangeReceiptController = Get.find();

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
                    exchangeReceiptController
                            .getCurencyName(
                                exchangeEntity.sandDetails?.first.currencyId ??
                                    1)
                            ?.symbol ??
                        '',
                    style: context.bodySmall,
                  ),
                  context.g4,
                  Text(
                    exchangeEntity.sandDetails?.first.amount.toString() ?? '',
                    style: context.titleMedium.copyWith(
                      color: context.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              context.g4,
              Text(
                exchangeEntity.sandNumber.toString(),
                style: context.titleLarge.copyWith(
                  color: context.blackColor,
                ),
              ),
              context.g4,
              Text(
                ':رقم السند',
                style: context.bodySmall,
              ),
              context.g8,
              ExchangeTypeWidget(
                type: exchangeEntity.sandType,
              ),
            ],
          ),
          context.g8,
          Row(
            children: [
              const Spacer(),
              Text(
                exchangeEntity.reciepentName,
                style: context.titleMedium,
              ),
            ],
          ),
          context.g12,
          Row(
            children: [
              Text(
                date_formater.DateFormat.yMEd().format(exchangeEntity.sandDate),
                style: context.bodyMedium,
              ),
              context.g8,
              Icon(
                Icons.calendar_today_outlined,
                size: 10,
                color: context.secondaryTextColor,
              ),
              const Spacer(),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: IconButton(
                        onPressed: () async {
                          Get.bottomSheet(
                            AddNewExhangeSheet(
                              exchange: exchangeEntity,
                            ),
                            isScrollControlled: true,
                            elevation: 0,
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

class ExchangeTypeWidget extends StatelessWidget {
  const ExchangeTypeWidget({
    super.key,
    required this.type,
  });

  final int type;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: type == 2
              ? context.secondary.withOpacity(0.06)
              : const Color.fromARGB(255, 19, 3, 198).withOpacity(0.06),
        ),
        child: Text(
          type == 2 ? 'سند قبض' : 'سند صرف',
          style: context.bodySmall.copyWith(
            color: type == 2
                ? context.secondary
                : const Color.fromARGB(255, 19, 3, 198),
          ),
        ),
      ),
    );
  }
}
