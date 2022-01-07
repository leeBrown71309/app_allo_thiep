import 'dart:convert';
import 'package:foodorderapp/help/Style.dart';
import 'package:foodorderapp/help/extensions.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants.dart';
import '../help/loading.dart';
import '../help/responsive.dart';

class Boissons extends StatefulWidget {
  @override
  _BoissonsState createState() => _BoissonsState();
}

//ici la tu fais une grideView Builder comme sur le site web
class _BoissonsState extends State<Boissons> {
  showBoisson(
    context,
  ) {
    var cardImage =
        NetworkImage('https://source.unsplash.com/random/800x600?Boissons');
    return showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: Stack(
              children: [
                Container(
                    padding:
                        EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
                    height: Responsive.isMobile(context)
                        ? MediaQuery.of(context).size.height * 0.5
                        : MediaQuery.of(context).size.height * 0.4,
                    width: Responsive.isMobile(context)
                        ? MediaQuery.of(context).size.width * 0.9
                        : MediaQuery.of(context).size.width * 0.9,
                    margin: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: 10,
                          offset: Offset(0.0, 10.0),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: Responsive.isMobile(context) ? 200 : 300,
                          left: 5,
                          right: 5,
                          bottom: 5),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(
                              "title",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              "desc",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "prix",
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )),
                Positioned(
                  top: -2,
                  left: 16,
                  right: 16,
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Stack(
                      children: [
                        Ink.image(
                          image: cardImage,
                          height: Responsive.isMobile(context) ? 200 : 300,
                          width: Responsive.isMobile(context) ? 400 : 800,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    Widget buildCard(
         Color Tcolor, String nom, String img) {
      return Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () => showBoisson(context),
                      child: Stack(
                        children: [
                          Container(
                            height: 25.h,
                            width: 35.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    begin: Alignment.bottomRight,
                                    end: Alignment.topLeft,
                                    colors: [Color(0xFFFFFFFF),
                                      Color(0xFFFFFDFD)],
                                    stops: [0.1, 0.7])
                            ),
                          ).addNeumorphism(
                            blurRadius: 20,
                            borderRadius: 25,
                            offset: Offset(5, 5),
                            topShadowColor: Colors.white60,
                            bottomShadowColor:
                                Color(0xFF234395).withOpacity(0.5),
                          ),
                          Container(
                            width: 35.w,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Tcolor.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              nom,
                              style: TextStyle(color: white, fontSize: 10.sp),
                            ),
                          ),
                          Container(
                            width: 30.w,
                            // color: blue,
                            child: Image.asset(
                              img,
                              height: 27.h,
                              width: 40.w,
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        print("ajoute moi");
                      },
                      child: Container(
                        width: 35.w,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Tcolor.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Ajouter",
                            style: TextStyle(color: white, fontSize: 12.sp),
                          ),
                        ),
                      ).addNeumorphism(
                        blurRadius: 15,
                        borderRadius: 15,
                        offset: Offset(5, 5),
                        topShadowColor: Colors.white60,
                        bottomShadowColor: Color(0xFF234395).withOpacity(0.5),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      );
    }

    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                    text: TextSpan(
                        text: 'Boissons en bouteilles ',
                        style: TextStyle(
                            color: black,
                            fontSize: 15.sp,
                            fontFamily: "mont",
                            fontWeight: FontWeight.w700),
                        children: [
                      TextSpan(
                          text: " ( 1000 FCFA )",
                          style: TextStyle(
                              color: black,
                              fontSize: 12.sp,
                              fontFamily: "mont",
                              fontWeight: FontWeight.w200)),
                    ])),
                Icon(
                  Icons.filter_list_rounded,
                  color: red,
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(top: 5,bottom: 5),
              child: Column(
                children: [
                  Row(
                    children: [
                      buildCard(
                        Colors.red,
                        "Coca-Cola",
                        "asset/images/jus/cola3-removebg.png",
                      ),
                      buildCard(
                        Colors.greenAccent,
                        "Sprite",
                        "asset/images/jus/cola3-removebg.png",
                      ),
                      buildCard(
                        Colors.orange,
                        "Jus d'orange",
                        "asset/images/jus/cola3-removebg.png",
                      ),
                      buildCard(
                        Colors.purpleAccent,
                        "Jus de raisin",
                        "asset/images/jus/cola3-removebg.png",
                      ),
                      buildCard(
                        Colors.deepOrangeAccent,
                        "Jus d'ananas",
                        "asset/images/jus/cola3-removebg.png",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                    text: TextSpan(
                        text: 'Boissons en bol ',
                        style: TextStyle(
                            color: black,
                            fontSize: 15.sp,
                            fontFamily: "mont",
                            fontWeight: FontWeight.w700),
                        children: [
                      TextSpan(
                          text: " ( 500 FCFA )",
                          style: TextStyle(
                              color: black,
                              fontSize: 12.sp,
                              fontFamily: "mont",
                              fontWeight: FontWeight.w200)),
                    ])),
                Icon(
                  Icons.filter_list_rounded,
                  color: red,
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(top: 5,bottom: 5),
              child: Column(
                children: [
                  Row(
                    children: [
                      buildCard(
                        Colors.red,
                        "Coca-Cola",
                        "asset/images/jus/jusBol_1-removebg.png",
                      ),
                      buildCard(
                        Colors.greenAccent,
                        "Sprite",
                        "asset/images/jus/jusBol_1-removebg.png",
                      ),
                      buildCard(
                        Colors.orange,
                        "Jus d'orange",
                        "asset/images/jus/jusBol_1-removebg.png",
                      ),
                      buildCard(
                        Colors.purpleAccent,
                        "Jus de raisin",
                        "asset/images/jus/jusBol_1-removebg.png",
                      ),
                      buildCard(
                        Colors.deepOrangeAccent,
                        "Jus d'ananas",
                        "asset/images/jus/cola3-removebg.png",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
