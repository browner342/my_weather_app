import 'package:flutter/material.dart';
import 'package:my_weather_app/presentation/constants/const_styles.dart';

class FrontCardContent extends StatelessWidget {
  FrontCardContent({this.cityName});
  final String cityName;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              cityName,
              style: kTitleStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Icon(Icons.wb_sunny),
          ),
          Text(
            'Sunny',
          ),
          Text('20 / 18')
        ],
      ),
    );
  }
}
