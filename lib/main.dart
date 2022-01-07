import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodorderapp/HotelPage.dart';
import 'package:foodorderapp/panier/panier_section.dart';
import 'package:foodorderapp/splash_screen/splash.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import 'CommandProgress/Screens/commandes.dart';
import 'CommandProgress/Screens/edit.dart';
import 'CommandProgress/Screens/valided.dart';
import 'Drawer/layout_screen.dart';
import 'authentification/sign_and_login.dart';
import 'help/Style.dart';
// import 'globals.dart' as global;
import 'menuJour/CartPage.dart';
import 'onboarding_sceens/onboarding_screen.dart';

bool vf = true;
var initScreen;
Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // SharedPreferences preferences = await SharedPreferences.getInstance();
  // initScreen = await preferences.getInt('initScreen');
  // await preferences.setInt('initScreen', 1);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  Sizer(builder: (context, orientation, deviceType) {
      return buildMaterialApp(context, Splash()
      );
    });

  }
}

MaterialApp buildMaterialApp(BuildContext context, var main) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Allo Thieb',
        initialRoute: '/',
        routes: {
          '/': (context) =>  Splash(),
          '/OnboardingScreen': (context) =>  OnboardingScreen(),
          '/Auth': (context) => LoginSignupScreen(),
          '/HomeScreen': (context) => LayoutScreen(),
          '/EditPopUp': (context) => EditAdress(),
          '/CommandeProgress': (context) => Commandes(),
          '/CommandeValidé': (context) => CommandeValide(),
          '/Panier': (context) => Shop(),
          '/cartPage': (context) => cartPage(),
        },
      ),

    // MainScreen(),
  );
}
