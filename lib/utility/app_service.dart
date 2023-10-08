import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ielproject/models/token_mode.dart';
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

        await GetStorage().write('data', data);
      }
      AppSnackBar(title: 'Login success', message: "${tokenModel.employeeNo}")
          .normalSnackbar();

      Get.offAll(const MainHome());
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
        'Bearer ${appController.tokenModels.last.accessToken}';
    await dio.post(url, data: map);
  }
}
