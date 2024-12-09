import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/extensions/padding_extension.dart';
import 'package:era_pro_application/src/features/store/presentation/getX/store_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/future_builder_widget.dart';
import '../../../../core/widgets/header_widget.dart';
import '../../domain/entities/store_entity.dart';

class UnitsPage extends StatelessWidget {
  UnitsPage({super.key});
  final StoreController storeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.whiteColor,
      body: SafeArea(
          child: Column(
        children: [
          const HeaderWidget(title: 'الوحدات').ph(15).pt(10),
          context.g12,
          Expanded(
            child: ReusableFutureBuilder<List<UnitEnitity>>(
              future: storeController.getAllUnits(),
              builder: (context, data) {
                return ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  separatorBuilder: (context, index) => context.g8,
                  itemCount: data.length,
                  itemBuilder: (context, index) => UnitItemWidget(
                    unitEnitity: data[index],
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

class UnitItemWidget extends StatelessWidget {
  const UnitItemWidget({super.key, required this.unitEnitity});
  final UnitEnitity unitEnitity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: context.surfaceColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            unitEnitity.name,
            style: context.titleSmall,
          ),
          context.g12,
          FaIcon(
            FontAwesomeIcons.star,
            color: context.secondaryTextColor,
            size: 20,
          )
        ],
      ),
    );
  }
}
