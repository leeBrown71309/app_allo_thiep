import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:foodorderapp/help/Style.dart';
import 'package:foodorderapp/onboarding_sceens/onboarding_screen.dart';
import 'package:sizer/sizer.dart';

class Splash extends StatefulWidget {
  const Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  // @override
  // void initState(){
  //   super.initState();
  //   // goToOnboardScreen();
  // }
  //
  // goToOnboardScreen()async{
  //   await Future.delayed(Duration(seconds: 5),(){});
  //   Navigator.pushReplacementNamed(context, "/OnboardingScreen");
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: logo(),
        backgroundColor: red,
        nextScreen: OnboardingScreen(),
        duration: 2500,
        splashTransition: SplashTransition.fadeTransition,
      ),
    );
  }
}

class logo extends StatelessWidget {
  const logo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.food_bank_rounded,
          size: 70.sp,
          color: white,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(
            "Allo Thiep",
            style: TextStyle(color: white, fontFamily: "pacifico", fontSize: 30.sp),
          ),
        )
      ],
    );
  }
}
