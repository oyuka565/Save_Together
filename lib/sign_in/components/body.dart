import 'package:flutter/material.dart';
import 'package:together_app/components/no_account_text.dart';
import '../../../size_config.dart';
import 'sign_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:together_app/utils/globals.dart' as globals;

class Body extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  var currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.topCenter,
            fit: BoxFit.fill,
            image: AssetImage("assets/images/egch.png"),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 510,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              ),
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: SizeConfig.screenHeight * 0.08),
                        SignForm(),
                        SizedBox(height: SizeConfig.screenHeight * 0.08),
                        SizedBox(height: getProportionateScreenHeight(20)),
                        NoAccountText(),
                      ],
                    ),
                  ),
                ),
              ),

            ),
          ],
        ),
      ),


    );
  }
  }

