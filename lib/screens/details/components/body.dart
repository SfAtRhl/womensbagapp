import 'package:flutter/material.dart';

import '../../../models/Product.dart';
import '../../../screens/details/components/sizes.dart';

import '../../../constants.dart';
import 'cart_counter.dart';
import 'color_and_size.dart';
import 'description.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: kMainColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            productInfo(title: "Brand", product: product.brand),
                            const SizedBox(height: kDefaultPaddin / 2),
                            productInfo(title: "Code", product: product.code),
                            const SizedBox(height: kDefaultPaddin / 2),
                            productInfo(
                                title: "Leather", product: product.leather),
                            const SizedBox(height: kDefaultPaddin / 2),
                            const Text(
                              "Color",
                              style: const TextStyle(
                                color: Color(0xFF8B2833),
                              ),
                            ),
                            Row(
                              children: const <Widget>[
                                ColorDot(
                                  color: Color(0xFF356C95),
                                  isSelected: true,
                                ),
                                ColorDot(color: Color(0xFFF88000)),
                                ColorDot(color: Color(0xFFA29B9B)),
                              ],
                            ),
                          ],
                        ),
                        Expanded(
                          child: Hero(
                            tag: "${product.id}",
                            child: Image.asset(
                              product.image,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: kDefaultPaddin,
              right: kDefaultPaddin,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: Column(
              children: <Widget>[
                const SizedBox(height: kDefaultPaddin / 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "\$" + (product.price + 100).toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: kMainDarkColor,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        Text(
                          "  \$" + product.price.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: kDefaultPaddin / 2),
                Sizes(),
                const SizedBox(height: kDefaultPaddin / 2),
                Description(product: product),
                const SizedBox(height: kDefaultPaddin / 2),
                Row(
                  children: [
                    const CartCounter(),
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: kMainDarkColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                          ),
                          onPressed: () {},
                          child: Text(
                            "ADD TO CART".toUpperCase(),
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: kDefaultPaddin / 2),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class productInfo extends StatelessWidget {
  const productInfo({
    Key key,
    this.product,
    this.title,
  }) : super(key: key);

  final String product;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Color(0xFF8B2833),
          ),
        ),
        Text(
          product,
          style: TextStyle(
            color: Color(0xFF8B2833).withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}
