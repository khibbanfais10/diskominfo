import 'package:diskominfo/shared/global.dart';
import 'package:flutter/material.dart';
import 'package:diskominfo/core.dart';
import 'package:flutter_html/flutter_html.dart';
import '../controller/details_screen_controller.dart';
// import 'package:flutter_html/flutter_html.dart';

class DetailsScreenView extends StatefulWidget {
  final String url;
  final String judul;
  final int id;
  final String banner_name;
  const DetailsScreenView(
      {Key? key,
      required this.url,
      required this.judul,
      required this.id,
      required this.banner_name})
      : super(key: key);

  Widget build(context, DetailsScreenController controller) {
    controller.view = this;
    controller.loadPosts(id);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: ListView.builder(
            itemCount: controller.postsList.length,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              var item = controller.postsList[index];
              return Column(
                children: [
                  Container(
                    height: 400,
                    child: Stack(
                      children: [
                        ElevatedButton.icon(
                          icon: const Icon(Icons.add),
                          label: const Text("Add"),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueGrey,
                          ),
                          onPressed: () => controller.loadPosts(id),
                        ),
                        Container(
                          height: 400,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.network(
                                          base_url + url + banner_name)
                                      .image)),
                        ),
                        Positioned(
                            top: 280,
                            left: 35,
                            child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(30)),
                              height: 141,
                              width: 311,
                              child: Center(
                                child: Text(
                                  item["judul_posting"],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: Html(data: item["isi_posting"]),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  State<DetailsScreenView> createState() => DetailsScreenController();
}
