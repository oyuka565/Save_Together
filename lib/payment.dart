
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:together_app/utils/globals.dart'as globals;
import 'package:flutter/material.dart';
import 'package:together_app/utils/globals.dart';
import 'components/coustom_bottom_nav_bar.dart';
import 'components/custom_surfix_icon.dart';
import 'components/default_button.dart';
import 'enums.dart';

class Payment extends StatefulWidget {
   static String routeName = "/payment";


  @override
  _PaymentState createState() => _PaymentState();
}
enum SingingCharacter { Khanbank, Storepay, Khasbank, TDB, Bogd, Monpay, Simple, Socialpay, pocket, mongolchat, toki   }
class _PaymentState extends State<Payment> {
  int value = 0;
  SingingCharacter? _character = SingingCharacter.Khanbank;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SchedulerBinding.instance?.window.platformBrightness ==
        Brightness.dark
        ? SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
    )
        : SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.transparent,
    ),

      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          backButton(),
           HeaderLabel(
              headerTextT:'Төлбөр төлөх хэлбэрээ сонгоно уу',
          ),
           
          Expanded(
            child:SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              //itemCount: paymentLabels.length,
                children: <Widget>[
                ListTile(
                  title: const Text('Khanbank'),
                  leading: Radio<SingingCharacter>(
                    value: SingingCharacter.Khanbank,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                     trailing:
                     Image.asset(
                        "assets/images/khanbankpng.png",
                        width: 30,
                        height: 30,
                     )
                ),
                ListTile(
                  title: const Text('Socialpay'),
                  leading: Radio<SingingCharacter>(
                    value: SingingCharacter.Socialpay,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                  trailing: Image.asset(
                    "assets/images/socialpay.png",
                    width: 30,
                    height: 30,
                  )
                ),
                  ListTile(
                      title: const Text('Khasbank'),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.Khasbank,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                      trailing: Image.asset(
                        "assets/images/khasbank.png",
                        width: 30,
                        height: 30,
                      )
                  ),
                  ListTile(
                      title: const Text('TDB'),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.TDB,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                      trailing: Image.asset(
                        "assets/images/tdb.png",
                        width: 30,
                        height: 30,
                      )
                  ),
                  ListTile(
                      title: const Text('Bogd'),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.Bogd,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                      trailing: Image.asset(
                        "assets/images/bogd.png",
                        width: 30,
                        height: 30,
                      )
                  ),
                  ListTile(
                      title: const Text('Simple'),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.Simple,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                      trailing: Image.asset(
                        "assets/images/simple.png",
                        width: 30,
                        height: 30,
                      )
                  ),
                  ListTile(
                      title: const Text('Pocket'),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.pocket,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                      trailing: Image.asset(
                        "assets/images/pocket.png",
                        width: 30,
                        height: 30,
                      )
                  ),
                  ListTile(
                      title: const Text('Mongolchat'),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.mongolchat,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                      trailing: Image.asset(
                        "assets/images/mongolchat.png",
                        width: 30,
                        height: 30,
                      )
                  ),
                  ListTile(
                      title: const Text('Toki'),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.toki,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                      trailing: Image.asset(
                        "assets/images/toki.png",
                        width: 30,
                        height: 30,
                      )
                  ),
                  ListTile(
                      title: const Text('Monpay'),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.Monpay,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                      trailing: Image.asset(
                        "assets/images/monpay1.png",
                        width: 30,
                        height: 30,
                      )
                  ),
                  ListTile(
                      title: const Text('Storepay'),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.Storepay,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                      trailing: Image.asset(
                        "assets/images/storepay.png",
                        width: 30,
                        height: 30,
                      )
                  ),
               ]
            )
          ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                height: 40,
                child: DefaultButton(
                  text: "Төлөх",
                  press: () {},
                ),
              ),
            ],
          ),
        ],
      ),
      ),

      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.payment),
    );

  }

  Widget backButton() {
    return Container(
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Container(
            padding: const EdgeInsets.fromLTRB(10, 20, 20, 20),
            child: Row(
              children: [
                SizedBox(
                  width: 5,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(Icons.arrow_back),
                ),
              ],
            )),
      ),
    );
  }
}

class HeaderLabel extends StatelessWidget {
  final String headerTextT;
  const HeaderLabel({
        required this.headerTextT,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Text(
        headerTextT,
        style: TextStyle(color: globals.grayColor, fontSize: 28.0),
      ),
    );
  }
}
