// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/widgets/header_widget.dart';
import 'package:era_pro_application/src/features/bills/presentation/getX/bills_controller.dart';
import 'package:era_pro_application/src/features/bills/presentation/widgets/categoryies_and_search_widget.dart';
import 'package:era_pro_application/src/features/bills/presentation/widgets/selling_bill_footer_widget.dart';
import 'package:era_pro_application/src/features/store/presentation/getX/store_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/widgets/empty_widget.dart';
import '../widgets/selling_bill_item_widget.dart';

// class SellingBillScreen extends StatelessWidget {
//   const SellingBillScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: SafeArea(
//         top: false,
//         child: Column(
//           children: [
//             Container(
//               padding: const EdgeInsets.only(top: 10),
//               color: const Color(0xffEBEEF3),
//               child: SafeArea(
//                 bottom: false,
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         IconButton(
//                           onPressed: () {
//                             //Get.back();
//                           },
//                           icon: const Icon(
//                             Icons.more_vert_rounded,
//                             size: 27,
//                             color: MyColors.secondaryTextColor,
//                           ),
//                         ),
//                         IconButton(
//                           onPressed: () {
//                             Get.back();
//                           },
//                           icon: const Icon(
//                             FontAwesomeIcons.barcode,
//                             size: 25,
//                             color: MyColors.secondaryTextColor,
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 10,
//                         ),
//                         Expanded(
//                           child: Container(
//                             height: 40,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(30),
//                               color: MyColors.whiteColor,
//                             ),
//                             child: Row(
//                               children: [
//                                 Expanded(
//                                   child: TextFormField(
//                                     //initialValue: widget.placeHolder ?? "",
//                                     textAlign: TextAlign.right,
//                                     textDirection: TextDirection.rtl,
//                                     style: MyTextStyles.subTitle.copyWith(
//                                       color: MyColors.blackColor,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                     onChanged: (value) {},
//                                     onTap: () {},
//                                     decoration: InputDecoration(
//                                       border: InputBorder.none,
//                                       hintText: 'البحث عن',
//                                       hintStyle: MyTextStyles.body.copyWith(
//                                           fontWeight: FontWeight.normal),
//                                       contentPadding:
//                                           const EdgeInsets.symmetric(
//                                               horizontal: 10),
//                                     ),
//                                   ),
//                                 ),
//                                 // const SizedBox(
//                                 //   width: 5,
//                                 // ),
//                                 const Icon(
//                                   Icons.search,
//                                   size: 20,
//                                   color: MyColors.secondaryTextColor,
//                                 ),
//                                 const SizedBox(
//                                   width: 10,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         IconButton(
//                           onPressed: () {
//                             Get.back();
//                           },
//                           icon: const Icon(
//                             Icons.chevron_right_outlined,
//                             size: 27,
//                             color: MyColors.secondaryTextColor,
//                           ),
//                         )
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     const Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Text(
//                           'السعر الاجمالي',
//                           style: MyTextStyles.subTitle,
//                         ),
//                         Text(
//                           'سعر الحبة',
//                           style: MyTextStyles.subTitle,
//                         ),
//                         Text(
//                           'الوحدة',
//                           style: MyTextStyles.subTitle,
//                         ),
//                         Text(
//                           'الكمية',
//                           style: MyTextStyles.subTitle,
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Expanded(
//               child: ListView(
//                 padding: const EdgeInsets.symmetric(vertical: 10),
//                 children: const [
//                   BillItemWidget(),
//                   BillItemWidget(),
//                 ],
//               ),
//             ),
//             Container(
//               margin: const EdgeInsets.only(top: 20, right: 15, left: 15),
//               padding: const EdgeInsets.all(15),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 border: Border.all(
//                   color: MyColors.secondaryTextColor.withOpacity(0.3),
//                 ),
//               ),
//               child: Column(
//                 children: [
//                   const BillSammaryItemWidget(
//                     summaryKey: 'عدد القطع',
//                     summaryValue: '150 قطعة',
//                   ),
//                   const SizedBox(
//                     height: 5,
//                   ),
//                   const BillSammaryItemWidget(
//                     summaryKey: 'السعر الاجمالي ',
//                     summaryValue: '2000',
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Container(
//                     // margin: const EdgeInsets.all(5),
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: GestureDetector(
//                             onTap: () {
//                               Get.to(() => const CompleteSellingBillScreen());
//                             },
//                             child: Container(
//                               padding: const EdgeInsets.all(10),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(25),
//                                 color: MyColors.primaryColor,
//                               ),
//                               child: Center(
//                                 child: Text(
//                                   "متابعة",
//                                   style: MyTextStyles.title2
//                                       .copyWith(color: MyColors.whiteColor),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 10,
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             Get.bottomSheet(const AddItemsBottomSheet());
//                           },
//                           child: Container(
//                             width: 40,
//                             height: 40,
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               border: Border.all(
//                                 color: MyColors.secondaryTextColor
//                                     .withOpacity(0.3),
//                               ),
//                             ),
//                             child: const Center(
//                               child: FaIcon(
//                                 FontAwesomeIcons.shapes,
//                                 size: 18,
//                                 color: MyColors.blackColor,
//                               ),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class AddItemsBottomSheet extends StatefulWidget {
//   const AddItemsBottomSheet({super.key});

//   @override
//   State<AddItemsBottomSheet> createState() => _AddItemsBottomSheetState();
// }

// class _AddItemsBottomSheetState extends State<AddItemsBottomSheet> {
//   bool isSearchFieldOpen = false;
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       duration: const Duration(microseconds: 200),
//       padding: const EdgeInsets.all(5),
//       decoration: const BoxDecoration(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(20),
//           topRight: Radius.circular(20),
//         ),
//         color: MyColors.containerColor,
//       ),
//       child: Column(
//         children: [
//           SizedBox(
//             height: 40,
//             child: Row(
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       isSearchFieldOpen = !isSearchFieldOpen;
//                     });
//                   },
//                   child: Container(
//                     height: 40,
//                     width: 40,
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 10,
//                       vertical: 5,
//                     ),
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       border: Border.all(
//                         color: MyColors.secondaryTextColor.withOpacity(0.2),
//                       ),
//                     ),
//                     child: const Center(
//                       child: FaIcon(
//                         FontAwesomeIcons.magnifyingGlass,
//                         color: MyColors.secondaryTextColor,
//                         size: 20,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 if (isSearchFieldOpen)
//                   Expanded(
//                     child: AnimatedContainer(
//                       duration: const Duration(microseconds: 200),
//                       padding: const EdgeInsets.only(right: 10),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         color: MyColors.whiteColor,
//                       ),
//                       child: TextFormField(
//                         //initialValue: widget.placeHolder ?? "",
//                         textAlign: TextAlign.right,

//                         textDirection: TextDirection.rtl,
//                         style: MyTextStyles.subTitle.copyWith(
//                           color: MyColors.blackColor,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         onChanged: (value) {},
//                         onTap: () {},
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           hintText: 'البحث عن',
//                           hintStyle: MyTextStyles.body
//                               .copyWith(fontWeight: FontWeight.normal),
//                           contentPadding: const EdgeInsets.only(
//                             right: 10,
//                             left: 10,
//                             bottom: 5,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 if (!isSearchFieldOpen)
//                   Expanded(
//                     child: AnimatedContainer(
//                       duration: const Duration(microseconds: 200),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         // color: const Color(0xff777777),
//                       ),
//                       child: ListView.separated(
//                         scrollDirection: Axis.horizontal,
//                         reverse: true,
//                         itemCount: 5,
//                         separatorBuilder: (BuildContext context, int index) {
//                           return const SizedBox(
//                             width: 5,
//                           );
//                         },
//                         itemBuilder: (BuildContext context, int index) {
//                           return Container(
//                             height: 40,
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 10,
//                               vertical: 5,
//                             ),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(25),
//                               border: Border.all(
//                                 color: MyColors.secondaryTextColor
//                                     .withOpacity(0.2),
//                               ),
//                             ),
//                             child: const Center(
//                               child: Text(
//                                 "كل التصنيفات",
//                                 style: MyTextStyles.subTitle,
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                 const SizedBox(
//                   width: 5,
//                 ),
//                 if (isSearchFieldOpen)
//                   GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         isSearchFieldOpen = false;
//                       });
//                     },
//                     child: AnimatedContainer(
//                       duration: const Duration(microseconds: 200),
//                       height: 40,
//                       width: 40,
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 10,
//                         vertical: 5,
//                       ),
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         border: Border.all(
//                           color: MyColors.secondaryTextColor.withOpacity(0.2),
//                         ),
//                       ),
//                       child: const Center(
//                         child: FaIcon(
//                           FontAwesomeIcons.chevronRight,
//                           color: MyColors.secondaryTextColor,
//                           size: 20,
//                         ),
//                       ),
//                     ),
//                   ),
//                 if (!isSearchFieldOpen)
//                   Container(
//                     height: 40,
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 10,
//                       vertical: 5,
//                     ),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(25),
//                       color: MyColors.primaryColor,
//                       border: Border.all(
//                         color: MyColors.secondaryTextColor.withOpacity(0.2),
//                       ),
//                     ),
//                     child: Center(
//                       child: Text(
//                         'الكل',
//                         style: MyTextStyles.subTitle.copyWith(
//                           color: MyColors.whiteColor,
//                         ),
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           Expanded(
//             child: GridView.builder(
//               padding: const EdgeInsets.all(10),
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 3,
//                 mainAxisSpacing: 15,
//                 crossAxisSpacing: 10,
//                 childAspectRatio: 0.7,
//               ),
//               itemCount: 5,
//               itemBuilder: (BuildContext context, int index) {
//                 return AddItemsBottomSheetItemWidget(
//                   isSelected: index == 0,
//                   isNotSelected: index == 2,
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class AddItemsBottomSheetItemWidget extends StatelessWidget {
//   final bool isSelected;
//   final bool isNotSelected;
//   const AddItemsBottomSheetItemWidget({
//     super.key,
//     required this.isSelected,
//     required this.isNotSelected,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Column(
//           children: [
//             Stack(
//               children: [
//                 SizedBox(
//                   height: 100,
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(20),
//                     child: Image.asset(
//                       'assets/images/avatar1.jpg',
//                       width: double.infinity,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Container(
//                   width: 30,
//                   height: 30,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12),
//                     color: const Color(0xffF7BC56).withOpacity(0.5),
//                   ),
//                   child: const Center(
//                     child: Text(
//                       '4',
//                       style: MyTextStyles.title2,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 5,
//                 ),
//                 const Expanded(
//                   child: Text(
//                     'سكر السعيد',
//                     textAlign: TextAlign.end,
//                     style: MyTextStyles.title2,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//         if (isNotSelected)
//           Positioned.fill(
//             child: Column(
//               children: [
//                 Expanded(
//                   child: Container(
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       color: MyColors.blackColor.withOpacity(0.5),
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Text(
//                           '100',
//                           style: TextStyle(
//                             fontSize: 30,
//                             color: Colors.white70,
//                           ),
//                         ),
//                         Container(
//                           width: double.infinity,
//                           padding: const EdgeInsets.all(10),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(18),
//                             // color: MyColors.blackColor.withOpacity(0.4),
//                           ),
//                           child: const Center(
//                             child: FaIcon(
//                               FontAwesomeIcons.plus,
//                               size: 20,
//                               color: Colors.white60,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 4,
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(3),
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     color: Colors.black.withOpacity(0.2),
//                   ),
//                   child: const Center(
//                     child: FaIcon(
//                       FontAwesomeIcons.minus,
//                       size: 20,
//                       color: Colors.white60,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//               ],
//             ),
//           ),
//         if (isSelected)
//           Positioned.fill(
//             child: Container(
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 color: MyColors.blackColor.withOpacity(0.5),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     '86',
//                     style: TextStyle(
//                       fontSize: 30,
//                       color: Colors.white70,
//                     ),
//                   ),
//                   Container(
//                     padding: const EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       border: Border.all(
//                         color: MyColors.secondaryTextColor.withOpacity(0.2),
//                       ),
//                     ),
//                     child: const FaIcon(
//                       FontAwesomeIcons.plus,
//                       size: 20,
//                       color: Colors.white60,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 5,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         if (isSelected)
//           Positioned(
//             right: 5,
//             bottom: 5,
//             child: Container(
//               width: 35,
//               height: 35,
//               padding: const EdgeInsets.all(5),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 color: Colors.black.withOpacity(0.6),
//               ),
//               child: const Center(
//                 child: FaIcon(
//                   FontAwesomeIcons.minus,
//                   size: 20,
//                   color: Colors.white54,
//                 ),
//               ),
//             ),
//           )
//       ],
//     );
//   }
// }

class BillSammaryItemWidget extends StatelessWidget {
  const BillSammaryItemWidget({
    super.key,
    required this.summaryKey,
    required this.summaryValue,
  });

  final String summaryKey;
  final String summaryValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            // border: Border.all(
            //   color: MyColors.secondaryTextColor.withOpacity(0.3),
            // ),
          ),
          child: Text(
            summaryValue,
            style: context.titleMedium,
          ),
        ),
        const Spacer(),
        Container(
          decoration: const BoxDecoration(),
          child: Text(
            summaryKey,
            style: context.titleLarge,
          ),
        )
      ],
    );
  }
}

// class CustomBoxWidget extends StatelessWidget {
//   const CustomBoxWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: CustomPaint(
//             painter: MyPainter(),
//             child: Container(
//               margin: const EdgeInsets.all(20),
//               width: double.infinity,
//               height: 100,
//               // Box background color
//               child: const Center(),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class SellingBillPage extends StatelessWidget {
  SellingBillPage({super.key});

  final TextEditingController nameController = TextEditingController();
  StoreController storeController = Get.find();
  final ItemController itemController = Get.put(ItemController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.wightColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                context.g4,
                const HeaderWidget(
                  title: 'فاتورة بيع',
                ),
                context.g12,
                const CategoriesWithSearchWidget(),
                context.g4,
                Expanded(
                  child: Obx(
                    () => itemController.items.isEmpty
                        ? const EmptyWidget(
                            imageName: Assets.assetsImagesCurencies,
                            label: "لاتوجد اي منتجات",
                          )
                        : Directionality(
                            textDirection: TextDirection.rtl,
                            child: GridView.builder(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 10, bottom: 160),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.64,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                              ),
                              itemCount: itemController.items.length,
                              itemBuilder: (BuildContext context, int index) {
                                Item item = itemController.items[index];
                                var rxItem = Rx(item);
                                return SellingBillItemWiget(
                                  index: index,
                                  item: rxItem,
                                  isCart: false,
                                );
                              },
                            ),
                          ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 10,
              right: 0,
              left: 0,
              child: Obx(
                () => itemController.cart.isEmpty
                    ? const SizedBox()
                    : const SellingFooterWidget(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
