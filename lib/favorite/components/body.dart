import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../size_config.dart';
import '../../model/FavoriteModel.dart';
import '../../templates/popUp.dart';
import '../../utils/api.dart';
import 'fav.dart';


class Body extends StatefulWidget {

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GlobalKey<ScaffoldState> mainDrawerKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    readFavoriteList();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ListView.builder(
        itemCount: (favoriteList.list.isEmpty? 0: favoriteList.list.length),
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: Key(favoriteList.list[index].iD.toString()),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
                favoriteList.list.removeAt(index);
              });
            },
            background: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Color(0xFFFFE6E6),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Spacer(),
                  SvgPicture.asset("assets/icons/Trash.svg"),
                ],
              ),
            ),
            child: fav(favo: favoriteList.list[index]),
          ),
        ),
      ),
    );
  }

  favoriteItemListResponse favoriteList = new favoriteItemListResponse(list:[]);

  readFavoriteList() {
    APIService apiService = new APIService();
    apiService.favoriteItemList(0).then((value) {
      if (value != null) {
        try {
          setState(() {
            favoriteList = value;
          });
        } catch (e) {
          print("favorite list deer aldaa $e");
        }
      } else {
        serverErrorPopup(context, "empty value");
      }
    });
  }
}
