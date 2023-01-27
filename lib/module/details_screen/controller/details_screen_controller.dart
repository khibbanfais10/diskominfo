import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:diskominfo/state_util.dart';
import '../view/details_screen_view.dart';

class DetailsScreenController extends State<DetailsScreenView>
    implements MvcController {
  static late DetailsScreenController instance;
  late DetailsScreenView view;
  List<Map<String, dynamic>> postsList = [];

  int id = 1044510;
  @override
  void initState() {
    instance = this;
    super.initState();
    // loadPosts(id);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  loadPosts(id) async {
    Dio dio = Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) {
        return true;
      };
    };
    var response = await dio.get(
      "https://diskominfo.wonosobokab.go.id/api/news/$id",
      options: Options(
        receiveTimeout: 3000,
        sendTimeout: 3000,
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    Map obj = response.data;
    Map<String, dynamic> data = obj["data"];

    postsList.add(data);

    print(postsList);
    if (!mounted) return;
    setState(() {});
  }
}
