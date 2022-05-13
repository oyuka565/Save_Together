import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:together_app/cart/cart_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'icon_btn_with_counter.dart';
import 'package:together_app/utils/globals.dart';

class HamtdaaBar extends StatelessWidget {


  const HamtdaaBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

  return Container(
    color: whiteColor,
    // padding:EdgeInsets.all(19.0),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [

      Container(),
     Image.asset(
        "assets/images/logoo.png",
        width: 150,
        height: 70,
        fit: BoxFit.contain,
         alignment: FractionalOffset.center
        // fit: BoxFit.scaleDown,
      ),
        IconBtnWithCounter(
          svgSrc: "assets/icons/Cart Icon.svg",
          press: ()  => Navigator.pushNamed(context, CartScreen.routeName),
        ),
    ],
    ),
    );
  }
}


//         appBar: AppBar(
//           title: Text("Flutter AppBar Example"),
//           actions: [
//             IconButton(
//               icon: Icon(Icons.search),
//               onPressed: () {
//               },
//             ),
//             IconButton(
//               icon: Icon(Icons.more_vert,),
//               onPressed: () {
//               },
//             )
//           ],
//           actionsIconTheme: IconThemeData(size: 32,),
// ),


