import 'package:diskominfo/core.dart';
import 'package:diskominfo/shared/global.dart';

import 'package:flutter/material.dart';

class Vertical_Slider extends StatelessWidget {
  final String judul;
  String path;
  String banner_name;
  int id;

  // final AppBanner? appBanner;
  final int index;

  Vertical_Slider({
    Key? key,
    // this.appBanner,
    required this.judul,
    required this.index,
    required this.path,
    required this.id,
    required this.banner_name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsScreenView(
                      url: path,
                      judul: judul[index],
                      id: id,
                      banner_name: banner_name,
                    )));
      },
      child: ListTile(
        leading: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                base_url + path + banner_name,
              ),
            ))),
        title: Text(judul),
      ),
    );
  }
}
