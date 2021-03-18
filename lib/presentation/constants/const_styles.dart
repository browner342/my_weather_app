import 'package:flutter/material.dart';

const kCityTileHeight = 80.0;
const kBackgroundColor = Color(0xFFE4E4E4);
const kButtonBackgroundColor = Colors.white;
const kButtonInsideColor = Color(0xFF7B7575);
const kBackArrowColor = Color(0xFF7B7575);

const kCityCardsStyle = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(20)),
  color: Colors.white,
);

const kCityTileStyle = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(20)),
  color: kButtonBackgroundColor,
);

const kCityTileTextStyle = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.w400,
  color: kButtonInsideColor,
);

const kTitleStyle = TextStyle(
  fontSize: 32.0,
  fontWeight: FontWeight.bold,
);

const kTextFieldDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  hintText: 'Enter City Name',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide.none,
  ),
);

const kButtonTextStyle = TextStyle(
  color: kButtonInsideColor,
);

const kButtonStyle = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(20)),
  color: kButtonBackgroundColor,
);
const kBackArrowSize = 35.0;
