import 'package:flutter/material.dart';
import 'package:recipeapp/utils/constants.dart';

class CustomIcon extends StatelessWidget {
  final IconData iconData;
  final VoidCallback? onPressed;
  const CustomIcon({super.key, required this.iconData, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: lightcolor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              iconData,
              color: purpleColor,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}
