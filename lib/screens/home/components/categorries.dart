import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class Categories extends StatefulWidget {
  const Categories({Key key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = [
    "Watche",
    "Jewellery",
    "Dress",
    "Cosmetics",
    "Bags"
  ];

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPaddin, vertical: kDefaultPaddin),
      child: SizedBox(
        height: 55,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategory(index),
        ),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin / 10),
        child: Container(
          width: 75,
          decoration: BoxDecoration(
            color: selectedIndex == index ? kMainDarkColor : kMainColor,
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/icons/${categories[index]}.svg",
                color: selectedIndex == index ? Colors.white : kTextColor,
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  categories[index],
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: selectedIndex == index ? kMainColor : kTextColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
