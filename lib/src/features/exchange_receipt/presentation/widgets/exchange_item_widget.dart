import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/extensions/padding_extension.dart';
import 'package:era_pro_application/src/core/utils/arabic_date_formater.dart';
import 'package:era_pro_application/src/core/utils/currency_format.dart';
import 'package:era_pro_application/src/features/exchange_receipt/domain/entities/exchange_entity.dart';
import 'package:era_pro_application/src/features/exchange_receipt/presentation/getX/exchange_receipt_controller.dart';
import 'package:era_pro_application/src/features/exchange_receipt/presentation/pages/add_new_exchange_sheet.dart';
import 'package:era_pro_application/src/features/exchange_receipt/presentation/widgets/exchange_type_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ExchangeSubItemWidget extends StatelessWidget {
  ExchangeSubItemWidget({
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
            ],
          ),
          context.g8,
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
                    currencyFormat(
                        number: exchangeEntity.sandDetails?.first.amount
                                .toString() ??
                            ''),
                    style: context.titleMedium.copyWith(
                      color: context.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
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
                    context.g8,
                    ExchangeTypeWidget(
                      type: exchangeEntity.sandType,
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

class ExchangeItemWidget extends StatelessWidget {
  ExchangeItemWidget({
    super.key,
    required this.exchangeEntity,
  });
  final ExchangeEntity exchangeEntity;
  final ExchangeReceiptController exchangeReceiptController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Slidable(
      // Specify a key if the Slidable is dismissible.
      key: const ValueKey(0),

      // The start action pane is the one at the left or the top side.
      startActionPane: ActionPane(
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),

        // A pane can dismiss the Slidable.
        dismissible: DismissiblePane(onDismissed: () {}),

        // All actions are defined in the children parameter.
        children: [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            onPressed: (context) {},
            // backgroundColor: context.containerColor,
            foregroundColor: Colors.black,
            icon: FontAwesomeIcons.arrowTurnDown,
            label: 'مرتجع',
          ),
          SlidableAction(
            onPressed: (context) {
              Get.bottomSheet(
                AddNewExhangeSheet(
                  exchange: exchangeEntity,
                ),
                isScrollControlled: true,
                elevation: 0,
              );
            },
            // backgroundColor: context.containerColor,
            foregroundColor: Colors.black,
            icon: FontAwesomeIcons.penToSquare,
            label: 'تعديل',
          ),
        ],
      ),

      // // The end action pane is the one at the right or the bottom side.
      // endActionPane: const ActionPane(
      //   motion: ScrollMotion(),
      //   children: [
      //     // SlidableAction(
      //     //   // An action can be bigger than the others.
      //     //   flex: 2,
      //     //   onPressed: (context) {},
      //     //   backgroundColor: const Color(0xFF7BC043),
      //     //   foregroundColor: Colors.white,
      //     //   icon: Icons.archive,
      //     //   label: 'Archive',
      //     // ),
      //     // SlidableAction(
      //     //   onPressed: (context) {},
      //     //   backgroundColor: const Color(0xFF0392CF),
      //     //   foregroundColor: Colors.white,
      //     //   icon: Icons.save,
      //     //   label: 'Save',
      //     // ),
      //   ],
      // ),

      // The child of the Slidable is what the user sees when the
      // component is not dragged.
      child: ExchangeSubItemWidget(
        exchangeEntity: exchangeEntity,
      ),
    );
  }
}
