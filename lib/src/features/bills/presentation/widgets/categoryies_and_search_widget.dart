import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/features/bills/presentation/getX/bills_getx.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CategoriesWithSearchWidget extends StatefulWidget {
  const CategoriesWithSearchWidget({super.key});

  @override
  State<CategoriesWithSearchWidget> createState() =>
      _CategoriesWithSearchWidgetState();
}

class _CategoriesWithSearchWidgetState
    extends State<CategoriesWithSearchWidget> {
  bool isSearchFieldOpen = false;
  BillController itemController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 40,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                itemController.filterItemsByGroup(0);

                setState(() {
                  isSearchFieldOpen = !isSearchFieldOpen;
                });
              },
              child: Container(
                height: 40,
                width: 40,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xffF1F2F6),
                ),
                child: Center(
                  child: FaIcon(
                    FontAwesomeIcons.magnifyingGlass,
                    color: context.secondaryTextColor,
                    size: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            if (isSearchFieldOpen)
              Expanded(
                child: AnimatedContainer(
                  duration: const Duration(microseconds: 200),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: context.bg,
                  ),
                  child: TextFormField(
                    //initialValue: widget.placeHolder ?? "",
                    textAlign: TextAlign.right,

                    textDirection: TextDirection.rtl,
                    style: context.titleSmall?.copyWith(
                      color: context.blackColor,
                      fontWeight: FontWeight.bold,
                    ),
                    onChanged: (value) {
                      itemController.filterItemsBySearch(value);
                    },
                    onTap: () {},
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'البحث عن',
                      hintStyle: context.bodySmall?.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                      contentPadding: const EdgeInsets.only(
                        right: 20,
                        left: 10,
                        bottom: 10,
                      ),
                    ),
                  ),
                ),
              ),
            if (!isSearchFieldOpen)
              Expanded(
                child: Obx(
                  () => AnimatedContainer(
                    duration: const Duration(microseconds: 200),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      // color: const Color(0xff777777),
                    ),
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      reverse: true,
                      itemCount: itemController.groups.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          width: 5,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        final group = itemController.groups[index];
                        return GestureDetector(
                          onTap: () {
                            itemController.filterItemsByGroup(group.code);
                          },
                          child: Container(
                            height: 40,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: itemController.selectedGroupId.value ==
                                        group.code
                                    ? context.secondary
                                    : const Color(0xffF1F2F6)),
                            child: Center(
                              child: Text(
                                group.name,
                                style: context.bodySmall?.copyWith(
                                  color: itemController.selectedGroupId.value ==
                                          group.code
                                      ? context.wightColor
                                      : context.secondaryTextColor,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            const SizedBox(
              width: 5,
            ),
            if (isSearchFieldOpen)
              GestureDetector(
                onTap: () {
                  itemController.filterItemsByGroup(0);

                  setState(() {
                    isSearchFieldOpen = false;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(microseconds: 200),
                  height: 40,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: context.secondaryTextColor.withOpacity(0.2),
                    ),
                  ),
                  child: Center(
                    child: FaIcon(
                      FontAwesomeIcons.shapes,
                      color: context.secondaryTextColor,
                      size: 20,
                    ),
                  ),
                ),
              ),
            if (!isSearchFieldOpen)
              Container(
                height: 40,
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: itemController.selectedGroupId.value == 0
                      ? context.secondary
                      : const Color(0xffF1F2F6),
                  border: Border.all(
                    color: context.secondaryTextColor.withOpacity(0.2),
                  ),
                ),
                child: GestureDetector(
                  onTap: () {
                    itemController.filterItemsByGroup(0);
                  },
                  child: Center(
                    child: Text(
                      'الكل',
                      style: context.bodySmall?.copyWith(
                        color: itemController.selectedGroupId.value == 0
                            ? context.wightColor
                            : context.secondaryTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
