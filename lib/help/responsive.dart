import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget Tablet;
  final Widget Mobile;

  const Responsive({
   this.Mobile,
    this.Tablet
  });

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 800;
  }



  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width >= 800 &&
        MediaQuery.of(context).size.width <= 1200;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
         if (constraints.maxWidth <= 1200 &&
            constraints.maxWidth >= 800) {
          return Tablet;
        } else {
          return Mobile;
        }
      },
    );
  }
}
