import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/features/main_info/domain/entities/curency_entity.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CurencyItemWidget extends StatelessWidget {
  final CurencyEntity curency;
  const CurencyItemWidget({
    super.key,
    required this.curency,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: context.secondaryTextColor.withOpacity(0.2),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CurencyAttributeWidget(
                label: 'اسم العملة',
                value: curency.name,
              ),
              CurencyAttributeWidget(
                label: 'اسم العملة',
                value: curency.name,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CurencyAttributeWidget(
                label: 'اسم العملة',
                value: curency.name,
              ),
              CurencyAttributeWidget(
                label: 'اسم العملة',
                value: curency.name,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CurencyAttributeWidget(
                label: 'اسم العملة',
                value: curency.name,
              ),
              CurencyAttributeWidget(
                label: 'اسم العملة',
                value: curency.name,
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Text(
                    'عملة مخزون',
                    style: context.titleSmall,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  FaIcon(
                    FontAwesomeIcons.circle,
                    color: context.secondaryTextColor,
                    size: 20,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'عملة محلية',
                    style: context.bodyLarge,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  FaIcon(
                    FontAwesomeIcons.circleCheck,
                    color: context.primaryColor,
                    size: 20,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CurencyAttributeWidget extends StatelessWidget {
  const CurencyAttributeWidget(
      {super.key, required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: context.secondaryTextColor.withOpacity(0.5),
            ),
          ),
          child: Text(
            value,
            style: context.bodySmall,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          'اسم العملة',
          style: context.bodySmall,
        ),
      ],
    );
  }
}
