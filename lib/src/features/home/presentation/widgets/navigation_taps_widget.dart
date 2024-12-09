// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:get/get.dart';

class NavigationTapsWidget extends StatelessWidget {
  const NavigationTapsWidget({
    super.key,
    required this.pageController,
    required this.index,
  });

  final PageController pageController;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 15,
      right: 20,
      child: SizedBox(
        width: context.width - 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                pageController.animateToPage(
                  3,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                );
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: context.containerColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  FontAwesomeIcons.cloud,
                  color:
                      index == 3 ? context.primary : context.secondaryTextColor,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 70,
                  width: 240,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: context.whiteColor,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: context.blackColor.withOpacity(0.07),
                        offset: const Offset(1, 1),
                        blurRadius: 10,
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //const SizedBox(width: 20),
                      NavigationTapWidget(
                        pageController: pageController,
                        index: index,
                        icon: FontAwesomeIcons.gear,
                        animateToPage: 2,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      NavigationTapWidget(
                        pageController: pageController,
                        index: index,
                        icon: FontAwesomeIcons.bars,
                        animateToPage: 1,
                      ),

                      const SizedBox(
                        width: 10,
                      ),
                      NavigationTapWidget(
                        pageController: pageController,
                        index: index,
                        icon: FontAwesomeIcons.house,
                        animateToPage: 0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NavigationTapWidget extends StatelessWidget {
  const NavigationTapWidget({
    super.key,
    required this.pageController,
    required this.index,
    required this.icon,
    required this.animateToPage,
  });

  final PageController pageController;
  final int index;
  final IconData icon;
  final int animateToPage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pageController.animateToPage(
          animateToPage,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
        );
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: index == animateToPage
              ? context.primaryColor
              : context.containerColor.withOpacity(0),
        ),
        child: Center(
          child: FaIcon(
            icon,
            size: 22,
            color: index == animateToPage
                ? context.whiteColor
                : context.blackColor,
          ),
        ),
      ),
    );
  }
}
