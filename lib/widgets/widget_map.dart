// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:ielproject/utility/app_controller.dart';

class WitgetMap extends StatefulWidget {
  WitgetMap({
    Key? key,
    required this.map,
  }) : super(key: key);
  final Map<MarkerId, Marker> map;

  @override
  State<WitgetMap> createState() => _WitgetMapState();
}

class _WitgetMapState extends State<WitgetMap> {
  @override
  Widget build(BuildContext context) {
    AppController appController = Get.put(AppController());
    return GoogleMap(
      initialCameraPosition: CameraPosition(
          target: LatLng(
            appController.position.last.latitude,
            appController.position.last.longitude,
          ),
          zoom: 18),
      markers: Set<Marker>.of(widget.map.values),
    );
  }
}
