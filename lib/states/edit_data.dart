// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import 'package:ielproject/models/data_model.dart';
import 'package:ielproject/utility/app_constant.dart';
import 'package:ielproject/utility/app_service.dart';
import 'package:ielproject/utility/app_snackbar.dart';
import 'package:ielproject/widgets/widget_button.dart';
import 'package:ielproject/widgets/widget_form.dart';
import 'package:ielproject/widgets/widget_text.dart';

class EditData extends StatefulWidget {
  const EditData({
    Key? key,
    required this.dataModel,
  }) : super(key: key);

  final DataModel dataModel;

  @override
  State<EditData> createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  String? empIdCard, empNo;

  TextEditingController nameController = TextEditingController();
  TextEditingController eMailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool change = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    empIdCard = widget.dataModel.employeeIDCard;
    empNo = widget.dataModel.employeeNo;

    nameController.text = widget.dataModel.employeeTitleName!;
    eMailController.text = widget.dataModel.employeeEmail!;
    phoneController.text = widget.dataModel.employeeMobileNo!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const WidgetText(data: 'Edit Data'),
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
                    changeFunc: (v) {
                      change = true;
                    },
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
                    changeFunc: (v) {
                      change = true;
                    },
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
                    changeFunc: (v) {
                      change = true;
                    },
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
                      label: 'Edit Data',
                      gfButtonShape: GFButtonShape.pills,
                      gfButtonType: GFButtonType.outline,
                      pressFun: () {
                        if (change) {
                          //

                          Map<String, dynamic> map = {};
                          map['Id'] = widget.dataModel.id;
                          // map['EmployeeNo'] = empNo;
                          map['EmployeeTitleName'] = nameController.text;
                          map['EmployeeEmail'] = eMailController.text;
                          map['EmployeeMobileNo'] = phoneController.text;
                          // print("edit --> $map");
                          AppService().updateData(map: map);
                        } else {
                          AppSnackBar(
                                  title: 'แจ้งเตือน',
                                  message: 'ไม่มีการเปลี่ยนแปลง')
                              .errorSnackbar();
                        }
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
