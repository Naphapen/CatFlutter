import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ielproject/bodys/list_data.dart';
import 'package:ielproject/bodys/show_map.dart';
import 'package:ielproject/utility/app_controller.dart';
import 'package:ielproject/utility/app_dialog.dart';
import 'package:ielproject/widgets/widget_button.dart';
import 'package:ielproject/widgets/widget_icon_button.dart';
import 'package:ielproject/widgets/widget_text.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  var bodys = <Widget>[
    const ListData(),
    const ShowMap(),
  ];
  var titles = <String>[
    'List Data',
    'Show Map',
  ];
  var icons = <IconData>[
    Icons.menu_open,
    Icons.map_outlined,
    //Icons.maps_home_work_outlined
  ];

  var items = <BottomNavigationBarItem>[];
  AppController appController = Get.put(AppController());

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < titles.length; i++) {
      BottomNavigationBarItem bottomNavigationBarItem = BottomNavigationBarItem(
        icon: Icon(icons[i]),
        label: titles[i],
      );
      items.add(bottomNavigationBarItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: mainAppber(),
        bottomNavigationBar: BottomNavigationBar(
          items: items,
          currentIndex: appController.indexBody.value,
          onTap: (value) {
            appController.indexBody.value = value;
          },
          unselectedItemColor: Colors.grey.shade400,
        ),
        body: bodys[appController.indexBody.value],
      );
    });
  }

  AppBar mainAppber() {
    return AppBar(
      actions: [
        WidgetIconButton(
          iconData: Icons.logout,
          pressFuns: () {
            AppDialog().normalDialog(
              title: 'Logout',
              pathImage: 'images/exit.png',
              sizeWidth: 150,
              contentWidget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  WidgetText(data: 'Please comfirm Logout'),
                ],
              ),
              actionWidget: WidgetButton(
                label: 'Logout',
                pressFun: () async {
                  GetStorage().remove('data').then((value) {
                    Get.offAllNamed('/authen');
                  });
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
