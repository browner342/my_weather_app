import 'package:flutter/material.dart';
import 'package:my_weather_app/domain/cites_weather.dart';
import 'package:my_weather_app/presentation/data/city_data.dart';
import 'package:my_weather_app/presentation/screens/main_screen/components/card_flip/front_of_card/front_card_content.dart';
import 'package:provider/provider.dart';

class FrontCard extends StatelessWidget {
  FrontCard({this.positionedNumber});

  final int positionedNumber;

  @override
  Widget build(BuildContext context) {
    final cityName =
        Provider.of<CityData>(context).showCities[positionedNumber];

    if (Provider.of<CitiesWeather>(context).citiesWeather[cityName] != null) {
      return Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20.0),
          color: Provider.of<CitiesWeather>(context)
              .citiesWeather[cityName]
              .weatherNow
              .color,
        ),
        child: Center(
            child: FrontCardContent(
          cityName: cityName,
          positionedNumber: positionedNumber,
        )),
      );
    } else {
      return Container(
        child: Text('Front'),
      );
    }
  }
}
