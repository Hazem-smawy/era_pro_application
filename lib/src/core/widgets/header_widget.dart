import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            //Get.back();
          },
          icon: Icon(
            Icons.more_vert_rounded,
            size: 22,
            color: context.secondaryTextColor,
          ),
        ),
        Text(
          title,
          style: context.titleMedium,
        ),
        Container(
          width: 38,
          height: 38,
          margin: const EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: context.secondaryTextColor.withOpacity(0.1),
            ),
          ),
          child: Center(
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                FontAwesomeIcons.chevronRight,
                size: 20,
                color: context.secondaryTextColor,
              ),
            ),
          ),
        )
      ],
    );
  }
}
