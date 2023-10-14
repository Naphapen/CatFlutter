import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/types/gf_button_type.dart';
import 'package:ielproject/widgets/widget_button.dart';
import 'package:ielproject/widgets/widget_image_asset.dart';
import 'package:ielproject/widgets/widget_text.dart';

class AppDialog {
  void normalDialog({
    required String title,
    String? pathImage,
    Widget? contentWidget,
    Widget? actionWidget,
    Widget? secondActionWidget,
    double? sizeWidth,
  }) {
    Get.dialog(
      barrierDismissible: false,
      AlertDialog(
        scrollable: true,
        icon: WidgetImageAsset(
          pathImage: pathImage,
          sizeWidth: sizeWidth,
        ),
        title: WidgetText(data: title),
        content: contentWidget,
        actions: [
          actionWidget ?? const SizedBox(),
          secondActionWidget ??
              (actionWidget == null
                  ? WidgetButton(
                      label: 'OK',
                      gfButtonType: GFButtonType.transparent,
                      pressFun: () {
                        Get.back();
                      })
                  : WidgetButton(
                      label: 'Cancel',
                      gfButtonType: GFButtonType.outline,
                      color: Colors.orange.shade400,
                      pressFun: () {
                        Get.back();
                      },
                    )),
        ],
      ),
    );
  }
}
