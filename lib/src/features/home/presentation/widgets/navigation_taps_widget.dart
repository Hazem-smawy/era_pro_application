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
        width: context.width - 40,
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
                  border: Border.all(
                      color: context.secondaryTextColor.withOpacity(
                    0.2,
                  )),
                  color: index == 3 ? context.primary : context.whiteColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  Icons.cloud_outlined,
                  color: index == 3
                      ? context.whiteColor
                      : context.secondaryTextColor,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  // height: 60,
                  width: 240,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: context.whiteColor,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                        color: context.secondaryTextColor.withOpacity(
                      0.2,
                    )),
                    boxShadow: const [],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //const SizedBox(width: 20),
                      NavigationTapWidget(
                        pageController: pageController,
                        index: index,
                        icon: Icons.settings_outlined,
                        animateToPage: 2,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      NavigationTapWidget(
                        pageController: pageController,
                        index: index,
                        icon: Icons.menu_outlined,
                        animateToPage: 1,
                      ),

                      const SizedBox(
                        width: 10,
                      ),
                      NavigationTapWidget(
                        pageController: pageController,
                        index: index,
                        icon: Icons.home_outlined,
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
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: index == animateToPage
              ? context.primaryColor
              : context.containerColor.withOpacity(0),
        ),
        child: Center(
          child: FaIcon(
            icon,
            // size: 20,
            color: index == animateToPage
                ? context.whiteColor
                : context.secondaryTextColor,
          ),
        ),
      ),
    );
  }
}
