import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/extensions/padding_extension.dart';
import 'package:era_pro_application/src/core/types/services_type.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class ServiceWidget extends StatelessWidget {
  const ServiceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: context.wightColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'الخدمات',
            style: context.displayMeduim,
          ).ph(context.sp20).pt(context.sp16),
          Align(
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              runAlignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.end,
              spacing: context.sp20,
              runSpacing: context.sp16,
              children: ServicesType.values
                  .map((service) => ServiceItemWidget(
                        color: service.color,
                        label: service.name,
                        icon: service.icon,
                        action: () {
                          service.action();
                        },
                      ))
                  .toList(),
            ).p(context.sp12),
          ),
        ],
      ),
    );
  }
}

class ServiceItemWidget extends StatelessWidget {
  const ServiceItemWidget({
    super.key,
    required this.color,
    required this.action,
    required this.label,
    required this.icon,
  });
  final Color color;
  final String label;
  final VoidCallback action;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => action(),
      child: Column(
        children: [
          Container(
            width: context.width / 4.5,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: color.withOpacity(0.1),
            ),
            child: Icon(
              icon,
              color: color,
              size: 30,
            ),
          ),
          context.g12,
          SizedBox(
            width: 100,
            child: Text(
              label,
              textAlign: TextAlign.center,
              overflow: TextOverflow.fade,
              style: context.bodySmall,
            ),
          )
        ],
      ),
    );
  }
}
