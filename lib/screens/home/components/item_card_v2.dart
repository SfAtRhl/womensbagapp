import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:womensbagapp/models/Product.dart';

import '../../../constants.dart';
import 'favIcon.dart';

class ItemCardV2 extends StatelessWidget {
  final Product product;
  final Function press;
  const ItemCardV2({
    Key key,
    this.product,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPaddin / 2, vertical: kDefaultPaddin / 6),
      child: GestureDetector(
        onTap: press,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(kDefaultPaddin / 4),
                  height: 80,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: kTextColor,
                        spreadRadius: 0.1,
                        blurRadius: 2,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Hero(
                        tag: "${product.id}",
                        child: Image.asset(
                          product.image,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPaddin / 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              product.title,
                              style: const TextStyle(color: Colors.black),
                            ),
                            Row(
                              children: [
                                 SvgPicture.asset(
                                  "assets/icons/Star.svg",
                                  color: Color(0xFFEEA939),
                                  height: 10,
                                ),
                                Text(
                                  " ${product.rating}",
                                  style:
                                      const TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 15,
              right: 10,
              child: Text(
                "\$${product.price}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(top: 10, right: 10, child: FavIcon(product: product)),
          ],
        ),
      ),
    );
  }
}
