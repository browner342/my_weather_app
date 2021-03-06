import 'package:flutter/material.dart';
import 'package:my_weather_app/domain/cites_weather.dart';
import 'package:my_weather_app/presentation/constants/const_styles.dart';
import 'package:my_weather_app/presentation/data/city_data.dart';
import 'package:provider/provider.dart';

class CardComponent extends StatelessWidget {
  CardComponent({this.positionedNumber, this.child});
  final int positionedNumber;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final cityName =
        Provider.of<CityData>(context).showCities[positionedNumber];
    final List<Color> colors = Provider.of<CitiesWeather>(context)
        .citiesWeather[cityName]
        .weatherNow
        .colors;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Container(
        decoration: kMainScreenCardStyle(colors),
        child: Center(child: child),
      ),
    );
  }
}
