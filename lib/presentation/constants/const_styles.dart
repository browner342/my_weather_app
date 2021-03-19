import 'package:flutter/material.dart';

const kCityTileHeight = 80.0;
const kBackgroundColor = Color(0xFFE4E4E4);
const kButtonBackgroundColor = Colors.white;
const kButtonInsideColor = Color(0xFF7B7575);
const kBackArrowColor = Color(0xFF7B7575);
const kTextColor = Color(0xFF37474f);

const kCityCardsStyle = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(20)),
  color: Colors.white,
);

const kCityTileStyle = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(20)),
  color: kButtonBackgroundColor,
  boxShadow: [
    BoxShadow(
      color: Colors.grey,
      offset: const Offset(2.0, 2.0),
      blurRadius: 1.0,
      spreadRadius: 0.2,
    ),
  ],
);

const kCityTileTextStyle = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.w900,
  color: kTextColor,
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

kMainScreenCardStyle(var colors) {
  return BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: colors,
    ),
    shape: BoxShape.rectangle,
    borderRadius: BorderRadius.circular(20.0),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
  );
}
