import 'package:flutter/material.dart';
import 'package:together_app/components/coustom_bottom_nav_bar.dart';
import 'package:together_app/enums.dart';
import 'package:together_app/utils/globals.dart';

import '../screens/ProdDetailScreen.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add, color: Colors.black),
          backgroundColor: yellowColor,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProdDetailScreen(0)),
            );
          }
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
