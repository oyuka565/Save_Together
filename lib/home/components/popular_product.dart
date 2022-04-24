import 'package:flutter/material.dart';
import 'package:together_app/components/product_card.dart';
import 'package:together_app/model/Product.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 20),
          child: SectionTitle(title: "Санал болгох", press: () {}),
        ),
        SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                demoProducts.length,
                (index) {
                  if (demoProducts[index].isPopular)
                    return ProductCard(product: demoProducts[index]);

                  return SizedBox
                      .shrink(); // here by default width and height is 0
                },
              ),
              SizedBox(width: 20),
            ],
          ),
        )
      ],
    );
  }
}
