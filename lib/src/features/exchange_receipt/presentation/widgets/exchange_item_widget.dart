import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/extensions/padding_extension.dart';
import 'package:era_pro_application/src/core/utils/arabic_date_formater.dart';
import 'package:era_pro_application/src/features/exchange_receipt/domain/entities/exchange_entity.dart';
import 'package:era_pro_application/src/features/exchange_receipt/presentation/getX/exchange_receipt_controller.dart';
import 'package:era_pro_application/src/features/exchange_receipt/presentation/pages/add_new_exchange_sheet.dart';
import 'package:era_pro_application/src/features/exchange_receipt/presentation/widgets/exchange_type_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

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
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                formatDateToArabic(exchangeEntity.sandDate),
                style: context.bodyMedium,
              ),
              const SizedBox(
                width: 8,
              ),
              Icon(
                Icons.calendar_today_outlined,
                size: 17,
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
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: IconButton(
                        onPressed: () async {},
                        icon: FaIcon(
                          FontAwesomeIcons.share,
                          color: iconColor,
                          size: 17,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: IconButton(
                        onPressed: () async {},
                        icon: FaIcon(
                          FontAwesomeIcons.print,
                          color: iconColor,
                          size: 17,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          // context.g4,
        ],
      ),
    );
  }
}
