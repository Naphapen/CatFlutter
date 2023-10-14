import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ielproject/main.dart';
import 'package:ielproject/models/data_model.dart';
import 'package:ielproject/models/token_mode.dart';
import 'package:ielproject/states/authen.dart';
import 'package:ielproject/states/main_home.dart';
import 'package:ielproject/utility/app_controller.dart';
import 'package:ielproject/utility/app_snackbar.dart';

class AppService {
  AppController appController = Get.put(AppController());

  Future<void> checkAuthen(
      {required String uers, required String password}) async {
    String urlApi =
        'https://dev-api-ismart.interexpress.co.th/User/login/employee';
    Map<String, dynamic> map = {};

    map['UserName'] = uers;
    map['Password'] = password;
    map['ApplicationId'] = 6;

    Dio dio = Dio();

    dio.options.headers['Content-Type'] = 'application/json';
    try {
      var response = await dio.post(urlApi, data: map);

      TokenModel tokenModel = TokenModel.fromMap(response.data['token']);

      appController.tokenModels.add(tokenModel);

      if (appController.rememberMe.value) {
        Map<String, dynamic> data = {};
        data['uers'] = uers;
        data['password'] = password;

        await GetStorage().write('data', data).then((value) {
          Get.offAll(const MainHome());
        });
      } else {
        Get.offAll(const Authen());
      }
      AppSnackBar(title: 'Login success', message: "${tokenModel.employeeNo}")
          .normalSnackbar();
    } on Exception catch (e) {
      AppSnackBar(message: 'เกิดข้อผิดพลาด', title: 'Error').errorSnackbar();
    }
  }

  Future<void> findTokenModel(
      {required String uers, required String password}) async {
    String urlApi =
        'https://dev-api-ismart.interexpress.co.th/User/login/employee';
    Map<String, dynamic> map = {};

    map['UserName'] = uers;
    map['Password'] = password;
    map['ApplicationId'] = 6;

    Dio dio = Dio();

    dio.options.headers['Content-Type'] = 'application/json';
    try {
      var response = await dio.post(urlApi, data: map);

      TokenModel tokenModel = TokenModel.fromMap(response.data['token']);

      appController.tokenModels.add(tokenModel);

      Get.offAll(const MainHome());
    } on Exception catch (e) {
      // AppSnackBar(message: 'เกิดข้อผิดพลาด', title: 'Error').errorSnackbar();
    }
  }

  Future<void> insertNewData({required Map<String, dynamic> map}) async {
    String url = 'https://dev-api-ismart.interexpress.co.th/Test/insert-data';
    Dio dio = Dio();
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['Authorization'] =
        "Bearer ${appController.tokenModels.last.accessToken}";

    try {
      var res = await dio.post(url, data: map);

      AppSnackBar(title: 'Success', message: "Save").normalSnackbar();
    } catch (e) {
      AppSnackBar(title: 'Error', message: "Save Error").normalSnackbar();
    }
  }

  //https://dev-api-ismart.interexpress.co.th/Test/list-all
  Future<void> processReadAllData() async {
    String url = 'https://dev-api-ismart.interexpress.co.th/Test/list-all';
    Dio dio = Dio();

    if (appController.tokenModels.isEmpty) {
      var data = await GetStorage().read('data');
      await findTokenModel(uers: data['uers'], password: data['password']);
    }

    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['Authorization'] =
        "Bearer ${appController.tokenModels.last.accessToken}";

    try {
      await dio.get(url).then((value) {
        var result = value.data;
        for (var element in result) {
          DataModel dataModel = DataModel.fromMap(element);
          appController.dataModels.add(dataModel);
          print(appController.dataModels);
        }
      });

      //  print("--> $res");
    } catch (e) {
      // print(e);
      AppSnackBar(title: 'Error', message: "Get Data Error Pls Login ")
          .errorSnackbar();
      GetStorage().remove('data');
      Get.offAllNamed('/authen');
    }
  }

  Future<void> updateData({required Map<String, dynamic> map}) async {
    String url = 'https://dev-api-ismart.interexpress.co.th/Test/update-data';
    Dio dio = Dio();
  }
}
