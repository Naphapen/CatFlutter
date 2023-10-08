import 'dart:math';

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:ielproject/utility/app_constant.dart';
import 'package:ielproject/utility/app_service.dart';
import 'package:ielproject/widgets/widget_button.dart';
import 'package:ielproject/widgets/widget_form.dart';
import 'package:ielproject/widgets/widget_text.dart';

class AddNewData extends StatefulWidget {
  const AddNewData({super.key});

  @override
  State<AddNewData> createState() => _AddNewDataState();
}

class _AddNewDataState extends State<AddNewData> {
  String? empIdCard, empNo;

  TextEditingController nameController = TextEditingController();
  TextEditingController eMailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    empIdCard = 'id-${Random().nextInt(100000)}';
    empNo = 'no-${Random().nextInt(100000)}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const WidgetText(data: 'Add New Data'),
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 250,
                  margin: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const WidgetText(data: 'Employnee Card : '),
                      WidgetText(
                        data: empIdCard ?? '',
                        textStyle: AppConstant().h2Style(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 250,
                  margin: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const WidgetText(data: 'Employnee No : '),
                      WidgetText(
                        data: empNo ?? '',
                        textStyle: AppConstant().h2Style(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 250,
                  height: 50,
                  margin: const EdgeInsets.only(top: 16),
                  child: WidgetForm(
                    ladelWidget: const WidgetText(
                      data: 'Name :',
                    ),
                    textEditingController: nameController,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 250,
                  height: 50,
                  margin: const EdgeInsets.only(top: 16),
                  child: WidgetForm(
                    ladelWidget: const WidgetText(data: 'E-mail :'),
                    textEditingController: eMailController,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 250,
                  height: 50,
                  margin: const EdgeInsets.only(top: 16),
                  child: WidgetForm(
                    ladelWidget: const WidgetText(data: 'Phone number :'),
                    textEditingController: phoneController,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 250,
                    height: 40,
                    margin: const EdgeInsets.only(top: 16),
                    child: WidgetButton(
                      label: 'Save',
                      gfButtonShape: GFButtonShape.pills,
                      gfButtonType: GFButtonType.outline,
                      pressFun: () {
                        Map<String, dynamic> map = {};
                        map['EmployeeIDCard'] = empIdCard;
                        map['EmployeeNo'] = empNo;
                        map['EmployeeTitleName'] = nameController;
                        map['EmployeeEmail'] = eMailController;
                        map['EmployeeMobileNo'] = phoneController;

                        AppService().insertNewData(map: map);
                      },
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
