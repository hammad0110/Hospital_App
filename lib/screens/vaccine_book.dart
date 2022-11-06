import 'package:flutter/material.dart';
import 'package:hospital_auth/reusable_widget/resuable_widget.dart';
import 'package:hospital_auth/screens/home_scren.dart';

class VaccineBook extends StatefulWidget {
  const VaccineBook({super.key});

  @override
  State<VaccineBook> createState() => _VaccineBookState();
}

class _VaccineBookState extends State<VaccineBook> {
  final TextEditingController _patientName = TextEditingController();
  final TextEditingController _conatctNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        iconTheme: const IconThemeData(color: Colors.black),
        //elevation: 0,
        title: const Text(
          "Book your vaccination slot",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 500,
              child: Image.asset(
                "assets/images/vacc.png",
              )),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: reusableTextField("Name of patient",
                Icons.person_outline_rounded, false, _patientName),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: reusableTextField(
                "Mob of patient", Icons.phone_outlined, false, _patientName),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      backgroundColor: Colors.white,
                      context: context,
                      builder: (context) => Column(children: [
                            Image.asset(
                              "assets/images/greentick.png",
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomeScreen()));
                                },
                                child: Text("OKAY")),
                          ]));
                },
                child: const Text(
                  "CONFIRM",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.black12;
                    }
                    return Colors.blue[200];
                  }),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
                )),
          )
        ],
      ),
    );
  }
}
