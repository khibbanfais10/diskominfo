import 'dart:io';

import 'package:dio/dio.dart';
import 'package:diskominfo/module/homepage/view/homepage_view.dart';
import 'package:diskominfo/state_util.dart';
import 'package:flutter/material.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Get.navigatorKey,
      home: HomepageView(),
    );
  }
}

// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           ((X509Certificate cert, String host, int port) {
//         final isValidHost = ["https://diskominfo.wonosobokab.go.id/api/news"]
//             .contains(host); // <-- allow only hosts in array
//         return isValidHost;
//       });
//   }
// }
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

// void getHttp() async {
//   Dio dio = new Dio();
//   Response response;
//   response = await dio.get("https://diskominfo.wonosobokab.go.id/api/news");
//   print(response.data);
// }
