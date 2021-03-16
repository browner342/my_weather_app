import 'package:flutter/material.dart';
import 'package:my_weather_app/domain/weather/weather_components/wind.dart';

class WindComponent extends StatelessWidget {
  WindComponent({this.wind});
  final Wind wind;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Wind'),
          //TODO: change from hardCode
          Text('Direction: Northeast'),
          Text('${wind.speed} km/h')
        ],
      ),
    );
  }
}
