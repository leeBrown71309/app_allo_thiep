import 'package:flutter/material.dart';
import 'package:foodorderapp/help/Style.dart';
import 'package:sizer/sizer.dart';

import 'menu_item.dart';


class DrawerScreen extends StatefulWidget {
  final AnimationController controller;

  const DrawerScreen({Key key, this.controller}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  Animation<double> _scaleAnimation;
  Animation<Offset> _slideAnimation;

  @override
  Widget build(BuildContext context) {
    if (_scaleAnimation == null) {
      _scaleAnimation = Tween<double>(begin: 0.6, end: 1).animate(widget.controller);
    }
    if(_slideAnimation == null) {
      _slideAnimation = Tween<Offset>(begin: Offset(-1,0), end: Offset(0,0)).animate(widget.controller);
    }
    return SlideTransition(
        position: _slideAnimation,
          child: ScaleTransition(
        scale: _scaleAnimation,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    stops: [0.1, 0.4, 0.7, 0.9],
                    colors: [
                      Color(0xfffc3c3c),
                      Color(0xffec4141),
                      Color(0xffe24545),
                      Color(0xffdf5454),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomRight),
              ),
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Icon(Icons.food_bank_rounded,color: Colors.white, size: 50,),
                    SizedBox(width: 10,),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Text("Allo Thiep",
                      style: TextStyle(
                        color: white,
                        fontSize: 20.sp,
                        fontFamily: 'mont'
                      ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                MenuItem(title: 'Mon Compte', icon: Icons.person),
                MenuItem(title: 'Mon Historique', icon: Icons.history),
                MenuItem(title: 'contactez-nous', icon: Icons.phone_in_talk_rounded),
                MenuItem(title: 'Notifications', icon: Icons.notifications_on_rounded,),
                MenuItemButton(title: 'Deconnexion', icon: Icons.exit_to_app)
            ]
          ),
        ),
      ),
    );
  }
}