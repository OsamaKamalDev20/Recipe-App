import 'package:flutter/material.dart';
import 'package:recipeapp/onboarding_screen/onboarding_items.dart';
import 'package:recipeapp/utils/constants.dart';
import 'package:recipeapp/widgets/navigation_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  var controller = OnboardingItems();
  var pageController = PageController();

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: controller.items.length,
              onPageChanged: (index) {
                setState(
                  () {
                    currentIndex = index;
                  },
                );
              },
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      width: 400,
                      height: 480,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Image.asset(
                        controller.items[index].image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      controller.items[index].title,
                      style: TextStyle(
                        fontFamily: 'Heading',
                        fontSize: 30,
                        color: purpleColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Text(
                        controller.items[index].description,
                        style: TextStyle(
                          fontFamily: 'Description',
                          fontSize: 18,
                          color: Colors.grey[400],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 8),
                    SmoothPageIndicator(
                      controller: pageController,
                      count: controller.items.length,
                      onDotClicked: (index) => pageController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeIn),
                      effect: WormEffect(
                        dotHeight: 12,
                        dotWidth: 12,
                        activeDotColor: Colors.deepPurple,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: purpleColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextButton(
                        child: Text(
                          currentIndex == controller.items.length - 1
                              ? "Finish"
                              : "Next",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'SubHeading',
                            fontSize: 20,
                          ),
                        ),
                        onPressed: () {
                          if (currentIndex == controller.items.length - 1) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MainPage(),
                              ),
                            );
                          } else {
                            pageController.nextPage(
                              duration: Duration(milliseconds: 600),
                              curve: Curves.easeIn,
                            );
                          }
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
