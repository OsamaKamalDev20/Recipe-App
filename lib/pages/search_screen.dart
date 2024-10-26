import 'package:flutter/material.dart';
import 'package:recipeapp/Search/search_items.dart';
import 'package:recipeapp/Search/search_model.dart';
import 'package:recipeapp/utils/constants.dart';
import 'package:recipeapp/widgets/custom_icons.dart';

class SearchRecipe extends StatefulWidget {
  const SearchRecipe({super.key});

  @override
  State<SearchRecipe> createState() => _SearchRecipeState();
}

class _SearchRecipeState extends State<SearchRecipe> {
  String searchText = "";
  List<SearchModel> filteredList = [];
  @override
  Widget build(BuildContext context) {
    filteredList = searchProducts
        .where((searchProducts) =>
            searchProducts.subtitle.toLowerCase().contains(searchText))
        .toList();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Search Recipes",
                    style: TextStyle(
                      fontFamily: 'Heading',
                      fontSize: 20,
                      color: black,
                    ),
                  ),
                  CustomIcon(
                    iconData: Icons.search,
                    onPressed: () {
                      print('Search Recipes');
                    },
                  ),
                ],
              ),
              SizedBox(height: 14),
              TextFormField(
                onChanged: (value) {
                  setState(
                    () {
                      searchText = value.toLowerCase();
                    },
                  );
                },
                cursorColor: purpleColor,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: purpleColor, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  fillColor: lightcolor,
                  filled: true,
                  hintText: "Search for recipes",
                  hintStyle: TextStyle(
                    fontFamily: 'Description',
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Image.asset(
                        filteredList[index].image,
                        height: 200,
                        width: 100,
                      ),
                      title: Text(
                        filteredList[index].title,
                        style: TextStyle(
                          fontFamily: 'Heading',
                          fontSize: 20,
                          color: black,
                        ),
                      ),
                      subtitle: Text(
                        filteredList[index].subtitle,
                        style: TextStyle(
                          fontFamily: 'Heading',
                          fontSize: 15,
                          color: purpleColor,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
