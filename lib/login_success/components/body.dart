import 'package:flutter/material.dart';
import 'package:together_app/components/default_button.dart';
import 'package:together_app/home/home_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Image.asset(
          "assets/images/success.png",
          height: 40, //40%
        ),
        SizedBox(height: 10),
        Text(
          "Амжилттай нэвтэрлээ",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Spacer(),
        SizedBox(
          width: 10,
          child: DefaultButton(
            text: "Нүүр хуудасруу буцах",
            press: () {
              Navigator.pushNamed(context, HomeScreen.routeName);
            },
          ),
        ),
        Spacer(),
      ],
    );
  }
}
