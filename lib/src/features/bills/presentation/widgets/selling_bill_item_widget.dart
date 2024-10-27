import 'dart:ui';

import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/extensions/image_with_error_extension.dart';
import 'package:era_pro_application/src/core/utils/validatators.dart';
import 'package:era_pro_application/src/core/widgets/custom_text_field_with_label_widget.dart';
import 'package:era_pro_application/src/features/bills/presentation/getX/bills_getx.dart';
import 'package:era_pro_application/src/features/bills/presentation/widgets/item_info_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SellingBillItemWiget extends StatefulWidget {
  const SellingBillItemWiget({
    super.key,
    required this.item,
    required this.index,
    required this.isCart,
  });
  final Rx<Item> item;
  final int index;
  final bool isCart;

  @override
  State<SellingBillItemWiget> createState() => _SellingBillItemWigetState();
}

class _SellingBillItemWigetState extends State<SellingBillItemWiget> {
  bool isInputQuantityOpen = false;
  final ItemController itemController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () async {
            Get.dialog(
              ItemInfoDialg(
                item: widget.item,
              ),
            );
          },
          child: Stack(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CustomImage.memoryWithError(
                widget.item.value.image,
                h: 180,
              ),
            ),
            Container(
              height: 180,
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ItemShortcutsBtnsWidget(
                        isInputQuantityOpen: isInputQuantityOpen,
                        widget: widget,
                        action: () {
                          setState(() {
                            isInputQuantityOpen = !isInputQuantityOpen;
                          });
                        },
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isInputQuantityOpen = false;
                      });
                      itemController.nextUnitDetails(widget.item.value);
                    },
                    child: SizedBox(
                      height: 36,
                      width: 36,
                      child: Stack(
                        children: [
                          GlassContainer(
                            child: Center(
                              child: Text(
                                'x${widget.item.value.selectedUnit.unitFactor}',
                                style: context.bodySmall?.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          if (widget.item.value.selectedUnit.updatedQuantity >
                              0)
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                height: 7,
                                width: 7,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.green,
                                  ),
                                  color: Colors.green,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
        context.g8,
        ItemNameAndQuantityWidget(widget: widget),
        context.g8,
        ItemPriceAndCounterWidget(
          isInputQuantityOpen: isInputQuantityOpen,
          widget: widget,
          itemController: itemController,
        ),
      ],
    );
  }
}

class ItemPriceAndCounterWidget extends StatelessWidget {
  const ItemPriceAndCounterWidget({
    super.key,
    required this.isInputQuantityOpen,
    required this.widget,
    required this.itemController,
  });

  final bool isInputQuantityOpen;
  final SellingBillItemWiget widget;
  final ItemController itemController;
  bool isNumber(String input) {
    return num.tryParse(input) != null;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              if (isInputQuantityOpen)
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xffEBEEF3),
                    border: Border.all(
                      color: context.secondaryTextColor.withOpacity(0.2),
                      width: 0.5,
                    ),
                  ),
                  width: 90,
                  height: 30,
                  child: CustomTextFieldQuantityWidget(
                    label: '',
                    textHint: widget.item.value.selectedUnit.updatedQuantity
                        .toString(),
                    action: (p0) {
                      int res;
                      if (!isNumber(p0) || p0.trim().isEmpty) {
                        res = 0;
                      } else {
                        res = int.parse(p0);
                      }

                      // res = int.parse(res);
                      if (res >
                              widget
                                  .item.value.selectedUnit.quantityRemaining ||
                          res < 0) {
                        return;
                      }

                      int updatedQuantity =
                          res - widget.item.value.selectedUnit.updatedQuantity;

                      if (updatedQuantity > 0) {
                        for (var i = 0; i < updatedQuantity; i++) {
                          itemController.updateQuantity(
                              widget.item.value.id, 1, 0);
                        }
                      } else {
                        for (var i = updatedQuantity; i < 0; i++) {
                          itemController.updateQuantity(
                              widget.item.value.id, -1, 0);
                        }
                      }
                    },
                  ),
                ),
              if (!isInputQuantityOpen)
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        itemController.updateQuantity(
                            widget.item.value.id, 1, 0);
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffEBEEF3),
                        ),
                        child: const Center(
                          child: FaIcon(
                            Icons.add,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 35,
                      height: 30,
                      child: Center(
                        child: Text(
                          '${widget.item.value.selectedUnit.updatedQuantity}',
                          textAlign: TextAlign.center,
                          style: context.titleSmall?.copyWith(
                            color: context.blackColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (widget.item.value.selectedUnit.updatedQuantity >
                            0) {
                          itemController.updateQuantity(
                              widget.item.value.id, -1, 0);
                        }
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffEBEEF3),
                        ),
                        child: const Center(
                          child: FaIcon(
                            Icons.remove,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
        Row(
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(
                widget.item.value.selectedUnit.selectedPrice.toString(),
                style: context.bodyLarge?.copyWith(
                  color: context.secondary,
                ),
              ),
            ),
            context.g4,
            Text(
              'ر.ي',
              style: context.bodySmall,
            ),
          ],
        ),
      ],
    );
  }
}

class ItemNameAndQuantityWidget extends StatelessWidget {
  const ItemNameAndQuantityWidget({
    super.key,
    required this.widget,
  });

  final SellingBillItemWiget widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerRight,
            child: Text(
              widget.item.value.name,
              style: context.bodyMeduim?.copyWith(
                color: context.blackColor,
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.green.withOpacity(0.2),
          ),
          child: Center(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                widget.item.value.selectedUnit.quantityRemaining.toString(),
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.normal,
                  color: context.blackColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ItemShortcutsBtnsWidget extends StatelessWidget {
  const ItemShortcutsBtnsWidget({
    super.key,
    required this.isInputQuantityOpen,
    required this.widget,
    required this.action,
  });

  final bool isInputQuantityOpen;
  final SellingBillItemWiget widget;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 36,
          width: 36,
          child: GlassContainer(
            child: FaIcon(
              Icons.more_vert_rounded,
              color: context.wightColor,
              size: 16,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: action,
          child: SizedBox(
            height: 36,
            width: 36,
            child: Center(
              child: GlassContainer(
                child: Icon(
                  isInputQuantityOpen
                      ? FontAwesomeIcons.arrowUp19
                      : FontAwesomeIcons.keyboard,
                  color: context.wightColor,
                  size: 15,
                ),
              ),
            ),
          ),
        ),
        context.g8,
        if (getItemStatus())
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
              border: Border.all(
                color: Colors.white,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.09),
                  offset: const Offset(0, 0),
                  spreadRadius: 0,
                  blurRadius: 5,
                )
              ],
            ),
          ),
      ],
    );
  }

  bool getItemStatus() {
    return widget.item.value.unitDetails
            .firstWhereOrNull((e) => e.updatedQuantity > 0) !=
        null;
  }
}

// class GlassContainer extends StatelessWidget {
//   final Widget child;
//   final double blur;
//   final double opacity;
//   final BoxDecoration decoration;

//   const GlassContainer({
//     super.key,
//     required this.child,
//     this.blur = 15,
//     this.opacity = 0.1,
//     this.decoration = const BoxDecoration(
//       color: Colors.white,
//     ),
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ClipOval(
//       // borderRadius:
//       //     BorderRadius.circular(36 / 2), // Optional: add border radius
//       child: Container(
//         decoration: BoxDecoration(
//             border: Border.all(
//           color: context.bg.withOpacity(0.2),
//         )),
//         child: BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
//           child: Container(
//             decoration: decoration.copyWith(
//                 color: decoration.color!.withOpacity(opacity)),
//             child: Center(child: child),
//           ),
//         ),
//       ),
//     );
//   }
// }

class GlassContainer extends StatelessWidget {
  final Widget child;
  final double blur;
  final double opacity;
  final double borderRadius;
  final double borderWidth;
  final Color borderColor;
  final Color shadowColor;
  final Offset shadowOffset;
  final double shadowBlurRadius;
  final BoxDecoration decoration;

  const GlassContainer({
    super.key,
    required this.child,
    this.blur = 15,
    this.opacity = 0.1,
    this.borderRadius = 18,
    this.borderWidth = 1.5,
    this.borderColor = Colors.white,
    this.shadowColor = Colors.black54,
    this.shadowOffset = const Offset(2, 2),
    this.shadowBlurRadius = 10.0,
    this.decoration = const BoxDecoration(
      color: Colors.white,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              offset: shadowOffset,
              blurRadius: shadowBlurRadius,
            ),
          ],
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            decoration: decoration.copyWith(
              color: decoration.color?.withOpacity(opacity),
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(
                color: borderColor.withOpacity(0.2),
                width: borderWidth,
              ),
            ),
            child: Center(child: child),
          ),
        ),
      ),
    );
  }
}

// import 'package:era_pro/constants/colors.dart';
// import 'package:era_pro/constants/text_styles.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';

// class BillItemWidget extends StatefulWidget {
//   const BillItemWidget({
//     super.key,
//   });

//   @override
//   State<BillItemWidget> createState() => _BillItemWidgetState();
// }

// class _BillItemWidgetState extends State<BillItemWidget> {
//   final List<String> items = ['كرتون', 'حبة'];

//   String? selectedItem;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           //padding: const EdgeInsets.all(10),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             // border: Border.all(
//             //   color: MyColors.secondaryTextColor.withOpacity(0.3),
//             // ),
//           ),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   IconButton(
//                     onPressed: () {
//                       //Get.back();
//                     },
//                     icon: const Icon(
//                       Icons.more_vert_rounded,
//                       size: 20,
//                       color: MyColors.secondaryTextColor,
//                     ),
//                   ),
//                   IconButton(
//                     onPressed: () {
//                       Get.back();
//                     },
//                     icon: const Icon(
//                       FontAwesomeIcons.trashCan,
//                       size: 20,
//                       color: MyColors.secondaryTextColor,
//                     ),
//                   ),
//                   Expanded(
//                     child: Text(
//                       ' ماء شملان صغير',
//                       textAlign: TextAlign.end,
//                       style: MyTextStyles.title2
//                           .copyWith(color: MyColors.blackColor),
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   Container(
//                     width: 35,
//                     decoration: BoxDecoration(
//                         // color: MyColors.containerColor,
//                         shape: BoxShape.circle,
//                         border: Border.all(
//                             color:
//                                 MyColors.secondaryTextColor.withOpacity(0.3))),
//                     child: Center(
//                       child: IconButton(
//                         onPressed: () {
//                           //Get.back();
//                         },
//                         icon: const Icon(
//                           FontAwesomeIcons.plus,
//                           size: 15,
//                           color: MyColors.blackColor,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 10,
//                   )
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: Container(
//                         height: 40,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(30),
//                           color: MyColors.containerColor,
//                         ),
//                         child: TextFormField(
//                           //initialValue: widget.placeHolder ?? "",
//                           textAlign: TextAlign.center,
//                           textDirection: TextDirection.rtl,
//                           style: MyTextStyles.subTitle.copyWith(
//                             color: MyColors.blackColor,
//                             fontWeight: FontWeight.bold,
//                           ),
//                           onChanged: (value) {},
//                           onTap: () {},
//                           decoration: InputDecoration(
//                             border: InputBorder.none,
//                             hintText: '100',
//                             hintStyle: MyTextStyles.body
//                                 .copyWith(fontWeight: FontWeight.normal),
//                             contentPadding: const EdgeInsets.symmetric(
//                               horizontal: 10,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 5,
//                     ),
//                     Expanded(
//                       child: Container(
//                         height: 40,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(30),
//                           color: MyColors.containerColor,
//                         ),
//                         child: TextFormField(
//                           //initialValue: widget.placeHolder ?? "",
//                           textAlign: TextAlign.center,
//                           textDirection: TextDirection.rtl,
//                           style: MyTextStyles.subTitle.copyWith(
//                             color: MyColors.blackColor,
//                             fontWeight: FontWeight.bold,
//                           ),
//                           onChanged: (value) {},
//                           onTap: () {},
//                           decoration: InputDecoration(
//                             border: InputBorder.none,
//                             hintText: '100',
//                             hintStyle: MyTextStyles.body
//                                 .copyWith(fontWeight: FontWeight.normal),
//                             contentPadding: const EdgeInsets.symmetric(
//                               horizontal: 10,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 5,
//                     ),
//                     Container(
//                       height: 40,
//                       padding: const EdgeInsets.symmetric(horizontal: 10),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         border: Border.all(
//                           color: MyColors.secondaryTextColor.withOpacity(0.5),
//                         ),
//                       ),
//                       child: DropdownButton<String>(
//                         elevation: 1,
//                         borderRadius: BorderRadius.circular(10),
//                         items: items.map((String value) {
//                           return DropdownMenuItem<String>(
//                             alignment: AlignmentDirectional.center,
//                             value: value,
//                             child: Text(
//                               value,
//                               style: MyTextStyles.subTitle,
//                             ),
//                           );
//                         }).toList(),
//                         onChanged: (value) {
//                           setState(() {
//                             selectedItem = value;
//                           });
//                         },
//                         hint: Text(
//                           items.last,
//                           style: MyTextStyles.subTitle,
//                         ),
//                         value: selectedItem,
//                         underline: const SizedBox(),
//                         icon: const SizedBox(),
//                         alignment: AlignmentDirectional.center,
//                       ),
//                       // child: Row(
//                       //   children: [
//                       //     const FaIcon(
//                       //       FontAwesomeIcons.chevronDown,
//                       //       size: 12,
//                       //       color: MyColors.secondaryTextColor,
//                       //     ),
//                       //     const SizedBox(
//                       //       width: 10,
//                       //     ),
//                       //     Text(
//                       //       'كرتون',
//                       //       style: MyTextStyles.title2,
//                       //     ),
//                       //   ],
//                       // ),
//                     ),
//                     const SizedBox(
//                       width: 5,
//                     ),
//                     Expanded(
//                       child: Container(
//                         height: 40,
//                         padding: const EdgeInsets.symmetric(horizontal: 5),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           color: MyColors.containerColor,
//                         ),
//                         child: Row(
//                           children: [
//                             Container(
//                               width: 30,
//                               decoration: BoxDecoration(
//                                 color: MyColors.whiteColor,
//                                 shape: BoxShape.circle,
//                               ),
//                               child: Center(
//                                 child: IconButton(
//                                   onPressed: () {
//                                     //Get.back();
//                                   },
//                                   icon: const Icon(
//                                     FontAwesomeIcons.minus,
//                                     size: 15,
//                                     color: MyColors.secondaryTextColor,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               child: Container(
//                                 height: 40,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(30),
//                                   color: MyColors.containerColor,
//                                 ),
//                                 child: TextFormField(
//                                   //initialValue: widget.placeHolder ?? "",
//                                   textAlign: TextAlign.center,
//                                   textDirection: TextDirection.rtl,
//                                   style: MyTextStyles.subTitle.copyWith(
//                                     color: MyColors.blackColor,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                   onChanged: (value) {},
//                                   onTap: () {},
//                                   decoration: InputDecoration(
//                                     border: InputBorder.none,
//                                     hintText: '100',
//                                     hintStyle: MyTextStyles.body.copyWith(
//                                         fontWeight: FontWeight.normal),
//                                     contentPadding: const EdgeInsets.symmetric(
//                                       horizontal: 10,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Divider(
//           color: MyColors.secondaryTextColor.withOpacity(0.3),
//         )
//       ],
//     );
//   }
// }
