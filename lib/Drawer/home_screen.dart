import 'package:avatar_glow/avatar_glow.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodorderapp/boissonSection/boisson_section.dart';
import 'package:foodorderapp/constants.dart';
import 'package:foodorderapp/help/Style.dart';
import 'package:foodorderapp/help/custom_text.dart';
import 'package:foodorderapp/menuJour/menu_jour.dart';
import 'package:foodorderapp/side_plats/side_plats.dart';
import 'package:sizer/sizer.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'category_item.dart';

class HomeScreen extends StatefulWidget {
  final AnimationController controller;
  final Duration duration;

  const HomeScreen({Key key, this.controller, this.duration}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool menuOpen = false;
  Animation<double> _scaleAnimation;

  @override
  Widget build(BuildContext context) {
    if (_scaleAnimation == null) {
      _scaleAnimation =
          Tween<double>(begin: 1, end: 0.6).animate(widget.controller);
    }
    var size = MediaQuery.of(context).size;

    return AnimatedPositioned(
      duration: widget.duration,
      top: 0,
      bottom: 0,
      left: menuOpen ? 0.1.w * size.width : 0,
      right: menuOpen ? -0.4 * size.width : 0,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        !menuOpen
                            ? IconButton(
                                icon: Icon(
                                  Icons.menu,
                                  size: 35,
                                ),
                                onPressed: () {
                                  setState(() {
                                    widget.controller.forward();
                                    menuOpen = true;
                                  });
                                },
                                color: SideMenuColor,
                              )
                            : IconButton(
                                icon: Icon(
                                  EvaIcons.arrowLeft,
                                  size: 35,
                                ),
                                onPressed: () {
                                  setState(() {
                                    widget.controller.reverse();
                                    menuOpen = false;
                                  });
                                },
                                color: SideMenuColor,
                              ),
                        SizedBox(
                          width: 20,
                        ),
                        Center(
                          child: Text(
                            "Allo Thieb",
                            style: TextStyle(
                              fontFamily: 'pacifico',
                              fontSize: 18.sp
                            ),
                          ),
                        ),

                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: AvatarGlow(
                        glowColor: Colors.blue.withOpacity(0.1),
                        endRadius: 50.0,
                        duration: Duration(milliseconds: 2000),
                        repeat: true,
                        showTwoGlows: true,
                        repeatPauseDuration: Duration(milliseconds: 2000),
                        child: Material(     // Replace this child with your own
                          elevation: 8.0,
                          shape: CircleBorder(),
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[100],
                            child: Image.asset(
                              'asset/images/flutterBird.png',
                              height: 40,
                            ),
                            radius: 37.0,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Globals().isValidated == true ?
                      SlideCountdownSeparated(
                        duration: const Duration(minutes: 5),
                        height: 50,
                        width: 50,
                        onDone: (){
                          Globals().isValidated = false;
                          print("count fini");
                        },
                      ):
                      Globals().isValidated == false ? Container() : null,
                      MenuJour(),
                      Boissons(),
                      SizedBox(
                        height: 5,
                      ),
                      DiapoPlats()
                     
                      //-------------------------------------------------
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
