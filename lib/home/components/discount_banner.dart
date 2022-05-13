import 'package:flutter/material.dart';
import 'package:together_app/home/components/special_offers.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../size_config.dart';


class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> imageList = ["assets/images/reclam1.png",
      "assets/images/reclam2.png",
      "assets/images/amara.png"];

    return Container(
      // height: 90,
      width: double.infinity,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: CarouselSlider.builder(
        itemCount: imageList.length,
        options: CarouselOptions(
          enlargeCenterPage: true,
          height: 100,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          reverse: false,
          aspectRatio: 5.0,
        ),
        itemBuilder: (context, i, id){
          //for onTap to redirect to another screen
          return GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.white,)
              ),
              //ClipRRect for image border radius
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  imageList[i],
                  width: 500,
                  fit: BoxFit.cover,
                ),
              ),
            ),

          );
        },
      ),
    );
  }
}


