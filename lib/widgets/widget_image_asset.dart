// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class WidgetImageAsset extends StatelessWidget {
  const WidgetImageAsset({
    Key? key,
    this.sizeWidth,
    this.pathImage,
  }) : super(key: key);

  final double? sizeWidth;
  final String? pathImage;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      pathImage ?? 'images/logo.png',
      width: sizeWidth,
    );
  }
}
