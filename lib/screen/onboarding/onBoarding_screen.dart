import 'package:dallini/constant/const_colors.dart';
import 'package:dallini/constant/const_style.dart';
import 'package:dallini/screen/login_screen.dart';
import 'package:dallini/screen/onboarding/first_screen.dart';
import 'package:dallini/screen/onboarding/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
    PageController pageController=PageController();
    bool isLastPage=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.backGround,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          children: [
            PageView(
        
              onPageChanged: (index) {
                setState(() {
                  isLastPage=index==1;
                });
              },
              controller: pageController,
              children: [
                FirstScreen(),
                SecondScreen()
              ],
            ),
            Container(
        
              alignment: Alignment(0,0.7),
              child: SmoothPageIndicator(
                effect: WormEffect(
                activeDotColor: ConstColors.primary,
                dotColor: Colors.grey.shade300
              ), 
              controller: pageController,
              count: 2,
              
              ),
            ),
          Container(
            
            alignment: Alignment(0,0.9),
            child: SizedBox(
              width: .infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: (){
                  isLastPage?Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginScreen()),(route)=>false):pageController.jumpToPage(1);
                }, 
                style: ConstStyle.buttonStyle,
                child: Text('Get Started',
                style: ConstStyle.textButtonStyle,
                )
                ),
            ),
          )
          ],
        ),
      ),
    );
  }
}