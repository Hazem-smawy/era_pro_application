import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BillsItemWidget extends StatelessWidget {
  const BillsItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: context.blackColor.withOpacity(0.1),
        ),
      ),
      child: Column(children: [
        Row(
          children: [
            FaIcon(
              FontAwesomeIcons.solidTrashCan,
              color: Colors.red.withOpacity(0.8),
              size: 20,
            ),
            const SizedBox(
              width: 20,
            ),
            FaIcon(
              FontAwesomeIcons.penToSquare,
              color: Colors.green.withOpacity(0.8),
              size: 20,
            ),
            const Spacer(),
            // Container(
            //   padding:
            //       const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(15),
            //     color: const Color(0xff5396E4).withOpacity(0.1),
            //   ),
            //   child: Text(
            //     'مبيعات',
            //     style: MyTextStyles.subTitle.copyWith(
            //       color: const Color(0xff5396E4),
            //     ),
            //   ),
            // ),
            context.g8,

            Text('110', style: context.titleSmall),
            context.g4,
            Text(
              ':رقم الفاتورة',
              style: context.bodySmall,
            ),
          ],
        ),
        context.g20,
        Row(
          children: [
            Text('ر.ي', style: context.bodySmall),
            context.g4,
            Text('948.55', style: context.titleSmall),
            const Spacer(),
            Text('محمد عبده  مجلي', style: context.titleLarge),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xff37BD6D).withOpacity(0.1),
              ),
              child: Text(
                'نقداً',
                style: context.titleMedium
                    .copyWith(color: const Color(0xff37BD6D)),
              ),
            ),
            const Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '06:42 am',
                  style: context.bodyLarge,
                ),
                context.g8,
                Icon(
                  Icons.alarm,
                  size: 20,
                  color: context.secondaryTextColor,
                )
              ],
            ),
            const Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '16/08/2013',
                  style: context.bodyLarge,
                ),
                context.g8,
                Icon(
                  Icons.calendar_today_outlined,
                  size: 20,
                  color: context.secondaryTextColor,
                )
              ],
            )
          ],
        ),
      ]),
    );
  }
}


/*

 context.g16,
            const BillsItemWidget(),
            context.g16,
            Slidable(
              // Specify a key if the Slidable is dismissible.
              key: const ValueKey(0),

              // The start action pane is the one at the left or the top side.
              startActionPane: ActionPane(
                // A motion is a widget used to control how the pane animates.
                motion: const ScrollMotion(),

                // A pane can dismiss the Slidable.
                dismissible: DismissiblePane(onDismissed: () {}),

                // All actions are defined in the children parameter.
                children: [
                  // A SlidableAction can have an icon and/or a label.
                  SlidableAction(
                    onPressed: (context) {},
                    backgroundColor: const Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                  SlidableAction(
                    onPressed: (context) {},
                    backgroundColor: const Color(0xFF21B7CA),
                    foregroundColor: Colors.white,
                    icon: Icons.share,
                    label: 'Share',
                  ),
                ],
              ),

              // The end action pane is the one at the right or the bottom side.
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    // An action can be bigger than the others.
                    flex: 2,
                    onPressed: (context) {},
                    backgroundColor: const Color(0xFF7BC043),
                    foregroundColor: Colors.white,
                    icon: Icons.archive,
                    label: 'Archive',
                  ),
                  SlidableAction(
                    onPressed: (context) {},
                    backgroundColor: const Color(0xFF0392CF),
                    foregroundColor: Colors.white,
                    icon: Icons.save,
                    label: 'Save',
                  ),
                ],
              ),

              // The child of the Slidable is what the user sees when the
              // component is not dragged.
              child: const BillsItemWidget(),
            ),
*/