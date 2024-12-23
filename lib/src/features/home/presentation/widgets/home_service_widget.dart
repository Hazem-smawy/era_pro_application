import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/types/services_type.dart';
import 'package:era_pro_application/src/features/home/presentation/widgets/service_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

class HomeServiceWidget extends StatelessWidget {
  const HomeServiceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            "الخدمات",
            style: context.displayLarge,
          ),
        ),
        context.g12,
        Align(
          alignment: Alignment.centerRight,
          child: Wrap(
            alignment: WrapAlignment.end,
            runAlignment: WrapAlignment.end,
            crossAxisAlignment: WrapCrossAlignment.end,
            spacing: context.sp20,
            runSpacing: context.sp20,
            children: [
              ServiceItemWidget(
                color: Colors.grey,
                action: () {
                  Get.bottomSheet(const ServiceSheet());
                },
                label: 'المزيد',
                icon: Icons.grid_view_rounded,
              ),
              ...ServicesType.values.take(3).map((service) => ServiceItemWidget(
                    color: service.color,
                    label: service.name,
                    icon: service.icon,
                    action: () {
                      service.action();
                    },
                  ))
            ],
          ),
        ),
      ],
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
            height: context.width / 5.6,
            width: context.width / 5.6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withOpacity(0.07),
            ),
            child: Icon(
              icon,
              color: color,
              size: 23,
            ),
          ),
          context.g4,
          SizedBox(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                label,
                textAlign: TextAlign.center,
                overflow: TextOverflow.fade,
                style: context.bodyMedium.copyWith(
                  color: context.blackColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}


// class ServiceItemWidget extends StatelessWidget {
//   const ServiceItemWidget({
//     super.key,
//     required this.color,
//     required this.action,
//     required this.label,
//     required this.icon,
//   });
//   final Color color;
//   final String label;
//   final VoidCallback action;
//   final IconData icon;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => action(),
//       child: Column(
//         children: [
//           Container(
//             width: context.width / 5.2,
//             height: 80,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(15),
//               color: color.withOpacity(0.1),
//             ),
//             child: Icon(
//               icon,
//               color: color,
//               size: 30,
//             ),
//           ),
//           context.g12,
//           SizedBox(
//             width: 100,
//             child: Text(
//               label,
//               textAlign: TextAlign.center,
//               overflow: TextOverflow.fade,
//               style: context.bodySmall,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
