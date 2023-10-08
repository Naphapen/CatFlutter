// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import 'package:ielproject/widgets/widget_text.dart';

class WidgetButton extends StatelessWidget {
  const WidgetButton({
    Key? key,
    required this.label,
    required this.pressFun,
    this.gfButtonShape,
    this.gfButtonType,
    this.color,
  }) : super(key: key);

  final String label;
  final Function() pressFun;
  final GFButtonShape? gfButtonShape;
  final GFButtonType? gfButtonType;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GFButton(
      onPressed: pressFun,
      text: label,
      shape: gfButtonShape ?? GFButtonShape.standard,
      type: gfButtonType ?? GFButtonType.solid,
      color: color ?? Colors.orange.shade400,
    );
  }
}
