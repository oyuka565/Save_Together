import 'dart:io';
import 'package:flutter/material.dart';
import 'package:together_app/utils/globals.dart';
import 'package:together_app/model/CartItemModel.dart';

import '../../model/FavoriteModel.dart';

class fav extends StatelessWidget {
  const fav({
    Key? key,
    required this.favo,
  }) : super(key: key);

  final favoriteModel favo;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.file(File(favo.imageUrl!)),
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width - 155,
              child: Text(
                favo.content!,
                style: TextStyle(color: Colors.black, fontSize: 16),
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
              ),
            ),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "\$${favo.price}",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: yellowColor),
                children: [
                  TextSpan(
                      text: " x${1}", //cart.quantity
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyText1),
                ],
              ),
            )
          ],
        )
      ],
    );
  }


}
