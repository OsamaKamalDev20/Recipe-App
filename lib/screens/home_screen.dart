import 'package:flutter/material.dart';
import 'package:recipeapp/Home/home_items.dart';
import 'package:recipeapp/pages/details_screen.dart';
import 'package:recipeapp/pages/search_screen.dart';
import 'package:recipeapp/utils/constants.dart';
import 'package:recipeapp/widgets/custom_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var controller = HomeItems();
  var recommendation = HomeDealItems();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomIcon(
                      iconData: Icons.menu,
                      onPressed: () {
                        print('menu');
                      },
                    ),
                    CustomIcon(
                      iconData: Icons.notifications,
                      onPressed: () {
                        print('notifications');
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  'Osama Kamal',
                  style: TextStyle(
                    fontFamily: 'Description',
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'What would you like to eat in RAMADAN',
                  style: TextStyle(
                    fontFamily: 'Heading',
                    fontSize: 28,
                    color: black,
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                        decoration: BoxDecoration(
                          color: lightcolor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextField(
                          cursorColor: purpleColor,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search,
                              color: purpleColor,
                              size: 28,
                            ),
                            hintText: "Search for recipes",
                            hintStyle: TextStyle(
                              fontFamily: 'Description',
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    CustomIcon(
                      iconData: Icons.search,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchRecipe()),
                        );
                      },
                    )
                  ],
                ),

//Best Dishes Material//
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "RAMADAN Dishes",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Heading',
                        color: black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => print("View all RAMADAN dishes"),
                      child: Text(
                        'View All',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Heading',
                          color: purpleColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Container(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsScreen(),
                            ),
                          );
                        },
                        child: Container(
                          height: 250,
                          width: 200,
                          margin: EdgeInsets.only(right: 32),
                          decoration: BoxDecoration(
                            color: lightcolor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Stack(
                            alignment: AlignmentDirectional.topStart,
                            children: [
                              Positioned(
                                top: 12,
                                right: 8,
                                child: Icon(
                                  Icons.favorite,
                                  color: purpleColor,
                                ),
                              ),
                              Positioned(
                                top: 8,
                                right: 4,
                                child: Image.asset(
                                  controller.items[index].image,
                                  height: 160,
                                  width: 160,
                                ),
                              ),
                              Positioned(
                                top: 150,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Ramazan Deals',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: purpleColor,
                                          fontFamily: 'SubHeading',
                                        ),
                                      ),
                                      Text(
                                        controller.items[index].title,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Heading',
                                        ),
                                      ),
                                      Row(
                                        children: List.generate(
                                          5,
                                          (index) => Icon(
                                            Icons.star,
                                            color: purpleColor,
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Text(
                                            "\$${controller.items[index].price.toStringAsFixed(2)}",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: 'Heading',
                                              color: purpleColor,
                                            ),
                                          ),
                                          SizedBox(width: 12),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.thumb_up_rounded,
                                                color: purpleColor,
                                                size: 14,
                                              ),
                                              SizedBox(width: 4),
                                              Text(
                                                "(45 reviews)",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'SubHeading',
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
//Most Popular Dishes Material//
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Most Popular",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Heading',
                        color: black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => print("View all Popular dishes"),
                      child: Text(
                        'View All',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Heading',
                          color: purpleColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(),
                          ),
                        );
                      },
                      child: Container(
                        height: 120,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        margin: EdgeInsets.only(bottom: 14),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: lightcolor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              recommendation.items[index].image,
                              height: 200,
                              width: 140,
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Most Popular",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: purpleColor,
                                        fontFamily: 'Heading',
                                      ),
                                    ),
                                    SizedBox(height: 6),
                                    Text(
                                      recommendation.items[index].title,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'Heading',
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Row(
                                      children: [
                                        Row(
                                          children: List.generate(
                                            5,
                                            (index) => Icon(
                                              Icons.star,
                                              color: purpleColor,
                                              size: 16,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          "${recommendation.items[index].calories}\cal",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Heading',
                                            color: purpleColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 6),
                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.access_time,
                                              color: Colors.grey,
                                              size: 14,
                                            ),
                                            SizedBox(width: 6),
                                            Text(
                                              "15 mins",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: 'SubHeading',
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 34),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.person,
                                              size: 12,
                                              color: Colors.grey,
                                            ),
                                            SizedBox(width: 6),
                                            Text(
                                              "1 person",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: 'SubHeading',
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
