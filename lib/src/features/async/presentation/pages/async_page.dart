import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/extensions/elvated_btn_extension.dart';
import 'package:era_pro_application/src/core/extensions/padding_extension.dart';
import 'package:era_pro_application/src/features/async/presentation/getX/async_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../user/presentation/widgets/user_profile_widget.dart';

class AsyncPage extends StatefulWidget {
  const AsyncPage({super.key});

  @override
  State<AsyncPage> createState() => _AsyncPageState();
}

class _AsyncPageState extends State<AsyncPage> {
  bool isLoading = false;
  String? errorMessage;
  AsyncController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.whiteColor,
      body: SafeArea(
        child: Column(
          children: [
            context.g8,
            const UserProfileWidget(
              key: ValueKey('sync_page'),
              fromSync: true,
            ),
            context.g20,
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(
                  color: context.secondaryTextColor.withOpacity(0.2),
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  isLoading
                      ? SizedBox(
                          height: 100,
                          width: 100,
                          child: CircularProgressIndicator(
                            color: context.primary,
                          ).p(20),
                        )
                      : Icon(
                          Icons.cloud_outlined,
                          size: 100,
                          color: context.secondaryTextColor,
                        ),
                  context.g16,
                  Text(
                    'مزامنة الكل',
                    style: context.titleMedium,
                  ),
                  context.g4,
                  Text(
                    'مزامنة كل المعلومات في التطبيق وتحديث المعلومات التي حصل عليها تغير مثل معلومات الشركة والفرغ والغملات ورفغ الفواتير و السندات الجديده',
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    style: context.bodySmall,
                  ).ph(20),
                  context.g12,
                  GestureDetector(
                    onTap: () async {
                      setState(() {
                        isLoading = true;
                      });
                      await controller.asyncAll(false);
                      setState(() {
                        isLoading = false;
                      });
                    },
                    child: Container(
                      width: context.width / 2,
                      // height: 50,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: context.secondary,
                      ),
                      child: Center(
                        child: Text(
                          'مزامنة',
                          style: context.titleLarge.copyWith(
                            color: context.whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            context.g8,
            AsyncItemWidget(
              action: () async {
                setState(() {
                  isLoading = true;
                });
                await controller.getStoreItem();
                setState(() {
                  isLoading = false;
                });
                controller.asyncAll(true);
              },
              label: 'مزامنة المواد',
              icon: Icons.shopping_bag_outlined,
            ),
            context.g8,
            AsyncItemWidget(
              action: () async {
                setState(() {
                  isLoading = true;
                });
                await controller.getStoreItem();
                setState(() {
                  isLoading = false;
                });
                controller.asyncAll(true);
              },
              label: 'مزامنة الحسابات',
              icon: Icons.person_2_outlined,
            ),
            context.g8,
          ],
        ).p(16),
      ),
    );
  }
}

class AsyncItemWidget extends StatelessWidget {
  const AsyncItemWidget({
    super.key,
    required this.action,
    required this.icon,
    required this.label,
  });
  final IconData icon;
  final String label;
  final Function action;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(
            color: context.secondaryTextColor.withOpacity(0.2),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.arrow_upward_outlined,
              size: 15,
            ),
            context.g4,
            Text(
              '100',
              style: context.titleLarge.copyWith(
                color: context.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Text(
              label,
              style: context.titleMedium,
            ),
            context.g8,
            Icon(
              icon,
              size: 20,
              color: context.blackColor.withOpacity(0.7),
            )
          ],
        ),
      ),
    );
  }
}
