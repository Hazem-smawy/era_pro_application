import 'package:era_pro_application/src/core/constants/assets.dart';
import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/extensions/padding_extension.dart';
import 'package:era_pro_application/src/core/routes/app_pages.dart';
import 'package:era_pro_application/src/core/types/status_types.dart';
import 'package:era_pro_application/src/core/widgets/empty_widget.dart';
import 'package:era_pro_application/src/features/store/presentation/getX/store_controller.dart';
import 'package:era_pro_application/src/core/widgets/categories_widget.dart';
import 'package:era_pro_application/src/features/store/presentation/pages/item_details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/search_bar_widget.dart';
import '../widgets/store_item_widget.dart';

class StoreInfoPage extends StatefulWidget {
  const StoreInfoPage({super.key});

  @override
  State<StoreInfoPage> createState() => _StoreInfoPageState();
}

class _StoreInfoPageState extends State<StoreInfoPage> {
  StoreController storeController = Get.find();
  @override
  void initState() {
    super.initState();
    storeController.getAllStoreInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.backgroundColor,
      body: SafeArea(
          child: Column(
        children: [
          context.g8,
          SizedBox(
            height: 50,
            child: Row(
              children: [
                const SizedBox(
                  width: 5,
                ),
                IconButton(
                  onPressed: () {
                    Get.toNamed(Routes.STOREDETAILS);
                  },
                  icon: Icon(
                    Icons.info_outline,
                    size: 30,
                    color: context.secondaryTextColor,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    storeController.isFilterByQuantity.value =
                        !storeController.isFilterByQuantity.value;
                    storeController.filterByQuantity();
                  },
                  icon: Obx(
                    () => Icon(
                      !storeController.isFilterByQuantity.value
                          ? Icons.filter_alt_outlined
                          : Icons.filter_alt_off,
                      size: 30,
                      color: context.secondaryTextColor,
                    ),
                  ),
                ).ph(5),
                Expanded(
                  child: SearchAppbarWidget(
                    action: (p0) {
                      storeController.searchByName(p0);
                    },
                  ),
                ),
              ],
            ),
          ),
          context.g12,
          Row(
            children: [
              Expanded(
                child: Obx(
                  () => CategoriesWidget(
                    idExtractor: (p0) => p0.code,
                    nameExtractor: (p0) => p0.name,
                    items: storeController.allItemGroups.value,
                    selectedId: storeController.selectedGroupId.value,
                    action: (p0) {
                      storeController.changeCategory(p0);
                    },
                  ),
                ),
              ),
            ],
          ),
          context.g12,
          Expanded(child: Obx(
            () {
              switch (storeController.currentStatus) {
                case StoreStatus.empty:
                  return const EmptyWidget(
                    imageName: Assets.assetsImagesCurencies,
                    label: "لاتوجد اي منتجات",
                  );
                case StoreStatus.loading:
                  return Container(
                    alignment: Alignment.center,
                    width: 50,
                    height: 50,
                    child: const CircularProgressIndicator(),
                  );
                case StoreStatus.error:
                  return EmptyWidget(
                    imageName: Assets.assetsImagesCurencies,
                    label:
                        storeController.storeStatus.value.errorMessage ?? 'خطأ',
                  );

                case StoreStatus.success:
                  return storeController.itemsInCategory.value.isEmpty
                      ? const EmptyWidget(
                          imageName: Assets.assetsImagesCurencies,
                          label: "لاتوجد اي منتجات",
                        )
                      : Directionality(
                          textDirection: TextDirection.rtl,
                          child: GridView.builder(
                            padding: const EdgeInsets.only(
                              bottom: 20,
                            ),
                            reverse: false,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1 / 1,
                              mainAxisSpacing: context.sp12,
                              crossAxisSpacing: context.sp12,
                            ),
                            itemCount:
                                storeController.itemsInCategory.value.length,
                            itemBuilder: (BuildContext context, int index) {
                              var item =
                                  storeController.itemsInCategory.value[index];
                              return GestureDetector(
                                onTap: () => Get.to(
                                  () => ItemDetailsPage(
                                    storeItemDetailsEntity: item,
                                  ),
                                ),
                                child: ItemWidget(itemEntity: item),
                              );
                            },
                          ).ph(15),
                        );
              }
            },
          ))
          // Expanded(
          //   child: Obx(
          //     () => storeController.storeStatus.value == RxStatus.empty()
          //         ? storeController.storeStatus.value == RxStatus.loading()
          //             ? Container(
          //                 alignment: Alignment.center,
          //                 width: 50,
          //                 height: 50,
          //                 child: const CircularProgressIndicator(),
          //               )
          //             : const EmptyWidget(
          //                 imageName: Assets.assetsImagesCurencies,
          //                 label: "لاتوجد اي منتجات")
          //         : storeController.storeStatus.value == RxStatus.error()
          //             ? const EmptyWidget(
          //                 imageName: Assets.assetsImagesCurencies,
          //                 label: "لاتوجد اي منتجات")
          //             : Directionality(
          //                 textDirection: TextDirection.rtl,
          //                 child: GridView.builder(
          //                   padding: const EdgeInsets.only(
          //                     bottom: 20,
          //                   ),
          //                   reverse: false,
          //                   gridDelegate:
          //                       SliverGridDelegateWithFixedCrossAxisCount(
          //                     crossAxisCount: 2,
          //                     childAspectRatio: 1 / 0.9,
          //                     mainAxisSpacing: context.sp12,
          //                     crossAxisSpacing: context.sp12,
          //                   ),
          //                   itemCount:
          //                       storeController.itemsInCategory.value.length,
          //                   itemBuilder: (BuildContext context, int index) {
          //                     var item =
          //                         storeController.itemsInCategory.value[index];
          //                     return GestureDetector(
          //                         onTap: () => Get.to(
          //                               () => ItemDetailsPage(
          //                                 storeItemDetailsEntity: item,
          //                               ),
          //                             ),
          //                         child: ItemWidget(itemEntity: item));
          //                   },
          //                 ).ph(15),
          //               ),
          //   ),
          // ),
        ],
      )),
    );
  }
}
