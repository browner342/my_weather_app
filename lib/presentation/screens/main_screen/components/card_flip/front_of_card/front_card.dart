import 'package:flutter/material.dart';
import 'package:my_weather_app/presentation/data/city_data.dart';
import 'package:my_weather_app/presentation/screens/main_screen/components/card_flip/front_of_card/front_card_content.dart';
import 'package:provider/provider.dart';

class FrontCard extends StatelessWidget {
  FrontCard({this.positionedNumber});

  final int positionedNumber;

  @override
  Widget build(BuildContext context) {
    final cityData = Provider.of<CityData>(context);

    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20.0),
        color: Colors
            .yellowAccent.shade400, //TODO: change for provider weatherData
      ),
      child: Center(
          child: FrontCardContent(
        cityName: cityData.showCities[positionedNumber],
      )),
    );
  }
}
