import 'package:flutter/material.dart';
import 'package:my_weather_app/domain/constants/constants.dart';
import 'package:my_weather_app/domain/weather/weather_components/weather_hourly.dart';

class Hourly extends StatelessWidget {
  Hourly({this.weatherHourly});
  final WeatherHourly weatherHourly;

  List<Widget> hourlyComponents(WeatherHourly weatherHourly) {
    List<Widget> list = [];

    for (int i = 0; i < kAmoutHourlyComponents; i++) {
      list.add(
        HourlyComponent(
          hour: DateTime.now().add(Duration(hours: i)).hour,
          icon: weatherHourly.weatherIcon[i],
          temp: weatherHourly.temperature[i],
        ),
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: hourlyComponents(weatherHourly),
      ),
    );
  }
}

class HourlyComponent extends StatelessWidget {
  HourlyComponent({this.hour, this.icon, this.temp});
  final hour;
  final icon;
  final temp;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(hour.toString() + ':00'),
          SizedBox(
            height: 10.0,
          ),
          Icon(icon),
          SizedBox(
            height: 10.0,
          ),
          Text(temp.toString()),
        ],
      ),
    );
  }
}
