import 'package:diskominfo/models/appbanner.dart';
import 'package:diskominfo/module/homepage/widget/horizontal_slider.dart';
import 'package:diskominfo/module/homepage/widget/vertical_slider.dart';
import 'package:flutter/material.dart';
import 'package:diskominfo/core.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/homepage_controller.dart';
import '../widget/indicator.dart';

class HomepageView extends StatefulWidget {
  const HomepageView({Key? key}) : super(key: key);

  Widget build(context, HomepageController controller) {
    controller.view = this;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: Image.asset(
            "lib/images/logo.png",
            width: 200.0,
            height: 70.0,
            fit: BoxFit.fill,
          ),
        ),
        actions: [],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Berita Terbaru",
                style: GoogleFonts.libreBaskerville(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5.0,
              ),
              SizedBox(
                height: 240,
                child: PageView.builder(
                  onPageChanged: (index) {
                    controller.controlIndicator(
                      index,
                    );
                  },
                  controller: PageController(viewportFraction: 0.8),
                  itemCount: controller.postsList.length,
                  itemBuilder: (context, index) {
                    // var banner = appBannerList[index];
                    var _scale = controller.selected_index == index ? 1.0 : 0.8;
                    var item = controller.postsList[index];
                    return TweenAnimationBuilder(
                      duration: const Duration(milliseconds: 350),
                      tween: Tween<double>(begin: _scale, end: _scale),
                      curve: Curves.ease,
                      child: Horizontal_Slider(
                          // appBanner: banner,
                          judul: item["judul_posting"],
                          id: item["id_posting"],
                          path: item["gambar_muka"]["path"],
                          banner_name: item["gambar_muka"]["file_name"],
                          index: index),
                      builder: (context, double value, child) {
                        return Transform.scale(
                          scale: value,
                          child: child,
                        );
                      },
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    controller.postsList.length,
                    (index) => Indicator(
                        isActive:
                            controller.selected_index == index ? true : false),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ListView.builder(
                itemCount: controller.postsList.length,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  var item = controller.postsList[index];
                  return Card(
                      child: Vertical_Slider(
                          judul: item["judul_posting"],
                          index: index,
                          path: item["gambar_muka"]["path"],
                          id: item["id_posting"],
                          banner_name: item["gambar_muka"]["file_name"]));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<HomepageView> createState() => HomepageController();
}
