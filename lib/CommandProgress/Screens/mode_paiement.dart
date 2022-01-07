import 'package:flutter/material.dart';
import 'package:foodorderapp/help/Style.dart';
import 'package:foodorderapp/help/custom_text.dart';
import 'package:foodorderapp/help/extensions.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:sizer/sizer.dart';

class ModePaiement extends StatefulWidget {
  @override
  State<ModePaiement> createState() => _ModePaiementState();
}

class _ModePaiementState extends State<ModePaiement> {
  List<String> _checked = [];
  bool _isSelected = false;

  Widget ChekBox() {
    return Column(
      children: [
        CheckboxGroup(
          labels: <String>[
            "Paiement à la livraison",
          ],
          checked: _checked,
          onChange: (bool isChecked, String label, int index) =>
              print("isChecked: $isChecked   label: $label  index: $index"),
          onSelected: (List selected) => setState(() {
            if (selected.length > 1) {
              selected.removeAt(0);
              print('selected length  ${selected.length}');
            } else {
              print("only one");
            }
            _checked = selected;
          }),
        ),
      ],
    );
  }

  // Widget CardPaie(String nom, String img){
  //   return Column(
  //     children: [
  //       Card(
  //         clipBehavior: Clip.antiAlias,
  //         color: Colors.grey.shade100,
  //         elevation: 10,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(20),
  //         ),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Stack(
  //               alignment: Alignment.center,
  //               children: <Widget>[
  //                 Ink.image(
  //                   image: AssetImage(
  //                       img
  //                   ),
  //                   fit: BoxFit.cover,
  //                   height: 12.h,
  //                   width: 25.w,
  //                   child: InkWell(
  //                     onTap: () {
  //                       _isSelected = true;
  //                     },
  //                     splashColor:
  //                     Colors.blue.withAlpha(30),
  //                   ),
  //                 ),
  //
  //               ],
  //             ),
  //
  //           ],
  //         ),
  //       ),
  //       SizedBox(height: 10,),
  //       Text(nom,
  //         style: TextStyle(
  //             fontSize: 12.sp,
  //             fontFamily: 'mont',
  //             fontWeight: FontWeight.w100
  //         ),)
  //     ],
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Mode de paiement",
                  style: TextStyle(
                      fontSize: 13.sp,
                      fontFamily: "mont",
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CardPaie(
                        nom: "À la livraison",
                        img: "asset/images/give_money.jpg"),
                    CardPaie(
                        nom: "Orange Money",
                        img: "asset/images/orange_money_black.png"),
                    CardPaie(nom: "Wave", img: "asset/images/wave.png"),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 65,
            ),
          ],
        ),
      ),
    );
  }
}

class CardPaie extends StatefulWidget {
  const CardPaie({Key key, this.nom, this.img}) : super(key: key);
  final String nom;
  final String img;

  @override
  _CardPaieState createState() => _CardPaieState();
}

class _CardPaieState extends State<CardPaie> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          clipBehavior: Clip.antiAlias,
          color: Colors.grey.shade100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      setState(() {
                        // isChecked = true;
                      });
                      // isChecked = false;
                    },

                    splashColor: Colors.blue.withAlpha(30),
                    child: Ink.image(
                      image: AssetImage(widget.img),
                      fit: BoxFit.cover,
                      height: 12.h,
                      width: 25.w,
                      // child: isChecked == true ?  Icon(
                      //   Icons.add,
                      //   size: 30,
                      //   color: blue,
                      // ) : null
                    ),
                  )
                ],
              ),
            ],
          ),
        ).addNeumorphism(
          blurRadius: 20,
          borderRadius: 25,
          offset: Offset(5, 5),
          topShadowColor: Colors.white60,
          bottomShadowColor:
          Color(0xFF234395).withOpacity(0.5),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          widget.nom,
          style: TextStyle(
              fontSize: 12.sp, fontFamily: 'mont', fontWeight: FontWeight.w100),
        )
      ],
    );
  }
}
