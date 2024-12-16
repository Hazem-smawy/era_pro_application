import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/extensions/padding_extension.dart';
import 'package:era_pro_application/src/core/types/main_info_types.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

import '../widgets/main_info_widget.dart';

class MainInfoPage extends StatelessWidget {
  const MainInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.whiteColor,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Opacity(
                opacity: 0.05,
                child: Transform.rotate(
                  angle: math.pi / 4,
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: FaIcon(
                      size: context.width,
                      FontAwesomeIcons.star,
                      color: context.secondary,
                    ),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Opacity(
                opacity: 0.05,
                child: Transform.rotate(
                  angle: math.pi / 4,
                  child: Container(
                    alignment: Alignment.bottomRight,
                    child: FaIcon(
                      size: context.width / 2,
                      FontAwesomeIcons.star,
                      color: context.secondary,
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Expanded(
                  child: GridView.count(
                    padding: const EdgeInsets.only(bottom: 110),
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 30,
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    children: MainInfoTypes.items
                        .map((e) => MainInfoItemWidget(
                              color: e.color,
                              icon: e.icon,
                              title: e.title,
                              action: e.action,
                            ))
                        .toList(),
                  ),
                ),
              ],
            ).p(20),
          ],
        ),
      ),
    );
  }
}
