import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:together_app/templates/popUp.dart';
import 'package:together_app/utils/globals.dart';
import '../../model/ProdModel.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription(  this.product//, this.pressOnSeeMore
  );

  final ProductModel product;
  //final GestureTapCallback? pressOnSeeMore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            product.prodcutTitle!,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.all(15),
            width: 64,
            decoration: BoxDecoration(
              color:
                  product.isFavourite ? Color(0xFFFFE6E6) : Color(0xFFF5F6F9),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: SvgPicture.asset(
              "assets/icons/Heart Icon_2.svg",
              color:
                  product.isFavourite ? Color(0xFFFF4848) : Color(0xFFDBDEE4),
              height: 16,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 64,
          ),
          child: Text(
            product.summary!,
            maxLines: 3,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 64,
          ),
       child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
        InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () {},
           child: Container(
           padding: EdgeInsets.all(8),
              child: Icon(Icons.person,
               color: Colors.green)
    ),
    ),
           Text(
            "x  ${product.groupQty}",
            maxLines: 3,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.green,
            ),
          ),
           ]
          )
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: GestureDetector(
            onTap: () { informationPopup(context, product.prodcutTitle!, product.content!);},
            child: Row(
              children: [
                Text(
                  "Дэлгэрэнгүй",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: yellowColor),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: yellowColor,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
