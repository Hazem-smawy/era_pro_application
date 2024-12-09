import 'package:era_pro_application/src/core/constants/strings.dart';
import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/extensions/image_with_error_extension.dart';
import 'package:era_pro_application/src/features/async/presentation/getX/async_controller.dart';
import 'package:era_pro_application/src/features/auth/presentation/pages/login_sheet.dart';
import 'package:era_pro_application/src/features/user/presentation/getX/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class UserProfileWidget extends StatefulWidget {
  final bool fromSync;

  const UserProfileWidget({super.key, this.fromSync = false});

  @override
  State<UserProfileWidget> createState() => _UserProfileWidgetState();
}

class _UserProfileWidgetState extends State<UserProfileWidget> {
  final UserController userController = Get.find();
  final AsyncController asyncController = Get.find();
  bool? connected;

  @override
  void initState() {
    super.initState();
    _checkConnection();
  }

  Future<void> _checkConnection() async {
    if (widget.fromSync) {
      connected = await asyncController.login();
    } else {
      connected = null;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: [
          _buildNotificationIcon(context),
          const Spacer(),
          _buildUserProfile(context),
        ],
      ),
    );
  }

  Widget _buildNotificationIcon(BuildContext context) {
    return Container(
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
    );
  }

  Widget _buildUserProfile(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.bottomSheet(
        const LoginSheet(),
        isScrollControlled: true,
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                userWellcomString,
                style: context.bodySmall,
              ),
              Text(
                userController.user.value?.userName ?? "لايوجد",
                style: context.titleMedium,
              ),
            ],
          ),
          context.g16,
          _buildUserImage(context),
        ],
      ),
    );
  }

  Widget _buildUserImage(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: CustomImage.memoryWithError(
              userController.user.value?.image,
              w: 50,
              h: 50,
            ),
          ),
        ),
        if (connected != null)
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                border: Border.all(
                  color: context.whiteColor,
                  width: 2,
                ),
                shape: BoxShape.circle,
                color: connected! ? Colors.green : Colors.red,
              ),
            ),
          ),
      ],
    );
  }
}
