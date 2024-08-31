import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/extensions/padding_extension.dart';
import 'package:era_pro_application/src/core/widgets/header_widget.dart';
import 'package:era_pro_application/src/core/widgets/future_builder_widget.dart';
import 'package:era_pro_application/src/features/main_info/domain/entities/curency_entity.dart';
import 'package:era_pro_application/src/features/main_info/presentation/getX/main_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../widgets/curency_item_widget.dart';

class CurenciesInfoPage extends StatelessWidget {
  CurenciesInfoPage({super.key});
  MainInfoController mainInfoController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.wightColor,
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
                  separatorBuilder: (context, index) => context.g12,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final currency = data[index];
                    return CurencyItemWidget(
                      curency: currency,
                    );
                  },
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}
