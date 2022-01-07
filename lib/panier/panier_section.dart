import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodorderapp/CommandProgress/Screens/commandes.dart';
import 'package:foodorderapp/CommandProgress/progress.dart';
import 'package:foodorderapp/boissonSection/boisson_section.dart';
import 'package:foodorderapp/help/Style.dart';
import 'package:foodorderapp/help/extensions.dart';
import 'package:foodorderapp/help/responsive.dart';
import 'package:foodorderapp/menuJour/CartPage.dart';

import '../constants.dart';

class Shop extends StatefulWidget {
  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) => Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          elevation: 2,
          onPressed: () {
            // Navigator.pushReplacementNamed(context, '/CommandeProgress');
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Commandes();
            }));
          },
          label: Text('Valider'),
          icon: Icon(Icons.check),
          backgroundColor: Color(0xfff54d4d),
        ),
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.5,
            shadowColor: Colors.blueAccent,
            title: Text(
              "Panier",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            leading: IconButton(
              icon: Icon(
                EvaIcons.arrowLeft,
                size: 30,
                color: black,
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/HomeScreen');
              },
            )),
        body: ShopBody(),
      );
}

class ShopBody extends StatefulWidget {
  @override
  _ShopBodyState createState() => _ShopBodyState();
}

class _ShopBodyState extends State<ShopBody> {
  int quantite = 0;

  Widget placesWidget(String img, String name) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => cartPage()));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Stack(
                        children: [
                          Ink.image(
                            image: AssetImage("$img"),
                            height: Responsive.isMobile(context) ? 130 : 300,
                            width: Responsive.isMobile(context) ? 120 : 300,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "$name",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        // if favorited... colors.red else colors.grey

                        SizedBox(
                          height: 10,
                        ),
                        Row(
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
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "2000 CFA",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Quantité ",
                          style: TextStyle(fontSize: 14, color: black),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border:
                                Border.all(color: Colors.red.withOpacity(0.4)),
                          ),
                          child: Text(
                            "$quantite",
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, bottom: 5, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.delete_sweep,
                      size: 30,
                      color: SideMenuColor1,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      EvaIcons.heart,
                      size: 27,
                      color: SideMenuColor1,
                    ),
                  ),
                  Row(
                    children: [
                      TextButton.icon(
                          onPressed: () {
                            setState(() {
                              if (quantite == 0) {
                                quantite == 0;
                              } else {
                                quantite -= 1;
                              }
                            });
                          },
                          icon: Icon(
                            Icons.remove,
                            size: 25,
                            color: SideMenuColor1,
                          ),
                          label: Text(
                            "",
                            style: TextStyle(color: SideMenuColor1),
                          )),
                      SizedBox(
                        width: 20,
                      ),
                      TextButton.icon(
                          onPressed: () {
                            setState(() {
                              quantite += 1;
                            });
                          },
                          icon: Icon(
                            Icons.add,
                            size: 25,
                            color: greenBtn,
                          ),
                          label: Text(
                            "",
                            style: TextStyle(color: SideMenuColor1),
                          )),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ).addNeumorphism(
        blurRadius: 15,
        borderRadius: 15,
        offset: Offset(5, 5),
        topShadowColor: Colors.white60,
        bottomShadowColor: Color(0xFF234395).withOpacity(0.5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              placesWidget("asset/images/plat6.jpg", "Row Platter"),
              SizedBox(
                height: 20,
              ),
              placesWidget("asset/images/plat7.jpg", "Sushi Platter"),
              SizedBox(
                height: 20,
              ),
              placesWidget("asset/images/plat2.jpg", "Sushi Platter"),
              SizedBox(
                height: 30,
              ),
              Divider(
                color: Colors.blueGrey,
                thickness: 0.3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total (3 éléments)",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: black,
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "+Taxes",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.grey),
                  ),
                  Text(
                    "\$2.1",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.grey),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "+Delivery Charges",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.grey),
                  ),
                  Text(
                    "\$3.1",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.grey),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Discounts",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.grey),
                  ),
                  Text(
                    "-\$6.1",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.grey),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Prix Total",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "\$102",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.orange),
                  )
                ],
              ),
              SizedBox(
                height: 70,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
