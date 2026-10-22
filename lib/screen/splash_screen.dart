import 'dart:async';

import 'package:dallini/constant/const_colors.dart';
import 'package:dallini/screen/onboarding/first_screen.dart';
import 'package:dallini/screen/onboarding/onBoarding_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();


     Timer(
      Duration(seconds: 3),
      ()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => OnboardingScreen(),),)
    );
  }
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ConstColors.backGround,

      body: Center(
        child: Column(
          children: [
            Image.asset('assets/images/logo.png',height:size.height/1.5 ,width: size.width/1.5,),
            CircularProgressIndicator(color: ConstColors.secondary,)
          ],
        ),
      ),
    );
  }
}