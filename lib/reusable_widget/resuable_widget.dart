import 'package:flutter/material.dart';
import 'package:hospital_auth/screens/bed_book.dart';
import 'package:hospital_auth/screens/doctor_book.dart';
import 'package:hospital_auth/screens/vaccine_book.dart';

Image logoWidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 240,
    height: 240,
    color: Colors.white60,
  );
}

Container drawerButton(BuildContext context) {
  return Container(
      width: MediaQuery.of(context).size.width,
      height: 80,
      margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
      child: ElevatedButton(
          child: Text("MY BOOKINGS"),
          onPressed: () {},
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.black12;
                }
                return Colors.transparent;
              }),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30))))));
}

TextField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.black,
    style: TextStyle(color: Colors.black.withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.black12,
      ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.black.withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.3),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
    ),
    //keyboardType: isPasswordType
    //    ? TextInputType.visiblePassword        this has been commented by kapish
    //    : TextInputType.emailAddress,
  );
}

Container listButton(
    String buttonText, BuildContext context, int page, IconData iconData) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 160,
    child: ElevatedButton.icon(
      icon: Icon(iconData, size: 70),
      label: Text(buttonText),
      onPressed: () {
        if (page == 1) {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const BedBook())));
        } else if (page == 2) {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const VaccineBook())));
        } else if (page == 3) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const DoctorBook()));
        }
      },
      style: ButtonStyle(
          //want to making elevation of the button as zero
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black26;
            }
            return Colors.blue[200];
          }),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
    ),
  );
}

Container signInSignUpButton(
    BuildContext context, bool isLogin, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    //decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        isLogin ? 'LOG IN' : 'SIGN UP',
        style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black26;
            }
            return Colors.white;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
    ),
  );
}
