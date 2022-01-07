import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodorderapp/help/Style.dart';
import 'package:foodorderapp/help/custom_text.dart';
import 'package:foodorderapp/help/extensions.dart';
import 'package:foodorderapp/help/responsive.dart';
import 'package:sizer/sizer.dart';


class DiapoPlats extends StatefulWidget {

  @override
  _DiapoPlatsState createState() => _DiapoPlatsState();
}

class _DiapoPlatsState extends State<DiapoPlats> {



  @override
  Widget build(BuildContext context) {
    return Container(
      child: SlidePage(),
    );
  }
}



class SlidePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DestinationCarousel();

  }
}

class DestinationCarousel extends StatefulWidget {
  @override
  _DestinationCarouselState createState() => _DestinationCarouselState();
}

class _DestinationCarouselState extends State<DestinationCarousel> {
  final CarouselController _controller = CarouselController();

  List _isSelected = [true, false, false, false, false, false, false];

  int _current = 0;

  final List<String> images = [
    'asset/images/plat1.jpg',
    'asset/images/plat2.jpg',
    'asset/images/plat3.jpg',
    'asset/images/plat4.jpg',
    'asset/images/plat6.jpg',
    'asset/images/plat5.jpg',
  ];

  final List<String> places = [
    'ISSEU',
    'YASSA ',
    'DOMADA',
    'MAFE',
    'THIEB',
    'CALDOU',
  ];

  List<Widget> generateImageTiles(screenSize) {
    return images
        .map(
          (element) => ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Image.asset(
          element,
          fit: BoxFit.cover,
        ),
      ),
    )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var imageSliders = generateImageTiles(screenSize);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: TextSpan(
                    text: " Catalogue",
                    style: TextStyle(
                      color: black,
                      fontFamily: 'mont',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700
                    ),
                  )
              ),
              SizedBox(height: 10,),
              Text(
                "Vous trouverez ici les meilleurs spécialités de la cuisine sénégalaise.",
                style: TextStyle(
                    color: black,
                    fontFamily: 'mont',
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500
                ),
                overflow: TextOverflow.clip,
                textAlign: TextAlign.justify,
              )
            ],
          )
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Container(
                padding: const EdgeInsets.only(top: 30),
                color: Colors.white,
                child: Column(
                  children: [
                    Stack(
                        children: [
                          CarouselSlider(
                            items: imageSliders,
                            options: CarouselOptions(
                                enlargeCenterPage: true,
                                aspectRatio: 1.8,
                                autoPlay: true,
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
                          ),
                          AspectRatio(
                            aspectRatio: 18 / 8,
                            child: Center(
                              child: Text(
                                places[_current],
                                style: TextStyle(
                                  letterSpacing: 8,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'mont',
                                  fontSize: screenSize.width / 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Responsive.isMobile(context)
                              ? AspectRatio(
                            aspectRatio: 1.6,
                            child: Center(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: screenSize.width / 4,
                                      right: screenSize.height / 8),
                                  child: Card(
                                    elevation: 0,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 0, bottom: 0),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: [
                                          for (int i = 0; i < places.length; i++)
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    top: screenSize.height / 80,
                                                    bottom: screenSize.height / 80,
                                                  ),
                                                  child: Center(
                                                    child: Text(".",
                                                    style: TextStyle(
                                                      fontSize: 30
                                                    ),),
                                                  ),
                                                ),
                                                Visibility(
                                                    visible: _isSelected[i],
                                                    child: Container(
                                                      height: 5,
                                                      width: screenSize.width / 40,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(5),
                                                          color: red),
                                                    ))
                                              ],
                                            ),
                                        ],
                                      ),
                                    ),
                                  ).addNeumorphism(
                                    blurRadius: 15,
                                    borderRadius: 15,
                                    offset: Offset(5, 5),
                                    topShadowColor: Colors.white60,
                                    bottomShadowColor:
                                    Color(0xFF234395).withOpacity(0.2),
                                  ),
                                ),
                              ),
                            ),
                          )
                              : AspectRatio(
                            aspectRatio: 17 / 8,
                            child: Center(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: screenSize.width / 8,
                                      right: screenSize.width / 8),
                                  child: Card(
                                    elevation: 5,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        top: screenSize.height / 50,
                                        bottom: screenSize.height / 50,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: [
                                          for (int i = 0; i < places.length; i++)
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    top: screenSize.height / 80,
                                                    bottom: screenSize.height / 80,
                                                  ),
                                                  child: Text(places[i],
                                                    style: TextStyle(
                                                      fontSize: 20
                                                    ),),
                                                ),
                                                Visibility(
                                                    visible: _isSelected[i],
                                                    child: Container(
                                                      height: 5,
                                                      width:
                                                      screenSize.width / 40,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(5),
                                                          color: Colors.red),
                                                    ))
                                              ],
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                  ],
                )
            ),
          ),
        ),
      ],
    );
  }
}

//-------------------------------------------------------------

/*
Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Liste des plats",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            CarouselSlider(
              items: imgList
                  .map((item) => Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Center(
                  child: Image.asset(
                    item,
                    fit: BoxFit.cover,
                    width: 1000,
                  ),
                ),
              ))
                  .toList(),
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
              ),
            ),

          ],
        ),
      );
 */