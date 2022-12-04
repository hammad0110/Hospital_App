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
        extendBody: true,
        appBar: AppBar(
          excludeHeaderSemantics: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: const Text(
            "MEDIZINE",
            style: TextStyle(
                fontFamily: 'Silkscreen', fontSize: 30, color: Colors.white),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 25, top: 10),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.chat,
                  color: Colors.blue,
                  size: 40,
                ),
              ),
            )
          ],
        ),
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 1000,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              hexStringToColor("416C71"),
              hexStringToColor("7e253e"),
              hexStringToColor("5c5398")
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: Column(
              children: [
                const SizedBox(
                  height: 150,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.25,
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
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  color: Colors.white,
                ),
                Container(
                    width: 290,
                    height: 100,
                    margin: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                    child: listButton(
                        "  Available beds", context, 1, Icons.bed_outlined)),
                Container(
                    width: 300,
                    height: 100,
                    margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: listButton(
                      "Available Vaccination slots",
                      context,
                      2,
                      Icons.water_drop_outlined,
                    )),
                Container(
                    width: 300,
                    height: 100,
                    margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: listButton(
                      "Doctor's appointment",
                      context,
                      3,
                      Icons.local_hospital,
                    )),
                Container(
                    width: 300,
                    height: 100,
                    margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: listButton(
                      "Contact Us",
                      context,
                      3,
                      Icons.phone,
                    )),
              ],
            ),
          ),
        ));
  }
}
