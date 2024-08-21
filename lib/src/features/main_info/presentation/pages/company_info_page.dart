import 'package:era_pro_application/src/core/constants/spaces_sizes.dart';
import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/extensions/image_with_error_extension.dart';
import 'package:era_pro_application/src/features/main_info/presentation/getX/main_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../widgets/company_info_item_widget.dart';

// ignore: must_be_immutable
class CompanyAndBranchInfoPage extends StatelessWidget {
  CompanyAndBranchInfoPage({super.key});

  MainInfoController mainInfoController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.containerColor,
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10, left: 10, right: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 40,
                    ),
                    Text(
                      'معلومات الشركة',
                      style: context.titleMedium,
                    ),
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: FaIcon(
                        FontAwesomeIcons.arrowRight,
                        size: 20,
                        color: context.secondaryTextColor,
                      ),
                    )
                  ],
                ),
              ),
              Gaps.g20,
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: context.wightColor,
                ),
                child: Column(
                  children: [
                    Gaps.g16,
                    CustomImage.memoryWithError(
                      mainInfoController.branch.value?.logo,
                      h: 100,
                      w: 100,
                    ),
                    Text(
                      mainInfoController.company.value?.name ?? '',
                      style: context.titleLarge,
                    ),
                    Gaps.g16,
                    CompanyInfoItemWidget(
                      title: 'اسم الشركة بالعربي',
                      subTitle: mainInfoController.company.value?.name ?? '',
                    ),
                    Gaps.g8,
                    CompanyInfoItemWidget(
                      title: 'العنوان',
                      subTitle: mainInfoController.company.value?.address ?? '',
                    ),
                    Gaps.g8,
                    CompanyInfoItemWidget(
                      title: 'الموقع الالكتروني',
                      subTitle: mainInfoController.company.value?.website ?? '',
                    ),
                    Gaps.g8,
                    CompanyInfoItemWidget(
                      title: 'اسم الشركة بالإنجليزية',
                      subTitle: mainInfoController.company.value?.enName ?? '',
                      withDivider: false,
                    ),
                  ],
                ),
              ),
              if (mainInfoController.errorMessage.value != '')
                Text(
                  mainInfoController.errorMessage.value,
                  style: context.bodySmall,
                ),
              Gaps.g28,
              Text(
                'معلومات الفرع',
                style: context.titleLarge,
              ),
              Gaps.g16,
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: context.wightColor,
                ),
                child: Column(
                  children: [
                    Gaps.g16,
                    CustomImage.memoryWithError(
                      mainInfoController.branch.value?.logo,
                      h: 100,
                      w: 100,
                    ),
                    Gaps.g8,
                    Gaps.g16,
                    CompanyInfoItemWidget(
                      title: 'اسم  الفرع',
                      subTitle: mainInfoController.branch.value?.name ?? "",
                    ),
                    Gaps.g8,
                    CompanyInfoItemWidget(
                      title: 'العنوان',
                      subTitle: mainInfoController.branch.value?.address ?? "",
                    ),
                    Gaps.g8,
                    CompanyInfoItemWidget(
                      title: 'الهاتف',
                      subTitle: mainInfoController.branch.value?.phone ?? "",
                    ),
                    Gaps.g8,
                    CompanyInfoItemWidget(
                      title: 'البريد الإلكتروني',
                      subTitle: mainInfoController.branch.value?.email ?? "",
                      withDivider: false,
                    ),
                  ],
                ),
              ),
              Gaps.g28,
            ],
          ),
        ),
      )),
    );
  }
}
