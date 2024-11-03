import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class PriceDialogWidget extends StatelessWidget {
  const PriceDialogWidget({
    super.key,
    required this.number,
    this.isSelected = false,
    required this.action,
  });

  final int number;
  final bool isSelected;
  final Function action;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        action();
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: isSelected
                  ? Colors.transparent
                  : context.blackColor.withOpacity(0.1),
            ),
            color: isSelected ? context.primaryColor : null),
        child: Center(
          child: Text(
            number.toString(),
            style: context.bodyMeduim?.copyWith(
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

// class _CustomTextFieldWithLabelWidgetState
//     extends State<CustomTextFieldWithLabelWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       //height: 45,
//       alignment: Alignment.center,

//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: TextFormField(
//         keyboardType: TextInputType.number,
//         initialValue: widget.placeHolder ?? "",
//         textAlign: TextAlign.center,
//         textDirection: TextDirection.rtl,
//         onChanged: (value) {
//           if (widget.action != null) {
//             widget.action!(value);
//           }
//         },
//         onTap: () {
//           if (widget.onTap != null) {
//             widget.onTap!();
//           }
//         },
//         decoration: InputDecoration(
//           floatingLabelStyle: context.bodySmall,
//           floatingLabelBehavior: widget.isLabeled
//               ? FloatingLabelBehavior.always
//               : FloatingLabelBehavior.never,
//           fillColor: context.wightColor,
//           filled: true,
//           border: OutlineInputBorder(
//             borderSide: BorderSide(
//               color: context.secondaryTextColor.withOpacity(0.2),
//               width: 0,
//             ),
//             borderRadius: BorderRadius.circular(20),
//           ),
//           enabledBorder: OutlineInputBorder(
//             // width: 0.0 produces a thin "hairline" border
//             borderSide: BorderSide(
//               color: context.secondaryTextColor.withOpacity(0.2),
//               width: 0,
//             ),
//             borderRadius: BorderRadius.circular(20),
//           ),
//           label: widget.isLabeled
//               ? Text(
//                   widget.label,
//                 )
//               : null,
//           floatingLabelAlignment: FloatingLabelAlignment.center,
//           hintText: widget.textHint,
//           hintStyle: const TextStyle(
//             fontWeight: FontWeight.normal,
//             fontSize: 12,
//           ),
//           contentPadding: const EdgeInsets.only(bottom: 12),
//         ),
//       ),
//     );
//   }
// }
