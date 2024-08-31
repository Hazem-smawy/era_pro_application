import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchAppbarWidget extends StatelessWidget {
  const SearchAppbarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: context.wightColor,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    //initialValue: widget.placeHolder ?? "",
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                    style: context.bodyLarge?.copyWith(
                      color: context.blackColor,
                      fontWeight: FontWeight.bold,
                    ),
                    onChanged: (value) {},
                    onTap: () {},
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'البحث عن',
                      hintStyle: context.bodyMeduim?.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                      contentPadding: const EdgeInsets.only(
                        right: 10,
                        bottom: 10,
                      ),
                    ),
                  ),
                ),
                // const SizedBox(
                //   width: 5,
                // ),
                Icon(
                  Icons.search,
                  size: 20,
                  color: context.secondaryTextColor,
                ),
                context.g12,
              ],
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.chevron_right_outlined,
            size: 27,
            color: context.secondaryTextColor,
          ),
        )
      ],
    );
  }
}
