import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ielproject/states/update_data.dart';
import 'package:ielproject/utility/app_controller.dart';
import 'package:ielproject/utility/app_dialog.dart';
import 'package:ielproject/utility/app_service.dart';
import 'package:ielproject/widgets/widget_button.dart';
import 'package:ielproject/widgets/widget_map.dart';
import 'package:ielproject/widgets/widget_process.dart';

class ShowMap extends StatefulWidget {
  const ShowMap({super.key});

  @override
  State<ShowMap> createState() => _ShowMapState();
}

class _ShowMapState extends State<ShowMap> {
  AppController appController = Get.put(AppController());
  Map<MarkerId, Marker> map = {};
  LatLng latLng1 = const LatLng(37.527286, -121.964371);
  var catsadIcon;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (GetPlatform.isAndroid) {
      BitmapDescriptor.fromAssetImage(
              const ImageConfiguration(
                size: Size(2, 2),
              ),
              'images/catsad.png')
          .then((v) {
        catsadIcon = v;
      });
    }
    if (GetPlatform.isIOS) {
      BitmapDescriptor.fromAssetImage(
              const ImageConfiguration(
                size: Size(48, 48),
              ),
              'images/catsad64.png')
          .then((v) {
        catsadIcon = v;
      });
    }

    AppService().processFindPosition().then((value) {
      print("position --> ${appController.position.last}");

      MarkerId markerId = const MarkerId('cat1');
      Marker marker = Marker(
        markerId: markerId,
        position: LatLng(
          appController.position.last.latitude,
          appController.position.last.longitude,
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(300),
        //  icon: catsadIcon,
        infoWindow: InfoWindow(
            title: "ฉันอยู่นี่",
            snippet: appController.position.last.toString(),
            onTap: () {
              AppDialog().normalDialog(
                title: 'นำทาง',
                actionWidget: WidgetButton(
                  label: 'นำทาง',
                  pressFun: () {},
                ),
              );
            }),
      );
      map[markerId] = marker;

      MarkerId markerIdCat2 = const MarkerId('cat2');
      Marker markerCat2 = Marker(
          markerId: markerIdCat2,
          position: latLng1,
          // icon: BitmapDescriptor.defaultMarkerWithHue(300),
          icon: catsadIcon,
          infoWindow: const InfoWindow(
              title: "แมวอยู่นี่2", snippet: "แมวที่หนีออกนอกบ้าน"),
          onTap: () {
            AppDialog().normalDialog(
              title: 'จะไปรับแมวใช่หรือไม่',
              actionWidget: WidgetButton(
                label: 'ไปรับ',
                pressFun: () {
                  Get.to(const UpdataData());
                },
              ),
            );
          });
      map[markerIdCat2] = markerCat2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return appController.position.isEmpty
          ? const WidgetProcess()
          : WitgetMap(
              map: map,
            );
    });
  }
}
