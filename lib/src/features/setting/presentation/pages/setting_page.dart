import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/widgets/thin_divider_widget.dart';
import 'package:era_pro_application/src/features/user/presentation/getX/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../core/extensions/image_with_error_extension.dart';

class SettingPage extends StatelessWidget {
  SettingPage({super.key});

  UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(125),
                  border: Border.all(
                    color: context.secondary.withOpacity(0.5),
                    width: 2,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(125),
                  child: CustomImage.memoryWithError(
                    userController.user.value?.image,
                    w: 150,
                    h: 150,
                  ),
                ),
              ),
              context.g12,
              // _buildSectionTitle(context, 'الحساب'),
              const SizedBox(height: 16),
              _buildSettingTile(
                context: context,
                icon: Icons.person_2_outlined,
                title: 'الصفحة الشخصية',
                subtitle: 'Edit your profile information',
                onTap: () {
                  // Navigate to profile settings
                },
              ),
              const ThinDividerWidget(),
              _buildSettingTile(
                context: context,
                icon: Icons.build_outlined,
                title: 'اعدادات المخزون',
                subtitle: 'Edit your profile information',
                onTap: () {
                  // Navigate to profile settings
                },
              ),
              const ThinDividerWidget(),

              const Spacer(),
              const ThinDividerWidget(),

              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'تسجيل الخورج',
                      style: context.titleLarge.copyWith(color: Colors.red),
                    ),
                    context.g12,
                    Icon(
                      FontAwesomeIcons.arrowRightFromBracket,
                      color: Colors.red.withOpacity(0.7),
                    ),
                  ],
                ),
              ),
              context.g56,
              context.g56,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        title,
        textAlign: TextAlign.right,
        style: context.titleLarge,
      ),
    );
  }

  Widget _buildSettingTile({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(
            Icons.chevron_left,
            color: context.secondaryTextColor,
          ),
          const Spacer(),
          Text(
            title,
            style: context.titleLarge,
          ),
          context.g8,
          Icon(icon),
        ],
      ),
    );
  }
}
