import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class bookings extends StatefulWidget {
  const bookings({super.key});

  @override
  State<bookings> createState() => _bookingsState();
}

class _bookingsState extends State<bookings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BOOKINGS"),
        elevation: 0,
        backgroundColor: Colors.blue[200],
      ),
    );
  }
}
