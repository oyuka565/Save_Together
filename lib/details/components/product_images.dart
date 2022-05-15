import 'dart:io';

import 'package:flutter/material.dart';
import 'package:together_app/model/Product.dart';
import 'package:together_app/utils/globals.dart';

import '../../model/ProdModel.dart';


class ProductImages extends StatefulWidget {
  const ProductImages(this.product);

  final ProductModel product;

  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int selectedImage = 0;
  String selectedImageUrl = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 238,
          child: AspectRatio(
            aspectRatio: 1,
            child: Hero(
              tag: widget.product.productID.toString(),
              child: //Image.asset(widget.product.imageUrl!),
              Image.file(
                File(
                    (   selectedImage == 0? widget.product.imageUrl!:
                        selectedImage == 1? widget.product.imageUrl1!:
                        selectedImage == 2 ?widget.product.imageUrl2!:
                        widget.product.imageUrl3!)
                    ),
              )
            ),
          ),
        ),
        // SizedBox(height: 20),
       Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(4,
                (index) => buildSmallProductPreview(index)),
          ],
        )

      ],
    );
  }

  GestureDetector buildSmallProductPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: AnimatedContainer(
        duration: defaultDuration,
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(8),
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: yellowColor.withOpacity(selectedImage == index ? 1 : 0)),
        ),
        child: Image.file(
          File((
              index == 0? widget.product.imageUrl!:
              index == 1? widget.product.imageUrl1!:
              index == 2 ?widget.product.imageUrl2!:
                          widget.product.imageUrl3!)
          ),),
        //Image.asset(widget.product.imageUrl!),
      ),
    );
  }
}
