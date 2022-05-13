import 'package:flutter/material.dart';
import 'package:together_app/components/default_button.dart';
import 'package:together_app/size_config.dart';
import '../../sign_in/sign_in_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Image.asset(
          "assets/images/success.png",
          height: SizeConfig.screenHeight * 0.4, //40%
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        Text(
          "Бүртгэл амжилттай",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: "Үргэлжлүүлэх",
            press: () {
              Navigator.pushNamed(context, SignInScreen.routeName);
            },
          ),
        ),
        Spacer(),
      ],
    );
  }
}
