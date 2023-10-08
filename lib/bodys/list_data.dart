import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ielproject/states/add_new_data.dart';
import 'package:ielproject/widgets/widget_button.dart';
import 'package:ielproject/widgets/widget_text.dart';

class ListData extends StatelessWidget {
  const ListData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WidgetText(data: 'List Data'),
      floatingActionButton: WidgetButton(
          label: 'Add Data',
          pressFun: () {
            Get.to(const AddNewData());
          }),
    );
  }
}
