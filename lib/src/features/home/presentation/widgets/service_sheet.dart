import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/types/services_type.dart';
import 'package:era_pro_application/src/features/home/presentation/widgets/home_service_widget.dart';
import 'package:flutter/material.dart';

class ServiceSheet extends StatelessWidget {
  const ServiceSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        color: context.whiteColor,
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              ' الخدمات',
              style: context.displayLarge,
            ),
            context.g16,
            Align(
              alignment: Alignment.topRight,
              child: Wrap(
                alignment: WrapAlignment.end,
                runAlignment: WrapAlignment.end,
                crossAxisAlignment: WrapCrossAlignment.end,
                spacing: context.sp20,
                runSpacing: context.sp20,
                children: [
                  ...ServicesType.values.reversed.take(3).map(
                        (service) => ServiceItemWidget(
                          color: service.color,
                          label: service.name,
                          icon: service.icon,
                          action: () {
                            service.action();
                          },
                        ),
                      )
                ],
              ),
            ),
            context.g20,
          ],
        ),
      ),
    );
  }
}
