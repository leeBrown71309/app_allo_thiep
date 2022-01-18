import 'package:card_settings/card_settings.dart';
import 'package:card_settings/widgets/card_settings_panel.dart';
import 'package:card_settings/widgets/card_settings_widget.dart';
import 'package:card_settings/widgets/information_fields/card_settings_header.dart';
import 'package:card_settings/widgets/text_fields/card_settings_text.dart';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodorderapp/help/Style.dart';
import 'package:sizer/sizer.dart';

import '../../constants.dart';
import 'address_dropped_list.dart';

typedef LabelledValueChanged<T, U> = void Function(T label, U value);

class EditAdress extends StatefulWidget {
  @override
  _EditAdressState createState() => _EditAdressState();
}

class _EditAdressState extends State<EditAdress> {
  String nom;
  String prenom;
  int tel;
  String zone;
  String addr;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _adrTextEditingController =
      TextEditingController();

  final List<SelectedListItem> _listOfAdr = [
    SelectedListItem(false, kFass),
    SelectedListItem(false, kColobane),
    SelectedListItem(false, kPetersen),
    SelectedListItem(false, kUcad),
    SelectedListItem(false, kPoint_E),
    SelectedListItem(false, kFan),
    SelectedListItem(false, kSahm),
    SelectedListItem(false, kMedina),
    SelectedListItem(false, KKeurMassar),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                // Navigator.push(context, MaterialPageRoute(builder:
                //     (context) {
                //   return Shop();
                // }));
                Navigator.pop(context);
              },
            ),
          ),
        ),
        title: Text(
          "Adresses",
          style: TextStyle(fontSize: 13.sp, color: black, fontFamily: 'mont'),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Wrap(
          children: [
            CardSettings.sectioned(
                children: [
              //personal info
              CardSettingsSection(
                header: CardSettingsHeader(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xfff54d4d),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5)
                      )
                    ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Text('Infos client',
                                style: TextStyle(
                                    fontSize: 20,
                                  color: white,
                                  fontFamily: "mont"
                                )
                            ),
                          ],
                        ),
                      )),
                ),
                children: <CardSettingsWidget>[
                  CardSettingsText(
                    requiredIndicator:
                        Text('*', style: TextStyle(color: Colors.red)),
                    keyboardType: TextInputType.emailAddress,
                    label: 'Nom',
                    hintText: 'Nom',
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return 'Veillez saisir votre nom';
                    },
                    onSaved: (value) => nom = value,
                  ),
                  CardSettingsText(
                    requiredIndicator:
                        Text('*', style: TextStyle(color: Colors.red)),
                    keyboardType: TextInputType.emailAddress,
                    label: 'Prénom',
                    hintText: "Prénom",
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return 'Veillez saisir votre prénom';
                    },
                    onSaved: (value) => prenom = value,
                  ),
                  CardSettingsText(
                    requiredIndicator:
                        Text('*', style: TextStyle(color: Colors.red)),
                    keyboardType: TextInputType.number,
                    label: 'Téléphone',
                    hintText: "ex: 77 xxxxxxx",
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return 'Veillez saisir votre numéro';
                    },
                    onSaved: (value) => tel = value as int,
                  ),
                  // localisation info**********************************
                ],
              ),

              // localisation info**********************************
              CardSettingsSection(
                header: CardSettingsHeader(
                  child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xfff54d4d),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5)
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Text('Localisation',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: white,
                                    fontFamily: "mont"
                                )
                            ),
                          ],
                        ),
                      )),
                ),
                children: <CardSettingsWidget>[
                  CardSettingsText(
                    requiredIndicator:
                        Text(' *', style: TextStyle(color: Colors.red)),
                    keyboardType: TextInputType.emailAddress,
                    label: 'Quartier',
                    hintText: "ex: Médina",
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return 'Entrer votre quartier';
                    },
                    onSaved: (value) => zone = value,
                  ),
                ],
              ),
            ]),

            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Container(
                // height: 9.h,
                decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 4),
                          blurRadius: 2)
                    ]),
                child: SafeArea(
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Text(
                              "Adresse",
                              style: TextStyle(
                                  fontSize: 12.sp, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Text(
                            " *",
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.red,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Container(
                        width: 72.w,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: AppTextField(
                            textEditingController: _adrTextEditingController,
                            hint: "adresse",
                            isCitySelected: true,
                            cities: _listOfAdr,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            CardSettings(
              children: [
                CardSettingsSection(
                  children: [
                    CardSettingsButton(
                        onPressed: (){},
                      label: "Valider",
                      backgroundColor: greenBtn,
                      textColor: white,
                        )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
