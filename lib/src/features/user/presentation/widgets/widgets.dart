import 'package:era_pro_applicationlication/src/core/constants/assets.dart';
import 'package:era_pro_applicationlication/src/core/constants/strings.dart';
import 'package:era_pro_applicationlication/src/core/extensions/context_extensions.dart';
import 'package:era_pro_applicationlication/src/features/user/presentation/getX/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class UserProfileWidget extends StatelessWidget {
  UserProfileWidget({super.key});

  final UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50.w,
          height: 40.h,
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
            Obx(
              () => Text(
                userController.user.value.userName,
                style: context.titleLarge,
              ),
            ),
          ],
        ),
        const SizedBox(width: 15),
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          //backgroundColor: const Color(0xffF7BC56),
          child: Image.asset(
            Assets.assetsImagesAvatar1,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
