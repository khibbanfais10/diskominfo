import 'package:diskominfo/core.dart';
import 'package:diskominfo/shared/global.dart';

import 'package:flutter/material.dart';

class Horizontal_Slider extends StatelessWidget {
  final String judul;
  String path;
  String banner_name;
  int id;

  // final AppBanner? appBanner;
  final int index;

  Horizontal_Slider({
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
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Image.network(
                  base_url + path + banner_name,
                  fit: BoxFit.cover,
                ).image,
              ),
              color: Colors.black,
              borderRadius: BorderRadius.all(
                Radius.circular(12.0),
              ),
            ),
            height: 240,
            width: 321,
          ),
          Positioned(
            bottom: 10,
            child: Container(
              height: 80,
              width: 300,
              child: Text(
                judul,
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
