import 'package:flutter/material.dart';
import 'package:ielproject/utility/app_service.dart';
import 'package:ielproject/widgets/widget_button.dart';
import 'package:ielproject/widgets/widget_icon_button.dart';
import 'package:ielproject/widgets/widget_text.dart';

class ShowMap extends StatefulWidget {
  const ShowMap({super.key});

  @override
  State<ShowMap> createState() => _ShowMapState();
}

class _ShowMapState extends State<ShowMap> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AppService().processFindPosition();
  }

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
