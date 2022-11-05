import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hospital_auth/reusable_widget/resuable_widget.dart';
import 'package:hospital_auth/screens/first_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "HospitalApp",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        body: Column(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.fromLTRB(10, 200, 10, 0),
                child: listButton("Available beds", context)),
            const SizedBox(height: 20),
            Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: listButton("Available Vaccination slots", context)),
          ],
        ),
        drawer: Drawer(
            child: Column(
          children: [
            Container(
              height: 150,
              width: 150,
              margin: const EdgeInsets.fromLTRB(50, 50, 50, 0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.red,
                ),
                shape: BoxShape.circle,
              ),
              child: Image.asset("assets/images/usericon.jpeg"),
            ),
            const SizedBox(
              height: 10,
            ),
            Text("YOUR NAME",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            Container(
                width: MediaQuery.of(context).size.width,
                child: drawerButton(context))
          ],
        )));
  }
}
