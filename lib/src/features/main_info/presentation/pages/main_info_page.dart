import 'package:era_pro_application/src/core/extensions/padding_extension.dart';
import 'package:era_pro_application/src/core/types/main_info_types.dart';
import 'package:flutter/material.dart';

import '../widgets/main_info_widget.dart';

class MainInfoPage extends StatelessWidget {
  const MainInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                padding: const EdgeInsets.only(bottom: 110),
                crossAxisSpacing: 20,
                mainAxisSpacing: 15,
                crossAxisCount: 2,
                childAspectRatio: .8,
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
      ),
    );
  }
}
