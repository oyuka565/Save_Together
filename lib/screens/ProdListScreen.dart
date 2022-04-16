//import 'package:TOMO/model/AdditionalService.dart';
//import 'package:TOMO/model/NewsList.dart';
//import 'package:TOMO/screens/NewsDetailScreen.dart';
//import 'package:TOMO/templates/OrderAppBar.dart' as orderAppBar;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:together_app/model/ProdResponse.dart';
import 'package:together_app/templates/popUp.dart';
import 'package:together_app/utils/Func.dart';
//import 'package:TOMO/utils/api.dart';
import 'package:together_app/utils/globals.dart' as globals;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
//import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../model/UserList.dart';
import '../utils/api.dart';
import 'ProdDetailScreen.dart';

//import 'NavigationMenu.dart';

class ProdListScreen extends StatefulWidget {
  @override
  _ProdListScreen createState() => _ProdListScreen();
}

class _ProdListScreen extends State<ProdListScreen> {
  final GlobalKey<ScaffoldState> mainDrawerKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    readProdData();
    super.initState();
  }

  late ProductListResponse prodList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: mainDrawerKey,
      //drawer: NavigationMenuState(),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SchedulerBinding.instance?.window.platformBrightness ==
                Brightness.dark
            ? SystemUiOverlayStyle.dark.copyWith(
                statusBarColor: Colors.transparent,
              )
            : SystemUiOverlayStyle.light.copyWith(
                statusBarColor: Colors.transparent,
              ),
        child: ModalProgressHUD(
          inAsyncCall: globals.showProgress,
          //opacity: 0.5,
          progressIndicator: CircularProgressIndicator(),
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //AppBar
                  //orderAppBar.draw(context, mainDrawerKey),
                  SizedBox(
                    height: 10,
                  ),
                  buildProdList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  buildProdList() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9 - 130,
      width: MediaQuery.of(context).size.width * 0.9,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
          itemCount: (prodList.list.length),
          itemBuilder: (BuildContext, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProdDetailScreen(
                              prodList.list[index].productID)),
                    );
                    //Navigator.of(context)
                    //    .push(_orderDetailsScreenRoute());
                  },
                  child: Text(prodList.list[index].prodcutTitle!,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 20,
                        color: globals.blueColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text( prodList.list[index].summary!,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 12,
                    color: globals.grayColor,
                  ),
                ),
                // actionLocation, actionActualDate
                SizedBox(
                  height: 15,
                ),

                Divider(),
              ],
            );
          }),
    );
  }

  readProdData() {
    try {
      setState(() {
        globals.showProgress = true;
      });

      APIService apiService = new APIService();
      apiService.prodList().then((value) {
        if (value != null) {

              try {
                setState(() {
                  prodList = value;
                });
              } catch (e) {
                print("user aldaa $e");
              }
            } else {
              serverErrorPopup(context, "Aldaa garlaa");
            }

      });
    } catch (e) {
      print(e.toString());
      serverErrorPopup(context, globals.msg_HTTP);
    } finally {
      setState(() {
        globals.showProgress = false;
      });
    }
  }
}
