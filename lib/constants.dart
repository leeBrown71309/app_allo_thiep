import 'dart:ui';
import 'package:flutter/material.dart';


const defaultPadding = 16.0;
String host = "https://alothiep-food-app.herokuapp.com/";
// String apiJus_get = host + "api/Jus";
String apiJus_get = "http://localhost:8000/api/Jus";

// Cities
const kFass = 'Fass';
const kColobane = 'Colobane';
const kPetersen = 'Petersen';
const kUcad = 'Ucad';
const kPoint_E = 'Point_E';
const kFan = 'Fan';
const kSahm = 'Sahm';
const kMedina = 'Médina';
const KKeurMassar = 'Keur-Massar';


// Register Page
const kRegister = 'Register';
const kFullName = 'Full Name';
const kEnterYourName = 'Enter your name';
const kEmail = 'Email';
const kEnterYourEmail = 'Enter your email';
const kPhoneNumber = 'Phone Number';
const kEnterYourPhoneNumber = 'Enter your phone number';
const kCity = 'City';
const kChooseYourCity = 'Choose your city';
const kPassword = 'Password';
const kAddYourPassword = 'Add your password';
const kREGISTER = 'REGISTER';

// Drop Down
const kDone = 'Fini';
const kSearch = 'Chercher...';
const kCities = 'Adresse';



class Location {
  final String image;


  Location({

    this.image
  });
}

class Globals {
  // Constructor boilerplate
  static final Globals _instance = Globals._();
  factory Globals() => _instance;
  Globals._();

  // Global variable
  bool isValidated = false;
}