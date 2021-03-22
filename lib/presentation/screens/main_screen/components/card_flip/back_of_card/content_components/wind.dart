import 'dart:ui';

import 'package:flutter/cupertino.dart';
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(CupertinoIcons.wind),
              SizedBox(
                width: 10.0,
              ),
              Text(
                'Wind',
                style: TextStyle(fontSize: 18.0),
              ),
            ],
          ),
          Text(
            '${wind.direction}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Speed: '),
              Text(
                '${wind.speed}km/h',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
