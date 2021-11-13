import 'package:flutter/material.dart';
import '../../ui/compenent/navbar.dart';
import '../../ui/sign/in.dart';

class Navbarui extends StatefulWidget {
  const Navbarui({Key? key}) : super(key: key);

  @override
  _NavbaruiState createState() => _NavbaruiState();
}

class _NavbaruiState extends State<Navbarui> {
  @override
  Widget build(BuildContext context) {
    return Navbarcompenent(
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "TMP project",
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic,
              fontFamily: "Billabong",
              color: Colors.black),
        ),
        IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Center())); //Loginpage()));
            },
            icon: Icon(Icons.logout))
      ],
    ));
  }
}
