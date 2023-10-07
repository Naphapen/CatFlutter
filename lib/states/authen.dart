import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/types/gf_button_type.dart';
import 'package:ielproject/utility/app_constant.dart';
import 'package:ielproject/utility/app_controller.dart';
import 'package:ielproject/widgets/widget_button.dart';
import 'package:ielproject/widgets/widget_form.dart';
import 'package:ielproject/widgets/widget_icon_button.dart';
import 'package:ielproject/widgets/widget_image_asset.dart';
import 'package:ielproject/widgets/widget_text.dart';

class Authen extends StatefulWidget {
  const Authen({super.key});

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  AppController appController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppConstant.bgColor,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Container(
          decoration: AppConstant().linearBox(),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 250,
                    child: Column(
                      children: [
                        const SizedBox(height: 100),
                        displayLogoAppName(),
                        const SizedBox(height: 20),
                        const WidgetForm(
                          hint: "User",
                          suffixIcon: Icon(Icons.person),
                        ),
                        const SizedBox(height: 5),
                        passWordWidget(),
                        SizedBox(
                            width: 250,
                            child: WidgetButton(
                                label: "Login",
                                pressFun: () {},
                                gfButtonShape: GFButtonShape.pills,
                                gfButtonType: GFButtonType.solid,
                                color: Colors.deepOrange.shade300))
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Obx passWordWidget() {
    return Obx(() {
      return WidgetForm(
        hint: "Password",
        obscureText: appController.redEye.value,
        suffixIcon: WidgetIconButton(
          iconData: appController.redEye.value
              ? Icons.remove_red_eye_outlined
              : Icons.remove_red_eye,
          pressFuns: () {
            appController.redEye.value = !appController.redEye.value;
          },
        ),
      );
    });
  }

  Row displayLogoAppName() {
    return Row(
      children: [
        const WidgetImageAsset(sizeWidth: 64),
        WidgetText(
          data: AppConstant.appName,
          textStyle: AppConstant().h1Style(fontSize: 30),
        ),
      ],
    );
  }
}
