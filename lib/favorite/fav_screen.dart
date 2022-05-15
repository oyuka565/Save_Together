import 'package:flutter/material.dart';
import 'package:together_app/utils/globals.dart';
import '../components/coustom_bottom_nav_bar.dart';
import '../enums.dart';
import 'components/body.dart';

class FavScreen extends StatelessWidget {
  
  static String routeName = "/favourite";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.favourite),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(

      title: Column(
        children: [
          Text(
            "Таалагдсан бүтээгдэхүүнүүд",
            style: TextStyle(
                color: Colors.deepOrange.withOpacity(0.6),
                fontStyle: FontStyle.italic,
                fontSize: 17
            ),
          ),
        ],
      ),
    );
  }
}
