import 'package:era_pro_application/src/core/extensions/context_extensions.dart';
import 'package:era_pro_application/src/core/utils/dialogs.dart';
import 'package:era_pro_application/src/core/utils/validatators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as data_formater;

class CustomTextFieldQuantityWidget extends StatefulWidget {
  final String textHint;
  final Function(String)? action;
  final String? placeHolder;
  final VoidCallback? onTap;
  final String label;
  final TextEditingController? controller;

  bool isLabeled;
  CustomTextFieldQuantityWidget({
    required this.textHint,
    required this.label,
    this.action,
    this.placeHolder = "",
    super.key,
    this.onTap,
    this.isLabeled = true,
    this.controller,
  });

  @override
  State<CustomTextFieldQuantityWidget> createState() =>
      _CustomTextFieldQuantityWidgetState();
}

class _CustomTextFieldQuantityWidgetState
    extends State<CustomTextFieldQuantityWidget> {
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 45,
      alignment: Alignment.center,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: TextInputType.number,
        style: context.bodyLarge,
        initialValue: widget.controller != null ? null : widget.placeHolder,
        inputFormatters: const [
          // FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
          // ThousandsSeparatorInputFormatter()
        ],
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        onChanged: (value) {
          // widget.action!(value);
          // Remove commas for validation
          if (widget.action != null) {
            widget.action!(value);
          }
        },
        onTap: () {
          if (widget.onTap != null) {
            widget.onTap!();
          }
        },
        decoration: InputDecoration(
          floatingLabelStyle: context.bodySmall,
          floatingLabelBehavior: widget.isLabeled
              ? FloatingLabelBehavior.always
              : FloatingLabelBehavior.never,
          fillColor: context.wightColor,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: context.secondaryTextColor.withOpacity(0.2),
              width: 0,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
            // width: 0.0 produces a thin "hairline" border
            borderSide: BorderSide(
              color: context.secondaryTextColor.withOpacity(0.2),
              width: 0,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          label: widget.isLabeled
              ? Text(
                  widget.label,
                )
              : null,
          floatingLabelAlignment: FloatingLabelAlignment.center,
          hintText: widget.textHint,
          hintStyle: context.bodySmall,
          labelStyle: context.bodySmall,
          contentPadding: const EdgeInsets.only(bottom: 12),
        ),
      ),
    );
  }
}

//
class CustomTextFieldWithLabelWidget extends StatefulWidget {
  final String textHint;
  final Function(String)? action;
  final String? placeHolder;
  final VoidCallback? onTap;
  final String label;
  final TextEditingController? controller;

  bool isLabeled;
  CustomTextFieldWithLabelWidget({
    required this.textHint,
    required this.label,
    this.action,
    this.placeHolder = "",
    super.key,
    this.onTap,
    this.isLabeled = true,
    this.controller,
  });

  @override
  State<CustomTextFieldWithLabelWidget> createState() =>
      _CustomTextFieldWithLabelWidgetState();
}

class _CustomTextFieldWithLabelWidgetState
    extends State<CustomTextFieldWithLabelWidget> {
  String? errorMessage;

  // Function to validate the price input
  void _validatePrice(String value) {
    if (value.isEmpty) {
      setState(() {
        errorMessage = 'Please enter a price';
      });
      widget.action!('');
    } else {
      final price = double.tryParse(value.replaceAll(',', ''));
      if (price == null || price < 0) {
        CustomDialog.customSnackBar(
            'ادخل القيم بشكل صحيح', SnackPosition.TOP, true);
      } else {
        setState(() {
          errorMessage = null; // Valid input
          widget.action!(value);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 45,
      alignment: Alignment.center,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: TextInputType.number,
        style: context.bodyLarge,
        initialValue: widget.controller != null ? null : widget.placeHolder,
        inputFormatters: const [
          // FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
          // ThousandsSeparatorInputFormatter()
        ],
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        onChanged: (value) {
          // widget.action!(value);
          _validatePrice(
              value.replaceAll(',', '')); // Remove commas for validation
        },
        onTap: () {
          if (widget.onTap != null) {
            widget.onTap!();
          }
        },
        decoration: InputDecoration(
          floatingLabelStyle: context.bodySmall,
          floatingLabelBehavior: widget.isLabeled
              ? FloatingLabelBehavior.always
              : FloatingLabelBehavior.never,
          fillColor: context.wightColor,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: context.secondaryTextColor.withOpacity(0.2),
              width: 0,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
            // width: 0.0 produces a thin "hairline" border
            borderSide: BorderSide(
              color: context.secondaryTextColor.withOpacity(0.2),
              width: 0,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          label: widget.isLabeled
              ? Text(
                  widget.label,
                )
              : null,
          floatingLabelAlignment: FloatingLabelAlignment.center,
          hintText: widget.textHint,
          hintStyle: context.bodySmall,
          labelStyle: context.bodySmall,
          contentPadding: const EdgeInsets.only(bottom: 12),
        ),
      ),
    );
  }
}

// Custom Input Formatter for adding commas
class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  final data_formater.NumberFormat _formatter =
      data_formater.NumberFormat("#,##0.00", "en_US");

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    // Remove all commas for formatting
    String newText = newValue.text.replaceAll(',', '');

    // Convert the plain number back to a formatted one
    double? value = double.tryParse(newText);
    if (value != null) {
      String formattedText = _formatter.format(value);

      // Maintain the cursor position based on the new formatted text
      int newSelectionIndex = formattedText.length -
          (newValue.text.length - newValue.selection.end);
      return TextEditingValue(
        text: formattedText,
        selection: TextSelection.collapsed(offset: newSelectionIndex),
      );
    }

    return newValue;
  }
}
