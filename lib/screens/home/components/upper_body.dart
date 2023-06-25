import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:womensbagapp/constants.dart';

class UpperBody extends StatefulWidget {
  const UpperBody({Key key}) : super(key: key);

  @override
  State<UpperBody> createState() => _UpperBodyState();
}

class _UpperBodyState extends State<UpperBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
        color: kMainColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPaddin, vertical: kDefaultPaddin),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/menu.svg",
                    color: kMainDarkColor,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/cart.svg",
                    color: kMainDarkColor,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 2),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Find your Favorite Items!",
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 27,
                        color: kMainDarkColor),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                        height: 35,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(24),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            cursorColor: kTextColor,
                            onChanged: (value) {},
                            decoration: InputDecoration(
                              hintText: 'Search',
                              prefixIcon: SvgPicture.asset(
                                "assets/icons/search.svg",
                                color: kTextColor,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 11,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        )),
                  ),
                ),
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      "assets/icons/filter.svg",
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
