import 'package:flutter/material.dart';
import 'package:recipeapp/Favorite_Model/favorite_items.dart';
import 'package:recipeapp/utils/constants.dart';
import 'package:recipeapp/widgets/custom_icons.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Favorite Items',
                      style: TextStyle(
                        fontFamily: 'Heading',
                        fontSize: 20,
                        color: purpleColor,
                      ),
                    ),
                    CustomIcon(
                      iconData: Icons.favorite,
                      onPressed: () {
                        print('favorites');
                      },
                    ),
                  ],
                ),
                SizedBox(height: 16),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: list.length,
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
                            list[index].image,
                            height: 250,
                            width: 140,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 4),
                                  Text(
                                    list[index].title,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Heading',
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    "\$${list[index].price.toString()}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Heading',
                                        color: purpleColor),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    "${list[index].reviews.toString()} reviews",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: 'SubHeading',
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(height: 4),
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
}
