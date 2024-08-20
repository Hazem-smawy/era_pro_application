// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:era_pro_application/src/core/extensions/context_extensions.dart';

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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AnimatedContainer(
            duration: const Duration(microseconds: 300),
            height: 80,
            width: 240,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: context.wightColor,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: context.blackColor.withOpacity(0.1),
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
          duration: const Duration(microseconds: 200),
          curve: Curves.decelerate,
        );
      },
      child: AnimatedContainer(
        duration: const Duration(microseconds: 200),
        width: 66,
        height: 66,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: index == animateToPage
              ? context.primaryColor
              : context.containerColor.withOpacity(0),
        ),
        child: Center(
          child: FaIcon(
            icon,
            size: 22,
            color: index == animateToPage
                ? context.wightColor
                : context.blackColor,
          ),
        ),
      ),
    );
  }
}
