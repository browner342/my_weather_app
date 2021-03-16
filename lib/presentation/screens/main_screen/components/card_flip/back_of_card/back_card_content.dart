import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_weather_app/domain/cites_weather.dart';
import 'package:my_weather_app/presentation/constants/const_styles.dart';
import 'package:my_weather_app/presentation/screens/main_screen/components/card_flip/back_of_card/content_components/horizontal_divider.dart';
import 'package:my_weather_app/presentation/screens/main_screen/components/card_flip/back_of_card/content_components/hourly_component.dart';
import 'package:my_weather_app/presentation/screens/main_screen/components/card_flip/back_of_card/content_components/sun_set_rise.dart';
import 'package:my_weather_app/presentation/screens/main_screen/components/card_flip/back_of_card/content_components/weekly_component.dart';
import 'package:my_weather_app/presentation/screens/main_screen/components/card_flip/back_of_card/content_components/wind.dart';
import 'package:provider/provider.dart';

class BackCardContent extends StatelessWidget {
  BackCardContent({this.cityName});
  final String cityName;

  @override
  Widget build(BuildContext context) {
    final weatherHourly = Provider.of<CitiesWeather>(context)
        .citiesWeather[cityName]
        .weatherHourly;
    final weatherWeekly = Provider.of<CitiesWeather>(context)
        .citiesWeather[cityName]
        .weatherWeekly;
    final wind =
        Provider.of<CitiesWeather>(context).citiesWeather[cityName].wind;
    final sunSetRise =
        Provider.of<CitiesWeather>(context).citiesWeather[cityName].sunSetRise;

    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 10.0),
            child: Text(
              cityName,
              style: TextStyle(fontSize: 32.0),
              textAlign: TextAlign.center,
            ),
          ),
          HorizontalDivider(),
          Hourly(
            weatherHourly: weatherHourly,
          ),
          HorizontalDivider(),
          Weekly(
            weatherWeekly: weatherWeekly,
          ),
          Expanded(
            child: Row(
              children: [
                SunSetRiseComponent(
                  sunSetRise: sunSetRise,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: VerticalDivider(
                    color: Colors.black45,
                  ),
                ),
                WindComponent(wind: wind),
              ],
            ),
          )
        ],
      ),
    );
  }
}
