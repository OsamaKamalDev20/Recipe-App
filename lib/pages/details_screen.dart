import 'package:flutter/material.dart';
import 'package:recipeapp/utils/constants.dart';
import 'package:recipeapp/widgets/custom_icons.dart';

class DetailsScreen extends StatefulWidget {
  final name;
  DetailsScreen({super.key, this.name});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.only(top: 20, left: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 24),
                    child: CustomIcon(
                      iconData: Icons.menu_book,
                      onPressed: () {},
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: Text(
                    "Chinese Noddles",
                    style: TextStyle(fontFamily: 'Heading', fontSize: 36),
                  ),
                ),
                SizedBox(height: 16),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "\$",
                        style: TextStyle(
                          fontFamily: 'SubHeading',
                          fontSize: 20,
                          color: purpleColor,
                        ),
                      ),
                      TextSpan(
                        text: " 200.00",
                        style: TextStyle(
                          fontFamily: 'Heading',
                          fontSize: 30,
                          color: purpleColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 3.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Time Taken",
                              style: TextStyle(
                                fontFamily: 'Subheading',
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              "30 mins",
                              style: TextStyle(
                                fontFamily: 'Heading',
                                fontSize: 20,
                                color: purpleColor,
                              ),
                            ),
                            SizedBox(height: 30),
                            Text(
                              "Calories",
                              style: TextStyle(
                                fontFamily: 'Subheading',
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              "120 cal",
                              style: TextStyle(
                                fontFamily: 'Heading',
                                fontSize: 20,
                                color: purpleColor,
                              ),
                            ),
                            SizedBox(height: 30),
                            Text(
                              "Serving",
                              style: TextStyle(
                                fontFamily: 'Subheading',
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              "2 Persons",
                              style: TextStyle(
                                fontFamily: 'Heading',
                                fontSize: 20,
                                color: purpleColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        "assets/images/food1.png",
                        height: 250,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "Description",
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Heading',
                    color: purpleColor,
                  ),
                ),
                SizedBox(height: 4),
                Padding(
                  padding: EdgeInsets.only(right: 24),
                  child: Text(
                    "Chinese macaroni, a popular comfort food, consists of wheat-based noodles served in a savory broth or stir-fried with vegetables, meat, and seasonings, offering flavorful experience.",
                    style: TextStyle(
                      fontFamily: 'Description',
                      fontSize: 18,
                      color: Colors.grey[400],
                    ),
                  ),
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: purpleColor,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Go Back",
                    style: TextStyle(
                      fontFamily: 'Headline',
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
