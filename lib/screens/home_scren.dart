import 'package:flutter/material.dart';
import 'package:hospital_auth/utils/color_utils.dart';
import 'package:hospital_auth/reusable_widget/resuable_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var imgList = {
    "assets/images/imagec3.png",
    "assets/images/himage2.png",
    "assets/images/himage3.png"
  };
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("416C71"),
          hexStringToColor("7e253e"),
          hexStringToColor("5c5398")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 300,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: CarouselSlider(
                items: imgList
                    .map((item) => Container(
                          child: Center(child: Image.asset(item)),
                        ))
                    .toList(),
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2,
                  enlargeCenterPage: true,
                ),
              ),
            ),
            Container(
                width: 300,
                height: 100,
                margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: listButton(
                    "Available beds", context, 1, Icons.bed_outlined)),
            Container(
                width: 300,
                height: 100,
                margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: listButton("Available Vaccination slots", context, 2,
                    Icons.water_drop_outlined)),
            Container(
                width: 300,
                height: 100,
                margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: listButton(
                  "Doctor's appointment",
                  context,
                  3,
                  Icons.local_hospital,
                )),
          ],
        ),
      ),
    );
  }
}
