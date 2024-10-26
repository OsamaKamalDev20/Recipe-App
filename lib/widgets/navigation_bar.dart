import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:recipeapp/screens/categories_screen.dart';
import 'package:recipeapp/screens/favorite_screen.dart';
import 'package:recipeapp/screens/home_screen.dart';
import 'package:recipeapp/utils/constants.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int navBarIndex = 0;

  List navBody = [
    HomeScreen(),
    CategoriesScreen(),
    FavoriteScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navBody[navBarIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: purpleColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(0.1),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: GNav(
            backgroundColor: purpleColor,
            tabBackgroundColor: Colors.deepPurple[200]!,
            color: Colors.grey,
            duration: Duration(milliseconds: 900),
            curve: Curves.easeIn,
            activeColor: purpleColor,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            gap: 2,
            iconSize: 24,
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.category,
                text: 'Variety',
              ),
              GButton(
                icon: Icons.favorite,
                text: 'Favorite',
              ),
            ],
            selectedIndex: navBarIndex,
            onTabChange: (index) {
              setState(
                () {
                  navBarIndex = index;
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
