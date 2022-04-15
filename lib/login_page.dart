import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';

class LoginPage extends StatefulWidget{
  const LoginPage ({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage>{

  bool isAPIcallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? userName;
  String? password;

  @override
  Widget build (BuildContext context){
    return SafeArea(
        child: Scaffold(
          backgroundColor: HexColor("#283B71"),
          body: ProgressHUD(
            child: Form(
              key: globalFormKey,
              child: _loginUI(context),
            ),
            inAsyncCall: isAPIcallProcess,
            opacity: 0.3,
            key: UniqueKey(),

          ),
        )
      );
  }

  Widget _loginUI(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white, Colors.white]),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100)
              )
            ),
          ),
           
            Padding (
              padding: const EdgeInsets.only(
                left: 20, bottom: 30, top: 50,
              ),
            child: Text("Login",
              style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.white,
            ),
            ),
            ),
          FormHelper.inputFieldWidget(context, "username", "User Name",
              (onValidateVal){
                if (onValidateVal.isEmpty) {
                  return "Usernme can\'t be empty.";
                }
              },
              (onSavedVal){
                userName = onSavedVal;
              },
              borderFocusColor: Colors.white,
            prefixIconColor: Colors.white,
              )
        ],
      ),
    );
  }
}