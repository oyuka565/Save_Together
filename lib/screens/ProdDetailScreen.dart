//import 'package:together_app/templates/OrderAppBar.dart' as orderAppBar;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:together_app/model/ProdResponse.dart';
import 'package:together_app/model/UserList.dart';
import 'package:together_app/templates/popUp.dart';
import 'package:together_app/utils/Func.dart';
//import 'package:together_app/utils/api.dart';
import 'package:together_app/utils/globals.dart' as globals;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
//import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../utils/api.dart';

//import 'NavigationMenu.dart';

class ProdDetailScreen extends StatefulWidget {
  final int? _prodId;

  ProdDetailScreen(this._prodId);

  @override
  _ProdDetailScreen createState() => _ProdDetailScreen();
}

class _ProdDetailScreen extends State<ProdDetailScreen> {
  final GlobalKey<ScaffoldState> mainDrawerKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    readData();
    setState(() {});
  }

  ProductListResponse prodInfo = new ProductListResponse(list: []);

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
          // _showSpinner,
          opacity: 0.5,
          progressIndicator: CircularProgressIndicator(),
          child: Column(children: [
            //AppBar
            //orderAppBar.draw(context, mainDrawerKey),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height - 100,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    //back bt
                    backButton(),
                    /* Container(
                      //width: MediaQuery.of(context).size.width * 0.9,
                      height: 160,
                      */ /*decoration: BoxDecoration(
                        image: new DecorationImage(
                            image: NetworkImage((newsInfo != null
                                ? newsInfo.d.objects[0][0].newsPicUrl
                                : "https://cdn.browshot.com/static/images/not-found.png")),
                            fit: BoxFit.fitHeight),*/ /*

                      child: Image.network(
                        newsInfo != null
                            ? newsInfo.d.objects[0][0].newsPicUrl
                            : "https://cdn.browshot.com/static/images/not-found.png",
                        fit: BoxFit.fitWidth,
                      ),
                    ),*/

                    Text(
                      prodInfo.list.isNotEmpty
                          ? Func.toStr(prodInfo.list[0].productID!)
                          : "",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                        color: globals.blueColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      prodInfo.list.isNotEmpty
                          ? Func.toStr(prodInfo.list[0].summary!)
                          : "",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                        color: globals.darkGrayColor,
                      ),
                    ),
                    // actionLocation, actionActualDate

                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      prodInfo.list.isNotEmpty
                          ? Func.toStr(prodInfo.list[0].discount!)
                          : "",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 20,
                          color: globals.blackColor,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
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
               /* new Image.asset(
                  globals.png_back_btn,
                  width: 8,
                  height: 7,
                ),*/
                SizedBox(
                  width: 5,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Буцах',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: globals.blueColor,
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  readData() {
    try {
      setState(() {
        globals.showProgress = true;
      });

      APIService apiService = new APIService();
      apiService.prodList(widget._prodId!).then((value) {
        if (value != null) {
          try {
            setState(() {
              prodInfo = value;
            });
          } catch (e) {
            print("OrderItemDetail aldaa $e");
          }
        } else {
          serverErrorPopup(context, "empty value");
        }
      } );
    } catch (e) {
      print(e.toString());
      serverErrorPopup(context, globals.msg_HTTP);
    } finally {
      setState(() {
        globals.showProgress = false;
      });
    }
    ;
  }
}
