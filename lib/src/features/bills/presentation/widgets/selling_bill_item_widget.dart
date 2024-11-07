import 'dart:ui';

import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/extensions/image_with_error_extension.dart';
import 'package:era_pro_application/src/core/widgets/custom_text_field_with_label_widget.dart';
import 'package:era_pro_application/src/features/bills/presentation/getX/bills_getx.dart';
import 'package:era_pro_application/src/features/bills/presentation/pages/item_info_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../domain/entities/bill_ui_entity.dart';

class SellingBillItemWiget extends StatefulWidget {
  const SellingBillItemWiget({
    super.key,
    required this.item,
    required this.index,
    required this.isCart,
  });
  final Rx<ItemUI> item;
  final int index;
  final bool isCart;

  @override
  State<SellingBillItemWiget> createState() => _SellingBillItemWigetState();
}

class _SellingBillItemWigetState extends State<SellingBillItemWiget> {
  bool isInputQuantityOpen = false;
  final BillController itemController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () async {
            itemController.updateQuantity(widget.item.value.id, 1, 0);
          },
          child: Stack(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CustomImage.memoryWithError(
                widget.item.value.image,
                h: 120,
              ),
            ),
            Container(
              height: 120,
              padding: const EdgeInsets.all(5),
              width: double.infinity,
              child: Row(
                textDirection: TextDirection.ltr,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // if (widget.item.value.unitDetails
                  //     .where((e) => e.updatedQuantity > 0)
                  //     .toList()
                  //     .isEmpty)
                  ItemShortcutsBtnsWidget(
                    isInputQuantityOpen: isInputQuantityOpen,
                    widget: widget,
                    isCard: widget.isCart,
                    action: () {
                      setState(() {
                        isInputQuantityOpen = !isInputQuantityOpen;
                      });
                    },
                  ),
                  const Spacer(),
                  if (widget.item.value.unitDetails
                          .where((e) => e.updatedQuantity > 0)
                          .toList()
                          .length >
                      1)
                    SizedBox(
                      width: 36,
                      height: 36,
                      child: GlassContainer(
                        child: Center(
                          child: Text(
                            widget.item.value.unitDetails
                                .where((e) => e.updatedQuantity > 0)
                                .toList()
                                .length
                                .toString(),
                            style: context.bodyLarge?.copyWith(
                              color: context.wightColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  context.g8,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.dialog(
                            ItemInfoDialg(
                              item: widget.item,
                            ),
                          );
                        },
                        child: SizedBox(
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
                      ),
                      context.g8,
                      Row(
                        children: [
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
                              child: GlassContainer(
                                child: Center(
                                  child: Text(
                                    'x${widget.item.value.selectedUnit.unitFactor}',
                                    style: context.bodySmall?.copyWith(
                                      color: widget.item.value.selectedUnit
                                                  .updatedQuantity >
                                              0
                                          ? Colors.green
                                          : Colors.white,
                                      fontWeight: widget.item.value.selectedUnit
                                                  .updatedQuantity >
                                              0
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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
  final BillController itemController;
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
                          (res - widget.item.value.selectedUnit.updatedQuantity)
                              .toInt();

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
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // color: const Color(0xffEBEEF3),
                        border: Border.all(
                          color: context.secondary.withOpacity(0.3),
                        ),
                      ),
                      child: IconButton(
                        icon: const Center(
                            child: Icon(
                          Icons.add,
                          size: 18,
                        )),
                        onPressed: () {
                          itemController.updateQuantity(
                              widget.item.value.id, 1, 0);
                        },
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
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // color: const Color(0xffEBEEF3),
                        border: Border.all(
                          color: context.secondary.withOpacity(0.3),
                        ),
                      ),
                      child: IconButton(
                        icon: const Center(
                            child: Icon(
                          Icons.remove,
                          size: 18,
                        )),
                        onPressed: () {
                          if (widget.item.value.selectedUnit.updatedQuantity >
                              0) {
                            itemController.updateQuantity(
                                widget.item.value.id, -1, 0);
                          }
                        },
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
                style: context.titleSmall?.copyWith(
                  color: context.blackColor,
                  // fontWeight: FontWeight.bold,
                ),
              ),
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
                  // color: context.blackColor,
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
                  fontWeight: FontWeight.bold,
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
    required this.isCard,
  });

  final bool isInputQuantityOpen;
  final SellingBillItemWiget widget;
  final VoidCallback action;
  final bool isCard;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!isCard)
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
        if (!isCard) context.g8,
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
