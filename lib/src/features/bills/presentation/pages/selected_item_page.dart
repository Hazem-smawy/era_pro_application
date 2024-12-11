// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/extensions/padding_extension.dart';
import 'package:era_pro_application/src/core/widgets/header_widget.dart';
import 'package:era_pro_application/src/features/bills/presentation/getX/bill_controller.dart';
import 'package:era_pro_application/src/features/bills/presentation/pages/complete_selling_bill_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getX/item_controller.dart';
import '../widgets/selling_bill_item_widget.dart';

// ignore: must_be_immutable
// class SelectedItemsScreen extends StatelessWidget {
//   SelectedItemsScreen({super.key});
//   BillController itemController = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: context.wightColor,
//       body: SafeArea(
//         child: Column(
//           children: [
//             context.g4,
//             const HeaderWidget(
//               title: 'فاتورة بيع',
//             ).pr(10),
//             Expanded(
//               child: Stack(
//                 children: [
//                   if (itemController.cart.isEmpty)
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Image.asset(
//                           'assets/images/empty_file.png',
//                           fit: BoxFit.cover,
//                           width: double.infinity,
//                         ),
//                         Text(
//                           'لم تقم بإضافة اي منتج الى الفاتورة',
//                           style: context.bodyLarge,
//                         ),
//                       ],
//                     ),
//                   if (itemController.cart.isNotEmpty)
//                     Flexible(
//                       child: Directionality(
//                         textDirection: TextDirection.rtl,
//                         child: GridView.builder(
//                           shrinkWrap: true,
//                           dragStartBehavior: DragStartBehavior.down,
//                           padding: const EdgeInsets.only(bottom: 50),
//                           gridDelegate:
//                               const SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 2,
//                             childAspectRatio: 0.63,
//                             crossAxisSpacing: 12,
//                             mainAxisSpacing: 12,
//                           ),
//                           itemCount: itemController.cart.length,
//                           itemBuilder: (BuildContext context, int index) {
//                             final item = Rx(itemController.cart[index]);
//                             return SellingBillItemWiget(
//                               index: index,
//                               item: item,
//                               isCart: true,
//                             );
//                           },
//                         ),
//                       ),
//                     ),
//                   Positioned(bottom: 0, child: CompleteSellingFooterWidget()),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
class SelectedItemsScreen extends StatelessWidget {
  SelectedItemsScreen({super.key});
  final ItemController itemController = Get.find();
  final BillController billController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.whiteColor,
      body: SafeArea(
        child: Obx(
          () => Column(
            children: [
              context.g4,
              HeaderWidget(
                title: itemController.billType.value == 8
                    ? billController.billTypeForTitle.value == 0
                        ? 'فاتورة بيع'
                        : 'تعديل فاتورة'
                    : 'فاتورة مرتجع',
              ).pr(10),
              // const HeaderWidget(
              //   title: 'فاتورة بيع',
              // ).pr(10),
              Expanded(
                child: Stack(
                  children: [
                    if (itemController.card.value!.items.isEmpty)
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/empty_file.png',
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                            Text(
                              'لم تقم بإضافة اي منتج الى الفاتورة',
                              style: context.bodyLarge,
                            ),
                          ],
                        ),
                      ),
                    if (itemController.card.value!.items.isNotEmpty)
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: GridView.builder(
                          padding: const EdgeInsets.only(
                            bottom: 150,
                            right: 15,
                            left: 15,
                            top: 20,
                          ),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.78,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                          ),
                          itemCount:
                              itemController.card.value?.items.length ?? 0,
                          itemBuilder: (BuildContext context, int index) {
                            final item =
                                itemController.card.value?.items[index];
                            if (item == null) return const SizedBox();
                            return IntrinsicHeight(
                              child: SellingBillItemWiget(
                                key: ValueKey(item.id),
                                index: index,
                                item: item,
                                isCart: true,
                              ),
                            );
                          },
                        ),
                      ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: CompleteSellingFooterWidget(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CompleteSellingFooterWidget extends StatelessWidget {
  CompleteSellingFooterWidget({super.key});

  final ItemController itemController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: context.containerColor,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 0),
                  color: context.blackColor.withOpacity(0.03),
                  spreadRadius: 20,
                  blurRadius: 10,
                )
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Text(
                          'الاجمالي',
                          style: context.bodySmall,
                        ),
                        FittedBox(
                          child: Text(
                            itemController.card.value?.totalPrice.toString() ??
                                "0",
                            style: context.titleSmall.copyWith(
                              fontWeight: FontWeight.bold,
                              color: context.blackColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 40,
                width: 1,
                color: context.secondaryTextColor.withOpacity(0.5),
              ),
              Expanded(
                child: FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Text(
                          'عدد المنتجات',
                          style: context.bodySmall,
                        ),
                        Text(
                          itemController.card.value?.length.toString() ?? '0',
                          style: context.titleSmall.copyWith(
                            fontWeight: FontWeight.bold,
                            color: context.blackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        context.g12,
        if (itemController.card.value?.items.isNotEmpty ?? true)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                SellingBillBtnWidget(),
              ],
            ),
          ),
        context.g20,
      ],
    );
  }
}

class SellingBillBtnWidget extends StatelessWidget {
  final ItemController itemController = Get.find();
  SellingBillBtnWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Get.to(() => CompleteSellingBillPage(
                card: itemController.card.value!,
              ));
        },
        child: Container(
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: context.primaryColor,
          ),
          child: Center(
            child: Text(
              'دفع الفاتورة',
              // textAlign: TextAlign.center,
              style: context.titleLarge.copyWith(
                color: context.whiteColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
