import 'package:era_pro_application/src/core/constants/spaces_sizes.dart';
import 'package:era_pro_application/src/core/constants/strings.dart';
import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/extensions/image_with_error_extension.dart';
import 'package:era_pro_application/src/features/main_info/presentation/getX/main_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/title_info_widget.dart';

// ignore: must_be_immutable
class CompanyAndBranchInfoPage extends StatelessWidget {
  CompanyAndBranchInfoPage({super.key});

  final MainInfoController mainInfoController = Get.find();

  @override
  Widget build(BuildContext context) {
    mainInfoController.errorMessage.value = '';
    return RefreshIndicator(
      onRefresh: () async {
        await mainInfoController.getCompanyInfo();
        await mainInfoController.getBranchInfo();
      },
      child: Scaffold(
        backgroundColor: context.containerColor,
        body: SafeArea(
            child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                    left: 10,
                    right: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 40,
                      ),
                      Text(
                        companyInfo,
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
                      TitleInfoWidget(
                        title: companyArNameLabel,
                        subTitle: mainInfoController.company.value?.name ?? '',
                      ),
                      Gaps.g8,
                      TitleInfoWidget(
                        title: companyEnNameLabel,
                        subTitle:
                            mainInfoController.company.value?.enName ?? '',
                      ),
                      Gaps.g8,
                      TitleInfoWidget(
                        title: address,
                        subTitle:
                            mainInfoController.company.value?.address ?? '',
                        withDivider: false,
                      ),
                      Gaps.g8,
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
                  branchInfo,
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
                      TitleInfoWidget(
                        title: branchArNameLabel,
                        subTitle: mainInfoController.branch.value?.name ?? "",
                      ),
                      Gaps.g8,
                      TitleInfoWidget(
                        title: 'العنوان',
                        subTitle:
                            mainInfoController.branch.value?.address ?? "",
                      ),
                      Gaps.g8,
                      TitleInfoWidget(
                        title: 'الهاتف',
                        subTitle: mainInfoController.branch.value?.phone ?? "",
                      ),
                      Gaps.g8,
                      TitleInfoWidget(
                        title: 'البريد الإلكتروني',
                        subTitle: mainInfoController.branch.value?.email ?? "",
                      ),
                      Gaps.g8,
                      TitleInfoWidget(
                        title: reporArtHead,
                        subTitle:
                            mainInfoController.branch.value?.arReportHeader ??
                                "لايوجد",
                      ),
                      Gaps.g8,
                      TitleInfoWidget(
                        title: reporEntHead,
                        subTitle:
                            mainInfoController.branch.value?.enReportHeader ??
                                "لايوجد",
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
      ),
    );
  }
}
