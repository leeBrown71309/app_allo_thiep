import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodorderapp/authentification/sign_and_login.dart';
import 'package:foodorderapp/help/Style.dart';
import 'package:foodorderapp/help/custom_text.dart';

import '../constants.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 5;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? SideMenuColor1 : Colors.black12,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  void goToNextPage() {
    //permet de naviguer d'une page à une autre avec une animation
    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(seconds: 1),
            transitionsBuilder: (context, animation, animationTime, child) {
              animation =
                  CurvedAnimation(parent: animation, curve: Curves.linearToEaseOut);
              return ScaleTransition(
                scale: animation,
                alignment: Alignment.center,
                child: child,
              );
            },
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return LoginSignupScreen();
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Container(
            color: white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 23.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: FlatButton(
                      onPressed: () {},
                      child: Text(
                        'Passer',
                        style: TextStyle(
                          color: black,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 600.0,
                    child: PageView(
                      physics: ClampingScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      children: <Widget>[
                        Padding(
                          padding:
                              EdgeInsets.only(top: 70, left: 20, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Image.asset("asset/images/onboard1-removebg.png",
                                height: 300,
                                width: 400,),
                              ),
                              SizedBox(height: 20.0),
                              Text(
                                " bonjour",
                                style: TextStyle(
                                  color: black,
                                  fontFamily: 'Montserrat',
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                          EdgeInsets.only(top: 70, left: 20, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Image.asset("asset/images/plat-removebg.png",
                                  height: 300,
                                  width: 400,),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                " bonjour",
                                style: TextStyle(
                                  color: black,
                                  fontFamily: 'Montserrat',
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                          EdgeInsets.only(top: 70, left: 20, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Image.asset("asset/images/onboard.jpg",
                                  height: 300,
                                  width: 400,),
                              ),
                              // SizedBox(height: 20.0),
                              Text(
                                " bonjour",
                                style: TextStyle(
                                  color: black,
                                  fontFamily: 'Montserrat',
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                          EdgeInsets.only(top: 70, left: 20, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Image.asset("asset/images/livreur2-removebg.png",
                                  height: 300,
                                  width: 400,),
                              ),
                              SizedBox(height: 20.0),
                              Text(
                                " bonjour",
                                style: TextStyle(
                                  color: black,
                                  fontFamily: 'Montserrat',
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                          EdgeInsets.only(top: 70, left: 20, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Image.asset("asset/images/livreur1.jpg",
                                  height: 300,
                                  width: 400,),
                              ),
                              // SizedBox(height: 20.0),
                              Text(
                                " bonjour",
                                style: TextStyle(
                                  color: black,
                                  fontFamily: 'Montserrat',
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomSheet: Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20)
            ),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.1, 0.4, 0.7, 0.9],
              colors: [
                Color(0xfff54d4d),
                Color(0xffea6868),
                Color(0xffd28585),
                Color(0xffe8a5a5),
              ],
            ),
          ),

          child: Padding(
            padding: const EdgeInsets.only(bottom: 25,top: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: white,
                    onPrimary: white,
                    shadowColor: white,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(10)
                        )
                    ),
                  ),
                  onPressed: () {
                    goToNextPage();
                  },
                  child: CustomText(
                    text: "Commencer",
                    size: 25,
                    color: SideMenuColor1,
                    weight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
