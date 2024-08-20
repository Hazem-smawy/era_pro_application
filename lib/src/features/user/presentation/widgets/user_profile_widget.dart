import 'package:era_pro_application/src/core/constants/spaces_sizes.dart';
import 'package:era_pro_application/src/core/constants/strings.dart';
import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/extensions/image_with_error_extension.dart';
import 'package:era_pro_application/src/features/user/presentation/getX/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class UserProfileWidget extends StatelessWidget {
  UserProfileWidget({super.key});

  final UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: [
          Container(
            width: 60,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: context.secondaryTextColor.withOpacity(0.3),
              ),
            ),
            child: Center(
              child: FaIcon(
                FontAwesomeIcons.bell,
                color: context.primaryColor,
              ),
            ),
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                userWellcomString,
                style: context.bodySmall,
              ),
              Text(
                userController.user.value?.userName ?? "لايوجد",
                style: context.bodyLarge,
                // style: Get.textTheme.bodyLarge,
              ),
            ],
          ),
          context.g16,
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: CustomImage.memoryWithError(
              userController.user.value?.image,
              w: 50,
              h: 50,
            ),
          ),
        ],
      ),
    );
  }
}
