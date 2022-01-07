import 'package:flutter/material.dart';
import 'package:foodorderapp/help/Style.dart';

class img extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SideMenuColor,
      body: Center(
        child: Image.asset("asset/images/Image1.png",
        height: 300,
        width: 500,),
      ),
    );
  }
}
