// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class WidgetForm extends StatelessWidget {
  const WidgetForm({
    Key? key,
    this.hint,
    this.suffixIcon,
    this.obscureText,
    this.textEditingController,
    this.ladelWidget,
  }) : super(key: key);

  final String? hint;
  final Widget? suffixIcon;
  final bool? obscureText;
  final TextEditingController? textEditingController;
  final Widget? ladelWidget;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
          label: ladelWidget,
          filled: true,
          fillColor: Colors.grey.shade200,
          // border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(30),
          ),
          hintText: hint,
          suffixIcon: suffixIcon),
    );
  }
}
