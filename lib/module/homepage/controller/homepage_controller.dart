import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:diskominfo/module/homepage/widget/indicator.dart';
import 'package:flutter/material.dart';
import 'package:diskominfo/state_util.dart';
import '../view/homepage_view.dart';

class HomepageController extends State<HomepageView> implements MvcController {
  static late HomepageController instance;
  late HomepageView view;

  @override
  void initState() {
    instance = this;
    super.initState();
    // loadNews();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  var selected_index = 0;
  List<dynamic> postsList = [];
  List<dynamic> photosList = [];

  loadNews() async {
    Dio dio = Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) {
        return true;
      };
    };
    var response = await dio.get(
      "https://diskominfo.wonosobokab.go.id/api/news",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    Map obj = response.data;
    Map data = obj['data'];
    postsList = data['data'];
    print(postsList);
    if (!mounted) return;
    setState(() {});
  }

  controlIndicator(index) {
    setState(() {
      selected_index = index;
    });
  }
}
