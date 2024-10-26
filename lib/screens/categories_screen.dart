import 'package:flutter/material.dart';
import 'package:recipeapp/Category_Model/categorymodel_items.dart';
import 'package:recipeapp/Category_Model/productmodel_items.dart';
import 'package:recipeapp/Category_Model/productmodel_info.dart';
import 'package:recipeapp/Home/home_items.dart';
import 'package:recipeapp/utils/constants.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  int categoryIndex = 0;
  var recommendation = HomeDealItems();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'RAMAZAN Categories',
                  style: TextStyle(
                    fontFamily: 'Heading',
                    fontSize: 20,
                    color: purpleColor,
                  ),
                ),
                SizedBox(
                  height: 70,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => SizedBox(width: 10),
                    itemCount: category.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            categoryIndex = index;
                          });
                        },
                        child: Container(
                          width: 180,
                          height: 80,
                          decoration: BoxDecoration(
                            border: Border.all(color: purpleColor, width: 2),
                            borderRadius: BorderRadius.circular(10),
                            color: categoryIndex == index
                                ? purpleColor
                                : lightcolor,
                          ),
                          child: Row(
                            children: [
                              Image.asset(category[index].image, height: 70),
                              SizedBox(width: 10),
                              Text(
                                category[index].title,
                                style: TextStyle(
                                  fontFamily: "SubHeading",
                                  color: categoryIndex == index
                                      ? Colors.white
                                      : Colors.grey,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Popular Dishes',
                  style: TextStyle(
                    fontFamily: 'Heading',
                    fontSize: 20,
                    color: purpleColor,
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 250,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: ((context, index) => SizedBox(width: 10)),
                    itemCount: categorizeList().length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 170,
                        height: 250,
                        decoration: BoxDecoration(
                          color: lightcolor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                categorizeList()[index].image,
                              ),
                              Text(
                                categorizeList()[index].title,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Heading',
                                ),
                              ),
                              Text(
                                "${categorizeList()[index].reviews.toString()} reviews",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'SubHeading',
                                  color: purpleColor,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "\$${categorizeList()[index].price.toString()}",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Heading',
                                      color: purpleColor,
                                    ),
                                  ),
                                  SizedBox(width: 8),
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
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'View More Dishes',
                  style: TextStyle(
                    fontFamily: 'Heading',
                    fontSize: 20,
                    color: purpleColor,
                  ),
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Container(
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
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
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

  List<ProductModel> categorizeList() {
    switch (categoryIndex) {
      case 0:
        return chineseList;
      case 1:
        return drinks;
      case 2:
        return chats;
      case 3:
        return rolls;
      default:
        return [];
    }
  }
}
