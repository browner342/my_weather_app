import 'package:flutter/material.dart';
import 'package:my_weather_app/presentation/constants/const_styles.dart';

class TileItSelf extends StatelessWidget {
  TileItSelf({this.cityName});
  final String cityName;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: kCityTileStyle,
      child: Center(
        child: Text(
          cityName,
          style: kCityTileTextStyle,
        ),
      ),
    );
  }
}
