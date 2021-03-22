import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_weather_app/domain/cites_weather.dart';
import 'package:my_weather_app/presentation/constants/const_styles.dart';
import 'package:provider/provider.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

class FrontCardContent extends StatelessWidget {
  FrontCardContent({this.cityName});
  final String cityName;

  @override
  Widget build(BuildContext context) {
    final actual =
        Provider.of<CitiesWeather>(context).citiesWeather[cityName].weatherNow;

    return Container(
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  cityName,
                  style: kTitleStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(
                  actual.weatherIcon,
                  size: 55.0,
                ),
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  actual.condition.capitalize(),
                  style: TextStyle(fontSize: 24.0),
                ),
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  '${actual.temperatureDay.toString()}°C',
                  style: TextStyle(fontSize: 24.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
