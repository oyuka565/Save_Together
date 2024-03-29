import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:together_app/profile/profile_screen.dart';
import 'package:together_app/home/home_screen.dart';
import 'package:together_app/utils/globals.dart';

import '../cart/cart_screen.dart';
import '../enums.dart';
import '../favorite/fav_screen.dart';
import '../payment.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/home.svg",
                  color: MenuState.home == selectedMenu
                      ? yellowColor
                      : inActiveIconColor,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, HomeScreen.routeName),
              ),
              IconButton(
                icon: SvgPicture.asset("assets/icons/heart.svg",
                  color: MenuState.favourite == selectedMenu
                ? yellowColor
                    : inActiveIconColor,),
                onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (context) => new FavScreen(),
                      ),
                    );
                },
              ),
              SizedBox(width: 10),
              IconButton(
                  icon: SvgPicture.asset("assets/icons/tulbur.svg",
                    color: MenuState.payment == selectedMenu
                      ? yellowColor
                      : inActiveIconColor,),
                  onPressed: () =>
                      {
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (context) => new Payment(),
                          ),
                        )
                      }),
              IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/user.svg",
                    color: MenuState.profile == selectedMenu
                        ? yellowColor
                        : inActiveIconColor,
                  ),
                  onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileScreen()),
                      )),
            ],
          )),
    );
  }
}
