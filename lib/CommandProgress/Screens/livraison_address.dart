import 'package:flutter/material.dart';
import 'package:foodorderapp/help/Style.dart';
import 'package:foodorderapp/help/custom_text.dart';
import 'package:foodorderapp/help/extensions.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:sizer/sizer.dart';

import 'edit.dart';

class Livraison_Address extends StatefulWidget {
  @override
  State<Livraison_Address> createState() => _Livraison_AddressState();
}

class _Livraison_AddressState extends State<Livraison_Address> {
  List<String> _checked = [];

  Widget ChekBox() {
    return Column(
      children: [
        CheckboxGroup(
          labels: <String>[
            "Reservation uniquement",
            "Reservation et livraison",
          ],
          labelStyle: TextStyle(
              fontSize: 12.sp, fontFamily: "mont", fontWeight: FontWeight.w200),
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Type de paiement",
              style: TextStyle(
                  fontSize: 13.sp,
                  fontFamily: "mont",
                  fontWeight: FontWeight.w700),
            )
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white, 
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
            // BoxShadow(
            //     color: Colors.blueGrey, offset: Offset(0, 3), blurRadius: 4)
          ]),
          child: Column(
            children: [
              ChekBox(),
              SizedBox(
                height: 10,
              ),
              // Divider(
              //   color: Colors.grey.withOpacity(0.3),
              // ),
            ],
          ),
        ).addNeumorphism(
          blurRadius: 20,
          borderRadius: 25,
          offset: Offset(5, 5),
          topShadowColor: Colors.white60,
          bottomShadowColor:
          Color(0xFF234395).withOpacity(0.4),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Details de l'adresse",
              style: TextStyle(
                  fontSize: 13.sp,
                  fontFamily: "mont",
                  fontWeight: FontWeight.w700),
            ),
            TextButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:
                      (context) {
                    return EditAdress();
                  }));
                },
                icon: Icon(
                  Icons.edit,
                  color: SideMenuColor1,
                ),
                label: CustomText(
                  text: " Modifier",
                  color: SideMenuColor1,
                  size: 15,
                ))
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
            // BoxShadow(
            //     color: Colors.blueGrey, offset: Offset(0, 3), blurRadius: 4)
          ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 5, bottom: 5),
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
                    padding: const EdgeInsets.only(left: 8, top: 5, bottom: 5),
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
                    padding: const EdgeInsets.only(left: 8, top: 5, bottom: 5),
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
                    padding: const EdgeInsets.only(left: 8, top: 5, bottom: 5),
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
          bottomShadowColor:
          Color(0xFF234395).withOpacity(0.4),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
