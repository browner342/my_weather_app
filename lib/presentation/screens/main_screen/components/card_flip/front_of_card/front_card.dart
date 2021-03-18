import 'package:flutter/material.dart';
import 'package:my_weather_app/presentation/data/city_data.dart';
import 'package:my_weather_app/presentation/screens/main_screen/components/card_flip/card.dart';
import 'package:my_weather_app/presentation/screens/main_screen/components/card_flip/front_of_card/front_card_content.dart';
import 'package:provider/provider.dart';

class FrontCard extends StatelessWidget {
  FrontCard({this.positionedNumber});

  final int positionedNumber;

  @override
  Widget build(BuildContext context) {
    final String cityName =
        Provider.of<CityData>(context).showCities[positionedNumber];
    return CardComponent(
      positionedNumber: positionedNumber,
      child: FrontCardContent(
        cityName: cityName,
      ),
    );
  }
}
