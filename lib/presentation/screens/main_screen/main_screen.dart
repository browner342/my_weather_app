import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_weather_app/data/networking/internet_connection.dart';
import 'package:my_weather_app/domain/cites_weather.dart';
import 'package:my_weather_app/presentation/components/failures.dart';
import 'package:my_weather_app/presentation/constants/const_names.dart';
import 'package:my_weather_app/presentation/constants/const_styles.dart';
import 'package:my_weather_app/presentation/data/city_data.dart';
import 'package:provider/provider.dart';

import 'components/city_cards_widget.dart';
import 'components/menage_city_button.dart';

class MainScreen extends StatelessWidget {
  static const String id = kMainScreenId;

  @override
  Widget build(BuildContext context) {
    final cityData = Provider.of<CityData>(context, listen: false);
    final citiesWeather = Provider.of<CitiesWeather>(context, listen: false);

    return RefreshIndicator(
      onRefresh: () async {
        if (await InternetConnection().isConnected()) {
          List<String> cityNames = cityData.showCities;
          await citiesWeather.setCityWeather(cityNames);
        } else {
          Failures().noInternetConnection(context);
        }
      },
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: MenageCityButton(),
        body: CityCards(
          amountOfCards: Provider.of<CityData>(context).amountOfCities,
        ),
      ),
    );
  }
}
