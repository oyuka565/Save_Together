import 'package:flutter/material.dart';
import 'package:together_app/components/socal_card.dart';
import 'sign_up_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 40), // 4%
                Text("Бүртгэл үүсгэх", style: TextStyle(
                  fontSize: 28,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),),
                Text(
                  "Та мэдээллээ оруулна уу ",
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 60),
                SignUpForm(),
                SizedBox(height: 150),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     SocalCard(
                //       icon: "assets/icons/google-icon.svg",
                //       press: () {},
                //     ),
                //   ],
                // ),
                SizedBox(height: 20),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
