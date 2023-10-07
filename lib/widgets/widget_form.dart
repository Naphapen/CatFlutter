// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class WidgetForm extends StatelessWidget {
  const WidgetForm({
    Key? key,
    this.hint,
    this.suffixIcon,
    this.obscureText,
    this.textEditingController,
  }) : super(key: key);

  final String? hint;
  final Widget? suffixIcon;
  final bool? obscureText;
  final TextEditingController? textEditingController;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
          filled: true,
          border: InputBorder.none,
          //  OutlineInputBorder(
          //     borderSide: BorderSide(color: Colors.black54),
          //     borderRadius: BorderRadius.circular(30)),
          hintText: hint,
          suffixIcon: suffixIcon),
    );
  }
}
