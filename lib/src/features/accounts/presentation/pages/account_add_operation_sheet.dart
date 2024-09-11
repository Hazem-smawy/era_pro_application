import 'package:era_pro_application/src/core/constants/assets.dart';
import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AccountAddOperationSheet extends StatelessWidget {
  const AccountAddOperationSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(top: 30),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: context.wightColor.withOpacity(0.7),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              //backgroundColor: const Color(0xffF7BC56),
              child: Image.asset(
                Assets.assetsImagesAvatar1,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'محمد علي',
              style: context.titleLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              // height: 70,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: context.containerColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: context.secondaryTextColor.withOpacity(0.5),
                      ),
                    ),
                    child: const FaIcon(
                      FontAwesomeIcons.plus,
                      color: Colors.black87,
                      size: 20,
                    ),
                  ),
                  const Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomerAddSheetItemWidget(
                          icon: FontAwesomeIcons.arrowTurnDown,
                          label: 'مردود',
                          color: Colors.black87,
                        ),
                        CustomerAddSheetItemWidget(
                          icon: FontAwesomeIcons.arrowTrendDown,
                          label: 'سند قبض',
                          color: Colors.black87,
                        ),
                        CustomerAddSheetItemWidget(
                          icon: FontAwesomeIcons.arrowTrendUp,
                          label: 'سند صرف',
                          color: Colors.black87,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomerAddSheetItemWidget extends StatelessWidget {
  const CustomerAddSheetItemWidget({
    required this.icon,
    required this.label,
    required this.color,
    super.key,
  });
  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          FaIcon(
            icon,
            color: color,
            size: 20,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            label,
            style: context.bodyLarge,
          )
        ],
      ),
    );
  }
}
