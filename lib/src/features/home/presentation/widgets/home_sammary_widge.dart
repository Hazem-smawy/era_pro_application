import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/features/home/presentation/widgets/home_sammary_item_widget.dart';
import 'package:flutter/material.dart';

class HomeSammaryWidget extends StatelessWidget {
  const HomeSammaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const HomeSummaryItemWidget(
              color: Colors.red,
              icon: Icons.trending_down,
              title: 'المرتجعات',
            ),
            context.g8,
            const HomeSummaryItemWidget(
              color: Colors.green,
              icon: Icons.trending_up,
              title: 'المبيعات',
            ),
          ],
        ),
        context.g12,
        Row(
          children: [
            const HomeSummaryItemWidget(
              color: Colors.red,
              icon: Icons.trending_down,
              title: 'سند صرف',
            ),
            context.g8,
            const HomeSummaryItemWidget(
              color: Colors.green,
              icon: Icons.trending_up,
              title: 'سند قبض',
            ),
          ],
        ),
      ],
    );
  }
}
