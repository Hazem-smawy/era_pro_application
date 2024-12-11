import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/widgets/circle_back_btn_widget.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget(
      {super.key, required this.title, this.sortAction, this.filterAction});
  final Function? sortAction;
  final Function? filterAction;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (sortAction != null)
          Row(children: [
            IconButton(
              onPressed: () {
                sortAction!();
              },
              icon: Icon(
                Icons.sort_rounded,
                size: 22,
                color: context.secondaryTextColor,
              ),
            ),
            IconButton(
              onPressed: () {
                if (filterAction!() != null) {
                  filterAction!();
                }
              },
              icon: Icon(
                Icons.filter,
                size: 22,
                color: context.secondaryTextColor,
              ),
            ),
          ]),
        if (sortAction == null)
          const SizedBox(
            width: 50,
          ),
        // if (sortAction == null) const Spacer(),
        const Spacer(),
        Text(
          title,
          style: context.titleMedium,
        ),
        const Spacer(),
        if (sortAction != null)
          const SizedBox(
            width: 50,
          ),
        const CircleBackBtnWidget()
      ],
    );
  }
}
