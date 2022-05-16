
import 'dart:io';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:together_app/templates/popUp.dart';
import 'package:together_app/utils/Func.dart';
import 'package:together_app/utils/globals.dart' as globals;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import '../components/coustom_bottom_nav_bar.dart';
import '../enums.dart';
import '../model/OrderModel.dart';
import '../utils/api.dart';
import 'ProdDetailScreen.dart';


class OrderScreen extends StatefulWidget {
  @override
  _OrderScreen createState() => _OrderScreen();
}

class _OrderScreen extends State<OrderScreen> {
  final GlobalKey<ScaffoldState> mainDrawerKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    readOrderData();
    super.initState();
  }

  OrderListResponse orderList = new OrderListResponse(list: []);

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
                  backButton(),
                  Text(
                    "Таны захиалга",
                    style: TextStyle(color: Colors.black),
                  ),
                  buildOrderList(),
                 // insertOrderButton(),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
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

  buildOrderList() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9 - 80,
      width: MediaQuery.of(context).size.width * 0.9,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: ListView.builder(
          itemCount: (orderList.list.length),
          itemBuilder: (BuildContext, index) {
            return Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ProdDetailScreen(orderList.list[index].productID)),
                      );
                      //Navigator.of(context)
                      //    .push(_orderDetailsScreenRoute());
                    },

                    child: Image.file(
                      File(
                      orderList.list[index].imageUrl!),
                      width: 85,
                      height: 85,
                      fit: BoxFit.cover,
                    )
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "№" + Func.toStr(orderList.list[index].orderPersonID!) +" - " +orderList.list[index].productTitle!,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 12,
                    color: globals.blackColor,
                  ),
                ),
                SizedBox(
                width: 230.0,
                child:
                Text(
                  orderList.list[index].summary!,
                  textAlign: TextAlign.left,
                  overflow:TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 10,
                    color: globals.grayColor,
                  ),
                ),
                ),
                // actionLocation, actionActualDate
                SizedBox(
                  height: 15,
                ),
                Text(
                  Func.toStr(orderList.list[index].quantity!) + "ш - " +
                      Func.toStr(orderList.list[index].grandTotal!) + " (Хэмнэлт:" + Func.toStr(orderList.list[index].discount!) + "₮)",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 14,
                    color: globals.redColor,
                  ),
                ),
                Text(orderList.list[index].statusName! + ". Одоо "+
                  Func.toStr(orderList.list[index].groupQty!) +"-с " +
                  Func.toStr(orderList.list[index].currentOrderQty!) +" захиалагдсан",
                       textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 10,
                    color: globals.greenColor,
                  ),
                ),
                Divider(),
              ],

            ),
                ]);
          }),
    );
  }
  readOrderData() {
    try {
      setState(() {
        globals.showProgress = true;
      });

      APIService apiService = new APIService();
      apiService.getUserOrder().then((value) {
        if (value != null) {
          try {
            setState(() {
              orderList = value;
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

  Widget insertOrderButton() {
    return Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15),
          width: MediaQuery.of(context).size.width * 0.6,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(globals.yellowColor),
              padding: MaterialStateProperty.all(EdgeInsets.all(5)),
            ),
            child: Text(
              'Захиалга',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: globals.whiteColor,
              ),
            ),
            onPressed: () {
                APIService apiService = new APIService();
                OrderModel order = new OrderModel();

                if (orderList.list.length > 0)
                  order =orderList.list[0];
                else
                  return ;

                try {
                  setState(() {
                    globals.showProgress = true;
                  });
                  apiService
                      .createOrder(order )
                      .then((value) {
                    if (value != null) {
                      if (value) {
                        informationPopup(context, "Захиалга", "Амжилттай захиалав.");
                      } else {
                        serverErrorPopup(context, globals.msg_HTTP);
                      }
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
                ;
            },
          ),
        ));
  }

}
