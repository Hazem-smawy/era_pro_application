import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/utils/text_field_formater.dart';
import 'package:era_pro_application/src/features/bills/presentation/getX/bill_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class BillHeaderWidget extends StatelessWidget {
  BillHeaderWidget({
    super.key,
  });
  final BillController billController = Get.find();

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
                  billController.filterBills(value);
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
