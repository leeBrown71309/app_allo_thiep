import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:foodorderapp/constants.dart';
import 'package:foodorderapp/help/Style.dart';
import 'package:foodorderapp/help/extensions.dart';
import 'package:foodorderapp/panier/panier_section.dart';
import 'package:horizontal_card_pager/card_item.dart';
import 'package:horizontal_card_pager/horizontal_card_pager.dart';
import 'package:sizer/sizer.dart';
import 'CartPage.dart';
import '../help/responsive.dart';

class MenuJour extends StatefulWidget {
  @override
  _MenuJourState createState() => _MenuJourState();
}

class _MenuJourState extends State<MenuJour> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// hi + le nom de l'utilisateur si authentifier
                  Text(
                    "Bonjour utilisateur",
                    style: TextStyle(
                        color: black, fontSize: 13.sp, fontFamily: "mont"),
                  ),
                  Text(
                    "Bienvenue sur Allo Thiep",
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'mont'),
                  ),
                ],
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: panierColor,
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Shop()));
                        },
                        child: Icon(Icons.shopping_bag_outlined),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),

          ///*********bloc*************
          Stack(
            children: [
              Container(
                  height: 110,
                  width: 110.w,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Commendez et faite \nvous livrer chez vous\nou au travail",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: white),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Image.asset(
                        "asset/images/livreur1-removebg.png",
                        height: 170,
                        width: 40.w,
                      ),
                    ],
                  )),
            ],
          ),

          ///*********bloc*************

          SizedBox(
            height: 15,
          ),
          //------------------------------------------------
          Container(
            child: Text(
              "Que voulez vous commandez aujourd'hui ??!",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15.sp,
                fontFamily: 'mont',
                fontWeight: FontWeight.w500
              ),
            ),
          ),

          SafeArea(
              child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 35.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RotatedBox(
                        quarterTurns: 3,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: "Spécialités...   ",
                                  style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontFamily: 'mont',
                                      fontSize: 10.sp),
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: "Menu du jour",
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontFamily: 'mont',
                                      fontSize: 16.sp),
                                ),
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(flex: 8, child: PlatMenu())
            ],
          )),
          SizedBox(
            height: 20,
          )


        ],
      ),
    );
  }
}

class PlatMenu extends StatefulWidget {
  @override
  _PlatMenuState createState() => _PlatMenuState();
}

class _PlatMenuState extends State<PlatMenu> {
  @override
  void initState() {
    super.initState();
  }

  var cardImage = 'https://source.unsplash.com/random/800x600?foods';

  NetworkImage url(var img) {
    return img;
  }

  final CarouselController _controller = CarouselController();

  List _isSelected = [true, false, false, false, false, false, false];

  int _current = 0;

  List<String> images = [
    'https://source.unsplash.com/random/800x600?foods',
    'https://source.unsplash.com/random/800x600?foods',
    'https://source.unsplash.com/random/800x600?foods'

    // 'asset/images/plat1.jpg',
    // 'asset/images/plat2.jpg',
    // 'asset/images/plat3.jpg',
  ];

  final List<String> places = [
    'ISSU',
    'YASSA ',
    'DOMADA',
  ];

  List<Widget> generateImageTiles(screenSize) {
    return images
        .map((element) => Stack(
              children: [
                Container(
                  height: 40.h,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(20)),
                ),
                Container(
                  height: 43.h,
                  width: 70.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: NetworkImage(element),
                        fit: BoxFit.cover,
                        // colorFilter: ColorFilter.mode(
                        //     Colors.black54, BlendMode.darken)
                      )),
                ),
              ],
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var imageSliders = generateImageTiles(screenSize);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 2),
        child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Stack(
                  children: [
                    InkWell(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return cartPage();
                      })),
                      child: CarouselSlider(
                        items: imageSliders,
                        options: CarouselOptions(
                            enlargeCenterPage: true,
                            enableInfiniteScroll: false,
                            aspectRatio: 0.9,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 5),
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                                for (int i = 0; i < imageSliders.length; i++) {
                                  if (i == index) {
                                    _isSelected[i] = true;
                                  } else {
                                    _isSelected[i] = false;
                                  }
                                }
                              });
                            }),
                        carouselController: _controller,
                      )
                    ),
                    AspectRatio(
                      aspectRatio: 25 / 8,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.red.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 13, right: 13, top: 8, bottom: 8),
                              child: Text(
                                places[_current],
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontFamily: 'mont',
                                    fontSize: 18.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (Responsive.isMobile(context))
                      AspectRatio(
                          aspectRatio: 0.9,
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 40),
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 8, left: 2),
                                    color: Colors.transparent,
                                    height: 11.h,
                                    width: 62.w,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Note :",
                                            style: TextStyle(
                                                fontFamily: 'mont',
                                                fontSize: 14.sp,
                                                color: white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: Colors.orange,
                                                size: 14.sp,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.orange,
                                                size: 14.sp,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.orange,
                                                size: 14.sp,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.orange,
                                                size: 14.sp,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.white,
                                                size: 14.sp,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ))
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
