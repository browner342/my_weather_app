import 'package:flutter/material.dart';
import 'package:my_weather_app/domain/cites_weather.dart';
import 'package:my_weather_app/presentation/data/city_data.dart';
import 'package:my_weather_app/presentation/screens/main_screen/components/card_flip/back_of_card/back_card_content.dart';
import 'package:provider/provider.dart';
import 'package:my_weather_app/presentation/screens/main_screen/components/card_flip/card.dart';

class BackCard extends StatelessWidget {
  BackCard({this.positionedNumber});

  final int positionedNumber;

  @override
  Widget build(BuildContext context) {
    final String cityName =
        Provider.of<CityData>(context).showCities[positionedNumber];
    return CardComponent(
      positionedNumber: positionedNumber,
      child: BackCardContent(
        cityName: cityName,
      ),
    );
  }
}
