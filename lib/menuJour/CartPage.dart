import 'dart:ffi';

import 'package:animate_icons/animate_icons.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodorderapp/help/custom_text.dart';
import 'package:foodorderapp/help/extensions.dart';
import 'package:foodorderapp/panier/panier_section.dart';
import 'package:sizer/sizer.dart';
import '../constants.dart';
import '../help/Style.dart';

class cartPage extends StatefulWidget {
  @override
  _cartPageState createState() => _cartPageState();
}

class _cartPageState extends State<cartPage> {
  var cardImage =
      NetworkImage('https://source.unsplash.com/random/800x600?foods');

  bool isFav = false;
  bool isAdd = false;
  int nbPlat = 0;
  int prix = 0;

  void favorite() {
    setState(() {
      if (isFav) {
        isFav = false;
      } else {
        isFav = true;
      }
    });
  }

  void addPlat() {
    setState(() {
      if (isAdd) {
        isAdd = false;
      } else {
        isAdd = true;
      }
    });
  }

  AnimateIconController c1;

  @override
  void initState() {
    c1 = AnimateIconController();
    super.initState();
  }

  bool onEndIconPress(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("unfavorited"),
        duration: Duration(seconds: 3),
      ),
    );
    return true;
  }

  bool onStartIconPress(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("favorited"),
        duration: Duration(seconds: 3),
      ),
    );
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        elevation: 2,
        onPressed: () {
          addPlat();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: isAdd ? Text("PLat ajouter") : Text("PLat annuler"),
            duration: Duration(seconds: 3),
          ));
        },
        label: isAdd ? Text('Annuler') : Text('Ajouter'),
        icon: isAdd ? Icon(Icons.close) : Icon(Icons.add),
        backgroundColor: SideMenuColor,
      ),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: white, borderRadius: BorderRadius.circular(10)),
            child: IconButton(
              icon: Icon(
                EvaIcons.arrowLeft,
                size: 30,
                color: black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          // color: bgColor1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(25),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: cardImage, fit: BoxFit.cover),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 130,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10.h,
                                ),
                                CustomText(
                                  text: "Yoshimasa Sushi",
                                  color: white,
                                  size: 20,
                                  weight: FontWeight.w700,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 20,
                                      color: Colors.orange,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 20,
                                      color: Colors.orange,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 20,
                                      color: Colors.orange,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 20,
                                      color: Colors.orange,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 20,
                                      color: Colors.orange,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 60.0),
                              child: Align(
                                child: Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle, color: Colors.white),
                                  child: Center(
                                    child: AnimateIcons(
                                      startIcon: (Icons.favorite_border),
                                      endIcon: (EvaIcons.heart),
                                      controller: c1,
                                      size: 30.0,
                                      startIconColor: red,
                                      endIconColor: red,
                                      onEndIconPress: () => onEndIconPress(context),
                                      onStartIconPress: () => onStartIconPress(context),
                                    ),
                                  ),
                                ),
                                alignment: Alignment.bottomRight,
                              ),
                            )
                          ],
                        ),

                      ],
                    ),
                  ),
                ],
              ),
              Container(
                // color: blueFont,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 40, right: 40, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            //color: blue,
                            width: 45.w,
                            child: Text(
                              "Yoshimasa Sushi",
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                  color: black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          CustomText(
                            text: '2000 FCFA',
                            color: black,
                            size: 16.sp,
                            weight: FontWeight.bold,
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      height: 0.5,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    //incréménteur et décrémeteur
                    Center(
                      child: Container(
                        width: 160,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 55,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: SideMenuColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: IconButton(
                                  onPressed: () => setState(() {
                                        if (nbPlat == 0) {
                                          nbPlat += 0;
                                          prix += 0;
                                        } else {
                                          nbPlat -= 1;
                                          prix -= 2000;
                                        }
                                      }),
                                  icon: Icon(
                                    Icons.remove,
                                    color: white,
                                  )),
                            ),
                            CustomText(
                              text: "$nbPlat",
                              size: 30,
                              color: black,
                            ),
                            Container(
                              width: 55,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: SideMenuColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: IconButton(
                                  onPressed: () => setState(() {
                                        nbPlat += 1;
                                        prix += 2000;
                                      }),
                                  icon: Icon(
                                    Icons.add,
                                    color: white,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(defaultPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Icon(
                                EvaIcons.star,
                                color: orange,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              CustomText(
                                text: '4.8',
                                color: black,
                                size: 20,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                EvaIcons.clockOutline,
                                color: red,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              CustomText(
                                text: '5-15 min',
                                color: black,
                                size: 20,
                              )
                            ],
                          ),
                          // Row(
                          //   children: [
                          //     Icon(EvaIcons.star,color: orange,),
                          //     CustomText(
                          //       text: '4.8',
                          //       color: black,
                          //       size: 20,
                          //     )
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "A propos du plat",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  height: 0.5,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            "Lorem Ipsum is simply dummy text of the printing "
                            "and typesetting industry. Lorem Ipsum has been "
                            "the industry's standard dummy text ever since the "
                            "1500s, when an unknown printer took a galley of "
                            "type and scrambled it to make a type specimen book."
                            " It has survived not only five centuries, but also "
                            "the leap into electronic typesetting, remaining"
                            " essentially unchanged.",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                              height: 110,
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xfff54d4d),
                                    Color(0xffea6868),
                                    Color(0xffd28585),
                                    Color(0xffe8a5a5),
                                  ],
                                  stops: [0.1, 0.4, 0.7, 0.9],
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Total :",
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.w500,
                                              color: white),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Text(
                                          "$prix FCFA",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                              color: white),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )).addNeumorphism(
                            blurRadius: 15,
                            borderRadius: 15,
                            offset: Offset(5, 5),
                            topShadowColor: Colors.white60,
                            bottomShadowColor:
                            Color(0xFF234395).withOpacity(0.3),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

}
