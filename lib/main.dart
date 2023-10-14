import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ielproject/states/authen.dart';
import 'package:ielproject/states/main_home.dart';
import 'package:ielproject/utility/app_service.dart';

var getPages = <GetPage<dynamic>>[
  GetPage(name: '/authen', page: () => const Authen()),
  GetPage(name: '/mainHome', page: () => const MainHome()),
];

String? firstPage;

Future<void> main() async {
  HttpOverrides.global = MyHttpOverride();
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init().then((value) async {
    var data = await GetStorage().read("data");
   // print("----------$data");

    if (data == null) {
      firstPage = '/authen';
      runApp(const MyApp());
    } else {
      firstPage = '/mainHome';
      await AppService().findTokenModel(
          uers: '${data['user']}', password: '${data['password']}');

      runApp(const MyApp());
    }
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: getPages,
      initialRoute: firstPage,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.orange,
            foregroundColor: Colors.black,
            elevation: 0),
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}

class MyHttpOverride extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (cert, host, port) => true;
  }
}
