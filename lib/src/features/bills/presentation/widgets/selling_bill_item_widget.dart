// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';
import 'dart:ui';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/extensions/image_with_error_extension.dart';
import 'package:era_pro_application/src/core/widgets/custom_text_field_with_label_widget.dart';
import 'package:era_pro_application/src/features/bills/presentation/pages/item_info_dialog.dart';

import '../../domain/entities/bill_ui_entity.dart';
import '../getX/item_controller.dart';

class SellingBillItemWiget extends StatefulWidget {
  const SellingBillItemWiget({
    super.key,
    required this.item,
    required this.index,
    required this.isCart,
  });
  final ItemUI item;
  final int index;
  final bool isCart;

  @override
  State<SellingBillItemWiget> createState() => _SellingBillItemWigetState();
}

class _SellingBillItemWigetState extends State<SellingBillItemWiget> {
  bool isInputQuantityOpen = false;
  final ItemController itemController = Get.find();

  @override
  void initState() {
    super.initState();
    itemController.updatePreTaxForItem(widget.item);
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.isCart && widget.item.selectedUnit.updatedQuantity == 0
          ? 0.6
          : 1,
      child: Column(
        children: [
          GestureDetector(
            onTap: () async {
              itemController.updateQuantity(widget.item.id, 1, 0);
            },
            child: Stack(children: [
              ItemImageWidget(widget: widget),
              Container(
                height: 120,
                padding: const EdgeInsets.all(5),
                width: double.infinity,
                child: Row(
                  textDirection: TextDirection.ltr,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
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
                        Row(
                          children: [
                            ItemInfoDetailsShowBolletsWidget(
                              isShowing:
                                  widget.item.selectedUnit.freeQuantity > 0,
                              color: const Color.fromARGB(255, 178, 137, 13),
                            ),
                            ItemInfoDetailsShowBolletsWidget(
                              isShowing: widget.item.selectedUnit.discount > 0,
                              color: const Color.fromARGB(202, 255, 19, 7),
                            ),
                            // ItemInfoDetailsShowBolletsWidget(
                            //   isShowing: widget.item.selectedUnit.tax > 0,
                            //   color: Colors.purple,
                            // ),
                            context.g4,
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    if (widget.item.unitDetails
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
                              widget.item.unitDetails
                                  .where((e) => e.updatedQuantity > 0)
                                  .toList()
                                  .length
                                  .toString(),
                              style: context.bodyLarge.copyWith(
                                color: context.whiteColor,
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
                                color: context.whiteColor,
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
                                itemController.nextUnitDetails(widget.item);
                              },
                              child: SizedBox(
                                height: 36,
                                width: 36,
                                child: GlassContainer(
                                  child: Center(
                                    child: Text(
                                      'x${widget.item.selectedUnit.unitFactor}',
                                      style: context.bodySmall.copyWith(
                                        color: widget.item.selectedUnit
                                                    .updatedQuantity >
                                                0
                                            ? Colors.green
                                            : Colors.white,
                                        fontWeight: widget.item.selectedUnit
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
      ),
    );
  }
}

class ItemInfoDetailsShowBolletsWidget extends StatelessWidget {
  final Color color;
  final bool isShowing;
  const ItemInfoDetailsShowBolletsWidget({
    super.key,
    required this.color,
    required this.isShowing,
  });

  @override
  Widget build(BuildContext context) {
    return isShowing
        ? Row(
            children: [
              context.g4,
              Container(
                width: 20,
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: color,
                  border: Border.all(color: context.whiteColor),
                ),
              ),
            ],
          )
        : const SizedBox();
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
                    textHint:
                        widget.item.selectedUnit.updatedQuantity.toString(),
                    action: (p0) {
                      itemController.updateQuantityFromTextField(
                          p0, widget.item);
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
                          itemController.updateQuantity(widget.item.id, 1, 0);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 35,
                      height: 30,
                      child: Center(
                        child: Text(
                          '${widget.item.selectedUnit.updatedQuantity}',
                          textAlign: TextAlign.center,
                          style: context.titleSmall.copyWith(
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
                          if (widget.item.selectedUnit.updatedQuantity > 0) {
                            itemController.updateQuantity(
                                widget.item.id, -1, 0);
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
                widget.item.selectedUnit.selectedPrice.toString(),
                style: context.titleSmall.copyWith(
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
              widget.item.name,
              style: context.bodyMedium.copyWith(
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
                widget.item.selectedUnit.quantityRemaining.toString(),
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
                    color: context.whiteColor,
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
    return widget.item.unitDetails
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

// class ItemImageWidget extends StatefulWidget {
//   const ItemImageWidget({
//     super.key,
//     required this.widget,
//   });
//   final SellingBillItemWiget widget;

//   @override
//   State<ItemImageWidget> createState() => _ItemImageWidgetState();
// }

// class _ItemImageWidgetState extends State<ItemImageWidget> {
//   ItemController itemController = Get.find();
//   late Uint8List? imageData;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     itemController.getItemImage(widget.widget.item.id).then((value) {
//       setState(() {
//         imageData = value;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(
//           color: context.secondaryTextColor.withOpacity(
//             0.2,
//           ),
//         ),
//         color: context.containerColor,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(10),
//         child: CustomImage.memoryWithError(
//           imageData,
//           h: 120,
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class ItemImageWidget extends StatefulWidget {
//   const ItemImageWidget({
//     super.key,
//     required this.widget,
//   });
//   final SellingBillItemWiget widget;

//   @override
//   State<ItemImageWidget> createState() => _ItemImageWidgetState();
// }

// class _ItemImageWidgetState extends State<ItemImageWidget>
//     with AutomaticKeepAliveClientMixin {
//   ItemController itemController = Get.find();
//   late Future<Uint8List?> _imageFuture;

//   @override
//   void initState() {
//     super.initState();
//     _imageFuture = itemController.getItemImage(widget.widget.item.id);
//   }

//   @override
//   Widget build(BuildContext context) {
//     super.build(context); // Required for AutomaticKeepAliveClientMixin
//     return Container(
//       width: double.infinity,

//       decoration: BoxDecoration(
//         border: Border.all(
//           color: context.secondaryTextColor.withOpacity(0.2),
//         ),
//         color: context.containerColor,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(10),
//         child: FutureBuilder<Uint8List?>(
//           future: _imageFuture,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             } else if (snapshot.hasData && snapshot.data != null) {
//               return Image.memory(
//                 snapshot.data!,
//                 height: 120,
//                 fit: BoxFit.cover,
//               );
//             } else {
//               return const Icon(Icons.error);
//             }
//           },
//         ),
//       ),
//     );
//   }

//   @override
//   bool get wantKeepAlive => true;
// }

class ItemImageWidget extends StatefulWidget {
  const ItemImageWidget({
    super.key,
    required this.widget,
  });
  final SellingBillItemWiget widget;

  @override
  State<ItemImageWidget> createState() => _ItemImageWidgetState();
}

class _ItemImageWidgetState extends State<ItemImageWidget>
    with AutomaticKeepAliveClientMixin {
  ItemController itemController = Get.find();
  late Future<Uint8List?> _imageFuture;

  @override
  void initState() {
    super.initState();
    _imageFuture = itemController.getItemImage(widget.widget.item.id);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Required for AutomaticKeepAliveClientMixin

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: context.secondaryTextColor.withOpacity(0.2),
        ),
        color: context.containerColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: FutureBuilder<Uint8List?>(
          future: _imageFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData && snapshot.data != null) {
              return Image.memory(
                snapshot.data!,
                height: 120,
                fit: BoxFit.cover,
              );
            } else {
              // Generate a more visually appealing random color
              final List<Color> colorPalette = [
                Colors.teal.shade300,
                Colors.cyan.shade300,
                Colors.amber.shade300,
                Colors.lightBlue.shade300,
                Colors.indigo.shade300,
              ];
              final randomColor =
                  colorPalette[Random().nextInt(colorPalette.length)];

              return Stack(
                children: [
                  // Colored background
                  Container(
                    color: randomColor,
                    height: 120,
                    width: double.infinity,
                  ),
                  // Glass morphism effect
                  Center(
                    child: Container(
                      height: 120,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                      // child: const Center(
                      //   child: Icon(
                      //     Icons.image_not_supported,
                      //     color: Colors.white,
                      //     size: 30,
                      //   ),
                      // ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
