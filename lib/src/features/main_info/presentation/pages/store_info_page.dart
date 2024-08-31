import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/extensions/padding_extension.dart';
import 'package:era_pro_application/src/features/main_info/domain/entities/item_entity.dart';
import 'package:era_pro_application/src/features/main_info/presentation/getX/main_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/future_builder_widget.dart';
import '../../../../core/widgets/search_bar_widget.dart';
import '../widgets/store_item_widget.dart';

class StoreInfoPage extends StatelessWidget {
  StoreInfoPage({super.key});
  MainInfoController mainInfoController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.bg,
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 50,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    FontAwesomeIcons.filter,
                    size: 20,
                    color: context.secondaryTextColor,
                  ),
                ),
                const Expanded(
                  child: SearchAppbarWidget(),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 40,
            child: Row(
              children: [
                Expanded(
                  child: AnimatedContainer(
                    duration: const Duration(microseconds: 200),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      // color: const Color(0xff777777),
                    ),
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      reverse: true,
                      itemCount: 2,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          width: 5,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 40,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: context.wightColor,
                          ),
                          child: Center(
                            child: Text(
                              "كل التصنيفات",
                              style: context.bodySmall,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: context.secondary,
                    border: Border.all(
                      color: context.secondaryTextColor.withOpacity(0.2),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'الكل',
                      style: context.bodyMeduim?.copyWith(
                        color: context.wightColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 1,
            child: ReusableFutureBuilder<List<ItemEntity>>(
              future: mainInfoController.getAllItems(),
              builder: (context, data) {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.1,
                    mainAxisSpacing: context.sp12,
                    crossAxisSpacing: context.sp12,
                  ),
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    var item = data[index];
                    return ItemWidget(itemEntity: item);
                  },
                );
              },
            ).p(15),
          ),
        ],
      )),
    );
  }
}
