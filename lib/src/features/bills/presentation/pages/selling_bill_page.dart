// // ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/extensions/padding_extension.dart';
import 'package:era_pro_application/src/core/types/status_types.dart';
import 'package:era_pro_application/src/core/widgets/header_widget.dart';
import 'package:era_pro_application/src/core/widgets/loading_widget.dart';
import 'package:era_pro_application/src/features/bills/presentation/getX/bill_controller.dart';
import 'package:era_pro_application/src/features/bills/presentation/getX/item_controller.dart';
import 'package:era_pro_application/src/features/bills/presentation/widgets/categoryies_and_search_widget.dart';
import 'package:era_pro_application/src/features/bills/presentation/widgets/selling_bill_footer_widget.dart';
import 'package:era_pro_application/src/features/store/presentation/getX/store_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/widgets/empty_widget.dart';
import '../widgets/selling_bill_item_widget.dart';

// class SellingBillPage extends StatefulWidget {
//   const SellingBillPage({super.key});

//   @override
//   State<SellingBillPage> createState() => _SellingBillPageState();
// }

// class _SellingBillPageState extends State<SellingBillPage> {
//   int type = 0;
//   final TextEditingController nameController = TextEditingController();

//   final StoreController storeController = Get.find();

//   final ItemController itemController = Get.find();
//   final BillController billController = Get.find();

//   @override
//   void initState() {
//     super.initState();

//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       billController.getBillDetailsInfo();
//       itemController.getItems();
//     });

//     // type of bill
//     final arguments = Get.arguments;
//     if (arguments != null && arguments is Map<String, dynamic>) {
//       type = arguments["type"] as int;

//       billController.newBill.value.type = type;
//       itemController.billType.value = type;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: context.whiteColor,
//       resizeToAvoidBottomInset: false,
//       body: SafeArea(
//         child: GestureDetector(
//           onTap: () {
//             FocusScope.of(context).unfocus();
//           },
//           child: Stack(
//             children: [
//               Column(
//                 children: [
//                   context.g4,
//                   HeaderWidget(
//                     sortAction: () {
//                       itemController.sortItem();
//                     },
//                     filterAction: () {
//                       itemController.itemWithQuantity();
//                     },
//                     title: type == 8
//                         ? billController.billTypeForTitle.value == 0
//                             ? 'فاتورة بيع'
//                             : 'تعديل فاتورة بيع'
//                         : billController.billTypeForTitle.value == 0
//                             ? 'فاتورة مرتجع'
//                             : 'تعديل فاتورة مرتجع',
//                   ).pr(10),
//                   context.g12,
//                   const CategoriesWithSearchWidget(),
//                   context.g4,
//                   Expanded(
//                     child: Obx(() {
//                       switch (itemController.currentStatus) {
//                         case ItemStatus.loading:
//                           return const LoadingWidget();
//                         case ItemStatus.success:
//                           return Directionality(
//                             textDirection: TextDirection.rtl,
//                             child: GridView.builder(
//                               padding: const EdgeInsets.only(
//                                   left: 20, right: 20, top: 10, bottom: 160),
//                               gridDelegate:
//                                   const SliverGridDelegateWithFixedCrossAxisCount(
//                                 crossAxisCount: 2,
//                                 childAspectRatio: 0.78,
//                                 crossAxisSpacing: 12,
//                                 mainAxisSpacing: 12,
//                               ),
//                               itemCount: itemController.items.length,
//                               itemBuilder: (BuildContext context, int index) {
//                                 var item = itemController.items[index];

//                                 return SellingBillItemWiget(
//                                   key: ValueKey(item.id),
//                                   index: index,
//                                   item: item,
//                                   isCart: false,
//                                 );
//                               },
//                             ),
//                           );
//                         case ItemStatus.error:
//                           return const EmptyWidget(
//                             imageName: Assets.assetsImagesCurencies,
//                             label: "لاتوجد اي منتجات",
//                           );

//                         default:
//                           return const EmptyWidget(
//                             imageName: Assets.assetsImagesCurencies,
//                             label: "لاتوجد اي منتجات",
//                           );
//                       }
//                     }),
//                   ),
//                 ],
//               ),
//               Positioned(
//                 bottom: 10,
//                 right: 0,
//                 left: 0,
//                 child: Obx(
//                   () => itemController.card.value!.items.isEmpty
//                       ? const SizedBox()
//                       : const SellingFooterWidget(),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class SellingBillPage extends StatefulWidget {
  const SellingBillPage({super.key});

  @override
  State<SellingBillPage> createState() => _SellingBillPageState();
}

class _SellingBillPageState extends State<SellingBillPage>
    with SingleTickerProviderStateMixin {
  int type = 0;
  final TextEditingController nameController = TextEditingController();

  final StoreController storeController = Get.find();
  final ItemController itemController = Get.find();
  final BillController billController = Get.find();

  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      billController.getBillDetailsInfo();
      itemController.getItems();
    });

    // type of bill
    final arguments = Get.arguments;
    if (arguments != null && arguments is Map<String, dynamic>) {
      type = arguments["type"] as int;

      billController.newBill.value.type = type;
      itemController.billType.value = type;

      if (arguments["customerId"] != null) {
        print(arguments["customerId"]);
        billController.newBill.value.customerNumber = arguments["customerId"];
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.whiteColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Stack(
            children: [
              Column(
                children: [
                  context.g4,
                  HeaderWidget(
                    sortAction: () {
                      itemController.sortItem();
                    },
                    filterAction: () {
                      itemController.itemWithQuantity();
                    },
                    title: type == 8
                        ? billController.billTypeForTitle.value == 0
                            ? 'فاتورة بيع'
                            : 'تعديل فاتورة بيع'
                        : billController.billTypeForTitle.value == 0
                            ? 'فاتورة مرتجع'
                            : 'تعديل فاتورة مرتجع',
                  ).pr(10),
                  context.g12,
                  const CategoriesWithSearchWidget(),
                  context.g4,
                  Expanded(
                    child: Obx(() {
                      switch (itemController.currentStatus) {
                        case ItemStatus.loading:
                          return const LoadingWidget();
                        case ItemStatus.success:
                          return Directionality(
                            textDirection: TextDirection.rtl,
                            child: GridView.builder(
                              padding: const EdgeInsets.only(
                                left: 20,
                                right: 20,
                                top: 10,
                                bottom: 160,
                              ),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.78,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                              ),
                              itemCount: itemController.items.length,
                              itemBuilder: (BuildContext context, int index) {
                                var item = itemController.items[index];

                                return SellingBillItemWiget(
                                  key: ValueKey(item.id),
                                  index: index,
                                  item: item,
                                  isCart: false,
                                );
                              },
                            ),
                          );
                        case ItemStatus.error:
                          return const EmptyWidget(
                            imageName: Assets.assetsImagesCurencies,
                            label: "لاتوجد اي منتجات",
                          );

                        default:
                          return const EmptyWidget(
                            imageName: Assets.assetsImagesCurencies,
                            label: "لاتوجد اي منتجات",
                          );
                      }
                    }),
                  ),
                ],
              ),
              Positioned(
                bottom: 10,
                right: 0,
                left: 0,
                child: Obx(
                  () {
                    if (itemController.card.value!.items.isNotEmpty) {
                      _controller.forward();
                    } else {
                      _controller.reverse();
                    }

                    return AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return SlideTransition(
                          position: _slideAnimation,
                          child: Opacity(
                            opacity: _controller.value,
                            child: const SellingFooterWidget(),
                          ),
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
