import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/extensions/padding_extension.dart';
import 'package:era_pro_application/src/core/widgets/header_widget.dart';
import 'package:era_pro_application/src/core/widgets/future_builder_widget.dart';
import 'package:era_pro_application/src/features/main_info/domain/entities/curency_entity.dart';
import 'package:era_pro_application/src/features/main_info/presentation/getX/main_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/curency_item_widget.dart';

class CurenciesInfoPage extends StatelessWidget {
  CurenciesInfoPage({super.key});
  final MainInfoController mainInfoController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.whiteColor,
      body: SafeArea(
          child: Column(
        children: [
          const HeaderWidget(title: 'العملات').ph(15).pt(10),
          context.g12,
          Expanded(
            child: ReusableFutureBuilder<List<CurencyEntity>>(
              future: mainInfoController.getAllCurenciesInfo(),
              builder: (context, data) {
                return ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    color: context.secondaryTextColor.withOpacity(
                      0.2,
                    ),
                  ).pv(10),
                  itemCount: data.length,
                  itemBuilder: (context, index) => CurencyItemWidget(
                    curency: data[index],
                  ),
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}
