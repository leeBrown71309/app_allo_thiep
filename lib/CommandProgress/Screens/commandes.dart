import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:foodorderapp/constants.dart';
import 'package:foodorderapp/help/Style.dart';
import 'package:foodorderapp/panier/panier_section.dart';
import 'package:sizer/sizer.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import 'Résumé.dart';
import 'livraison_address.dart';
import 'mode_paiement.dart';

class Commandes extends StatefulWidget {
  @override
  _CommandesState createState() => _CommandesState();
}

class _CommandesState extends State<Commandes> {
  _buildCard({
    Config config,
    Color backgroundColor = Colors.transparent,
    DecorationImage backgroundImage,
    double height = 152.0,
  }) {
    return Container(
      height: height,
      width: double.infinity,
      child: Card(
        elevation: 12.0,
        shadowColor: Colors.blueGrey.withOpacity(0.7),
        margin: EdgeInsets.only(right: 16.0, left: 16.0, bottom: 16.0),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
        child: WaveWidget(
          config: config,
          backgroundColor: backgroundColor,
          backgroundImage: backgroundImage,
          size: Size(double.infinity, double.infinity),
          waveAmplitude: 0,
        ),
      ),
    );
  }

  MaskFilter _blur;
  final List<MaskFilter> _blurs = [
    null,
    MaskFilter.blur(BlurStyle.normal, 10.0),
    MaskFilter.blur(BlurStyle.inner, 10.0),
    MaskFilter.blur(BlurStyle.outer, 10.0),
    MaskFilter.blur(BlurStyle.solid, 16.0),
  ];
  int _blurIndex = 0;
  MaskFilter _nextBlur() {
    if (_blurIndex == _blurs.length - 1) {
      _blurIndex = 0;
    } else {
      _blurIndex = _blurIndex + 1;
    }
    _blur = _blurs[_blurIndex];
    return _blurs[_blurIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        elevation: 2,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> Resume()));
        },
        label:  Text('Suivant'),
        icon: Icon(Icons.read_more_outlined),
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
          "Validation de la commande",
          style: TextStyle(fontSize: 13.sp, color: black, fontFamily: 'mont'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(top: defaultPadding, bottom: 8),
                child: Stack(
                  children: [
                    _buildCard(
                      backgroundColor: Color(0xfff54d4d),
                      config: CustomConfig(
                        gradients: [
                          [white, Color(0xEEF44336)],
                          [white, Color(0x77E57373)],
                          [
                            Colors.orangeAccent,
                            Color(0xffea6868),
                          ],
                          [
                            Color(0xffd28585),
                            Color(0xffea6868),
                          ]
                        ],
                        durations: [35000, 19440, 10800, 6000],
                        heightPercentages: [0.20, 0.23, 0.25, 0.30],
                        blur: _blur,
                        gradientBegin: Alignment.bottomLeft,
                        gradientEnd: Alignment.topRight,
                      ),
                    ),
                    Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.food_bank_rounded,
                            size: 20.w,
                            color: white,
                          ),
                          Text(
                            "Allo Thieb",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'mont',
                                fontSize: 18.sp),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
            ),
            CommandBody()
          ],
        ),
      ),
    );
  }
}

class CommandBody extends StatefulWidget {
  @override
  _CommandBodyState createState() => _CommandBodyState();
}

class _CommandBodyState extends State<CommandBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

      child: Padding(
        padding: const EdgeInsets.only(left: defaultPadding, right: defaultPadding),
        child: Column(
          children: [
            Livraison_Address(),
            ModePaiement(),
          ],
        ),
      ),
    );
  }
}
