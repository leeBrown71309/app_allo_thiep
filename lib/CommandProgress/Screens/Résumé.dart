import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodorderapp/constants.dart';
import 'package:foodorderapp/help/Style.dart';
import 'package:foodorderapp/help/custom_text.dart';
import 'package:foodorderapp/help/extensions.dart';
import 'package:ndialog/ndialog.dart';
import 'package:sizer/sizer.dart';



class Resume extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget CardPaie(String nom, String img) {
      return Column(
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            color: Colors.green,
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Ink.image(
                      image: AssetImage(img),
                      fit: BoxFit.cover,
                      height: 12.h,
                      width: 25.w,
                      child: InkWell(
                        onTap: () {},
                        splashColor: Colors.blue.withAlpha(30),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            nom,
            style: TextStyle(
                fontSize: 12.sp,
                fontFamily: 'mont',
                fontWeight: FontWeight.w100),
          )
        ],
      );
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        elevation: 2,
        onPressed: () {
          NAlertDialog(
            title: Row(
              children: [
                Icon(
                  Icons.warning_amber_rounded,
                  color: Color(0xEEF44336),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Attention",
                  style: TextStyle(fontFamily: "mont"),
                )
              ],
            ),
            content: Text(
              "Voulez-vous vraiment valider cette commande ?",
              style: TextStyle(fontFamily: "mont"),
            ),
            actions: [
              RaisedButton(
                color: Color(0xEEF44336),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Non",
                  style: TextStyle(fontFamily: "mont", color: white),
                ),
              ),
              RaisedButton(
                color: white,
                onPressed: () {
                  Globals().isValidated = true;
                  Navigator.pushReplacementNamed(context, '/CommandeValidé');
                },
                child: Text(
                  "Oui",
                  style: TextStyle(fontFamily: "mont"),
                ),
              ),
            ],
            blur: 2,
          ).show(context, transitionType: DialogTransitionType.Bubble);
        },
        label: Text('Valider'),
        icon: Icon(Icons.check),
        backgroundColor: Color(0xfff54d4d),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Container(
            height: 40,
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
        title: Text(
          "Résumé",
          style: TextStyle(fontSize: 13.sp, color: black, fontFamily: 'mont'),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              left: defaultPadding, right: defaultPadding),
          child: Container(
            padding: EdgeInsets.only(top: 15),
            child: Column(
              children: [
                Image.asset(
                  "asset/images/resume-removebg.png",
                  height: 22.h,
                ),
                //Details commande
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Votre commande",
                      style: TextStyle(
                          color: black,
                          fontFamily: 'mont',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Wrap(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total (3 éléments)",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18),
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
                              height: 15,
                            ),
                            Divider(
                              color: Colors.blueGrey,
                              thickness: 0.3,
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
                          ],
                        ),
                      )
                    ],
                  ),
                ).addNeumorphism(
                  blurRadius: 20,
                  borderRadius: 25,
                  offset: Offset(5, 5),
                  topShadowColor: Colors.white60,
                  bottomShadowColor: Color(0xFF234395).withOpacity(0.4),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Adresse",
                      style: TextStyle(
                          fontSize: 13.sp,
                          fontFamily: "mont",
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                //adresse
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8, top: 5, bottom: 5),
                            child: Text(
                              "NomUser",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontFamily: "mont",
                                  fontWeight: FontWeight.w200),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8, top: 5, bottom: 5),
                            child: Text(
                              "Quartier",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontFamily: "mont",
                                  fontWeight: FontWeight.w200),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8, top: 5, bottom: 5),
                            child: Text(
                              "Adresse",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontFamily: "mont",
                                  fontWeight: FontWeight.w200),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8, top: 5, bottom: 5),
                            child: Text(
                              "telephone",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontFamily: "mont",
                                  fontWeight: FontWeight.w200),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ).addNeumorphism(
                  blurRadius: 20,
                  borderRadius: 25,
                  offset: Offset(5, 5),
                  topShadowColor: Colors.white60,
                  bottomShadowColor: Color(0xFF234395).withOpacity(0.4),
                ),
                //type livraison
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Type de commande",
                      style: TextStyle(
                          fontSize: 13.sp,
                          fontFamily: "mont",
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 8.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 8,
                              top: 18,
                            ),
                            child: Text(
                              "Type de commande choisi",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontFamily: "mont",
                                  fontWeight: FontWeight.w200),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ).addNeumorphism(
                  blurRadius: 20,
                  borderRadius: 25,
                  offset: Offset(5, 5),
                  topShadowColor: Colors.white60,
                  bottomShadowColor: Color(0xFF234395).withOpacity(0.4),
                ),
                //Mode paiement
                SizedBox(
                  height: 15,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CardPaie(
                        "Orange Money", "asset/images/orange_money_black.png"),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
