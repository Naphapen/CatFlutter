import 'package:flutter/material.dart';
import 'package:ielproject/widgets/widget_button.dart';
import 'package:ielproject/widgets/widget_icon_button.dart';
import 'package:ielproject/widgets/widget_text.dart';

class ShowMap extends StatelessWidget {
  const ShowMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WidgetText(
          data: 'Show Map',
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.pin_drop),
        ));
  }
}
