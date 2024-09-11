import 'package:era_pro_application/src/core/constants/spaces_sizes.dart';
import 'package:era_pro_application/src/core/constants/strings.dart';
import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/widgets/header_widget.dart';
import 'package:era_pro_application/src/core/widgets/title_info_widget.dart';
import 'package:era_pro_application/src/features/store/presentation/getX/store_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreInfoDetailsPage extends StatelessWidget {
  StoreInfoDetailsPage({super.key});

  final StoreController storeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const HeaderWidget(title: 'تفاصيل المخزن'),
            context.g16,
            Container(
              padding: const EdgeInsets.all(Spaces.sp12),
              margin: const EdgeInsets.all(Spaces.sp12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: context.wightColor,
              ),
              child: Obx(
                () => Column(
                  children: [
                    TitleInfoWidget(
                      title: storeNameLabel,
                      subTitle: storeController.userStoreInfo.value?.name ?? '',
                    ),
                    TitleInfoWidget(
                      title: storeAccountInTheDalil,
                      subTitle: storeController
                              .userStoreInfo.value?.accountNumber
                              .toString() ??
                          '',
                    ),
                    TitleInfoWidget(
                      title: phone,
                      subTitle:
                          storeController.userStoreInfo.value?.managerPhone ??
                              '',
                    ),
                    if (storeController.userStoreInfo.value?.note != '')
                      TitleInfoWidget(
                        title: address,
                        subTitle:
                            storeController.userStoreInfo.value?.note ?? '',
                        withDivider: false,
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
