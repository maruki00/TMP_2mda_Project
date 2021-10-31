import 'package:flutter/material.dart';
import 'package:sn/ui/compenent/navbar.dart';

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
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          "TMP project",
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic,
              fontFamily: "Billabong",
              color: Colors.black),
        )
      ],
    ));
  }
}
