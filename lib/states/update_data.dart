import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ielproject/utility/app_controller.dart';
import 'package:ielproject/widgets/widget_text.dart';

class UpdataData extends StatefulWidget {
  const UpdataData({super.key});

  @override
  State<UpdataData> createState() => _UpdataDataState();
}

class _UpdataDataState extends State<UpdataData> {
  AppController appController = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: WidgetText(data: 'Updata Data'),
      ),
      body: Obx(() {
        return appController.position.isEmpty
            ? SizedBox()
            : WidgetText(data: '${appController.position.last.latitude}');
      }),
    );
  }
}
