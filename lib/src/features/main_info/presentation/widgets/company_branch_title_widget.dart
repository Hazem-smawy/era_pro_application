import 'package:era_pro_application/src/core/constants/spaces_sizes.dart';
import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/extensions/padding_extension.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CompanyBranchTitleWidget extends StatelessWidget {
  CompanyBranchTitleWidget(
      {super.key,
      required this.title,
      required this.subTitle,
      this.withDivider = true});
  final String title;
  final String subTitle;
  bool withDivider = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                title,
                textAlign: TextAlign.end,
                textDirection: TextDirection.rtl,
                style: context.bodySmall,
              ),
            ],
          ),
          Gaps.g8,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                subTitle,
                textAlign: TextAlign.end,
                style: context.titleMedium,
              ),
            ],
          ),
          if (withDivider)
            Divider(
              color: context.containerColor.withOpacity(0.5),
            ).pt(10)
        ],
      ).pb(!withDivider ? 10 : 0),
    );
  }
}
