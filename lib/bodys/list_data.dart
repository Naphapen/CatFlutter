import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:ielproject/states/add_new_data.dart';
import 'package:ielproject/states/edit_data.dart';
import 'package:ielproject/utility/app_controller.dart';
import 'package:ielproject/utility/app_dialog.dart';
import 'package:ielproject/utility/app_service.dart';
import 'package:ielproject/widgets/widget_button.dart';
import 'package:ielproject/widgets/widget_process.dart';
import 'package:ielproject/widgets/widget_text.dart';

class ListData extends StatefulWidget {
  const ListData({super.key});

  @override
  State<ListData> createState() => _ListDataState();
}

class _ListDataState extends State<ListData> {
  ScrollController scrollController = ScrollController();

  AppController appController = Get.put(AppController());
  @override
  void initState() {
    super.initState();
    AppService().processReadAllData();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.minScrollExtent) {
        AppService().processReadAllData();
        print("object");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        //  print("--> ${appController.dataModels}");
        return appController.load.isTrue
            ? const WidgetProcess()
            : appController.dataModels.isEmpty
                ? SizedBox()
                : ListView.builder(
                    controller: scrollController,
                    itemCount: appController.dataModels.length,
                    itemBuilder: (context, idx) => Slidable(
                      key: const ValueKey(0),
                      endActionPane:
                          ActionPane(motion: const ScrollMotion(), children: [
                        SlidableAction(
                          onPressed: (context) {
                            AppDialog().normalDialog(
                              title:
                                  "ต้องการลบ ${appController.dataModels[idx].employeeTitleName}",
                              actionWidget: WidgetButton(
                                label: "ต้องการลบ",
                                pressFun: () {
                                  AppService().deleteData(
                                      id: appController.dataModels[idx].id!);
                                },
                              ),
                            );
                          },
                          icon: Icons.delete_forever,
                          label: "Delete",
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                        ),
                        SlidableAction(
                          onPressed: (context) {
                            Get.to(
                              EditData(
                                dataModel: appController.dataModels[idx],
                              ),
                            )?.then(
                                (value) => AppService().processReadAllData());
                          },
                          icon: Icons.edit,
                          label: "edit",
                          backgroundColor: Colors.amber,
                          foregroundColor: Colors.white,
                        ),
                      ]),
                      child: SizedBox(
                        width: Get.size.width,
                        child: InkWell(
                          onTap: () {
                            AppDialog().normalDialog(
                                title:
                                    "${appController.dataModels[idx].employeeNo}",
                                contentWidget: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    deplayValue(
                                        head: 'Name',
                                        value:
                                            "${appController.dataModels[idx].employeeTitleName}"),
                                    deplayValue(
                                        head: 'E-mail',
                                        value:
                                            "${appController.dataModels[idx].employeeMobileNo}"),
                                    deplayValue(
                                        head: 'Phone number',
                                        value:
                                            "${appController.dataModels[idx].employeeMobileNo}"),
                                    deplayValue(
                                        head: 'CreatedBy',
                                        value:
                                            "${appController.dataModels[idx].createdBy}"),
                                    deplayValue(
                                        head: 'Created Date',
                                        value:
                                            "${appController.dataModels[idx].createdDT}"),
                                    deplayValue(
                                        head: 'Emp id',
                                        value:
                                            "${appController.dataModels[idx].id}"),
                                    deplayValue(
                                        head: 'Name',
                                        value:
                                            "${appController.dataModels[idx].employeeTitleName}"),
                                    deplayValue(
                                        head: 'Name',
                                        value:
                                            "${appController.dataModels[idx].employeeTitleName}"),
                                    deplayValue(
                                        head: 'Name',
                                        value:
                                            "${appController.dataModels[idx].employeeTitleName}"),
                                    deplayValue(
                                        head: 'Name',
                                        value:
                                            "${appController.dataModels[idx].employeeTitleName}"),
                                    deplayValue(
                                        head: 'Name',
                                        value:
                                            "${appController.dataModels[idx].employeeTitleName}"),
                                    deplayValue(
                                        head: 'Name',
                                        value:
                                            "${appController.dataModels[idx].employeeTitleName}"),
                                    deplayValue(
                                        head: 'Name',
                                        value:
                                            "${appController.dataModels[idx].employeeTitleName}"),
                                    deplayValue(
                                        head: 'Name',
                                        value:
                                            "${appController.dataModels[idx].employeeTitleName}"),
                                    deplayValue(
                                        head: 'Name',
                                        value:
                                            "${appController.dataModels[idx].employeeTitleName}"),
                                  ],
                                ),
                                actionWidget: WidgetButton(
                                    label: 'Edit',
                                    pressFun: () {
                                      Get.to(
                                        EditData(
                                          dataModel:
                                              appController.dataModels[idx],
                                        ),
                                      )?.then((value) =>
                                          AppService().processReadAllData());
                                    }));
                          },
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Card(
                              color: (idx % 2 == 0)
                                  ? Colors.orange.shade100
                                  : Colors.orange.shade200,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    deplayValue(
                                        head: 'EmployeeNo',
                                        value:
                                            "${appController.dataModels[idx].employeeNo}"),
                                    deplayValue(
                                        head: 'EmployeeIDCard',
                                        value:
                                            "${appController.dataModels[idx].employeeIDCard}"),
                                    deplayValue(
                                        head: 'Name',
                                        value:
                                            "${appController.dataModels[idx].employeeTitleName}"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
      }),
      floatingActionButton: WidgetButton(
          label: 'Add Data',
          pressFun: () {
            Get.to(const AddNewData());
          }),
    );
  }

  WidgetText deplayValue({required String head, required String value}) {
    return WidgetText(
      data: "$head = $value",
      textStyle: const TextStyle(color: Colors.black),
    );
  }
}
