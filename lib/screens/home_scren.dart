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
          backgroundColor: Colors.blue[200],
          elevation: 0,
          title: const Text(
            "Hospital App",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        body: Column(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.fromLTRB(10, 200, 10, 0),
                child: listButton(
                    "Available beds", context, 1, Icons.bed_outlined)),
            Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: listButton("Available Vaccination slots", context, 2,
                    Icons.water_drop_outlined)),
            Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: listButton(
                  "Doctor's appointment",
                  context,
                  3,
                  Icons.local_hospital,
                )),
          ],
        ),
        drawer: Drawer(
            backgroundColor: Colors.blue[100],
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
                  child: Image.asset("assets/images/usericon.png"),
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
                    width: 200,
                    height: 95,
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: drawerButton(context)),
                Container(
                    width: 200,
                    height: 50,
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: ElevatedButton(
                        child: Text("EMERGENCY !!"),
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith((states) {
                              if (states.contains(MaterialState.pressed)) {
                                return Colors.black12;
                              }
                              return Colors.red[400];
                            }),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(40)))))),
                Container(
                    width: 200,
                    height: 50,
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: ElevatedButton(
                        child: Text("LOG OUT"),
                        onPressed: () {
                          FirebaseAuth.instance.signOut().then((value) {
                            print("SIGNOUT");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const first_page()));
                          });
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith((states) {
                              if (states.contains(MaterialState.pressed)) {
                                return Colors.black12;
                              }
                              return Colors.blue[200];
                            }),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(30)))))),
              ],
            )));
  }
}
