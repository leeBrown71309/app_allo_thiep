import 'package:flutter/material.dart';
import 'package:foodorderapp/constants.dart';
import 'package:foodorderapp/help/Style.dart';
import 'package:sizer/sizer.dart';

class CommandeValide extends StatefulWidget {
  @override
  _CommandeValideState createState() => _CommandeValideState();
}

class _CommandeValideState extends State<CommandeValide> {

  @override
  void initState(){
    super.initState();
    goToOnboardScreen();
  }

  goToOnboardScreen()async{
    await Future.delayed(Duration(seconds: 10),(){});
    Navigator.pushReplacementNamed(context, '/HomeScreen');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.asset(
              "asset/images/valide-removebg.png",
              height: 40.h,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                children: [
                  Text("Vous receverez la validation de votre commande sous peu",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: SideMenuColor1,
                    fontSize: 16.sp,
                    fontFamily: "mont"
                  ),),
                  SizedBox(height: 16,),
                  RichText(
                    text: TextSpan(
                        text:
                        "Nous vous remercions d'avoir passer votre commande "
                            "chez ",
                        style: TextStyle(
                            color: black, fontSize: 18.sp, fontFamily: 'mont'),
                        children: [
                          TextSpan(
                            text: "",
                          )
                        ]),
                  ),
                  Center(
                      child: Text(
                        "Allo Thiep !!!",
                        style: TextStyle(
                            color: Color(0xfff54d4d), fontFamily: 'mont', fontSize: 20.sp),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
