// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class CancelBtnWidget extends StatelessWidget {
  const CancelBtnWidget({
    super.key,
    required this.action,
    required this.label,
  });
  final String label;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Get.to(() => const CompleteSellingBillScreen());
      },
      child: Container(
        height: 50,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.red.withOpacity(0.08),
        ),
        child: Center(
          child: Text(
            label,
            style: context.titleMedium.copyWith(
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
