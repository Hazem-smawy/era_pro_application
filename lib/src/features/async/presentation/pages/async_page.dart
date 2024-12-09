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
                  ElevatedButtonExtension.secondary(
                    label: 'مزامنة',
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      await controller.asyncAll(false);
                      setState(() {
                        isLoading = false;
                      });
                    },
                  ),
                ],
              ),
            ),
            context.g8,
            GestureDetector(
              onTap: () async {
                setState(() {
                  isLoading = true;
                });
                await controller.getStoreItem();
                setState(() {
                  isLoading = false;
                });
                controller.asyncAll(true);
              },
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
                      'مزامنة المواد',
                      style: context.titleMedium,
                    ),
                    context.g8,
                    const Icon(FontAwesomeIcons.shapes)
                  ],
                ),
              ),
            ),
            context.g8,
            Container(
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
                  Text(
                    '100',
                    style: context.titleLarge,
                  ),
                  const Spacer(),
                  Text(
                    'مزامنة السندات',
                    style: context.titleMedium,
                  ),
                  context.g8,
                  const Icon(Icons.cloud_outlined)
                ],
              ),
            )
          ],
        ).p(16),
      ),
    );
  }
}
