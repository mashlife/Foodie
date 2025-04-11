import 'package:flutter/material.dart';
import 'package:foodie/utils/theme/color_ext.dart';

class FoodieTextfield extends StatelessWidget {
  const FoodieTextfield({
    super.key,
    required this.controller,
    this.hintText,
    this.labelText,
    this.hintFontStyle = FontStyle.normal,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType,
    this.obsecureText = false,
    this.validator,
    this.onChanged,
    this.focusNode,
    this.selectionControls,
  });

  final TextEditingController controller;
  final String? hintText;
  final String? labelText;
  final FontStyle hintFontStyle;
  final TextInputType? keyboardType;
  final bool obsecureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  final FocusNode? focusNode;
  final MaterialTextSelectionControls? selectionControls;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(25),
          bottomLeft: Radius.circular(19),
          bottomRight: Radius.circular(3),
        ),
        color: FColor.textField.withOpacity(0.8),
      ),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        autocorrect: false,
        controller: controller,
        obscureText: obsecureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            hintText: hintText,
            labelText: labelText,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            hintStyle: TextStyle(fontSize: 14, fontStyle: hintFontStyle),
            labelStyle:
                const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 3),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: FColor.placeHolder),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: FColor.highlight),
              borderRadius: BorderRadius.circular(15),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(15),
            )),
        onChanged: onChanged,
        focusNode: focusNode,
        selectionControls: selectionControls,
      ),
    );
  }
}
