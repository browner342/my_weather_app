import 'package:flutter/material.dart';
import 'package:my_weather_app/domain/weather/weather_components/sun_set_rise.dart';
import 'package:intl/intl.dart';
import 'package:weather_icons/weather_icons.dart';

class SunSetRiseComponent extends StatelessWidget {
  SunSetRiseComponent({this.sunSetRise});
  final SunSetRise sunSetRise;

  @override
  Widget build(BuildContext context) {
    final formatedSunRise = DateFormat('Hm').format(sunSetRise.sunRiseTime);
    final formatedSunSet = DateFormat('Hm').format(sunSetRise.sunSetTime);

    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(WeatherIcons.sunrise),
              SizedBox(
                width: 10.0,
              ),
              Text('Sunrise: '),
              Text(
                formatedSunRise,
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(WeatherIcons.sunset),
              SizedBox(
                width: 10.0,
              ),
              Text('Sunset: '),
              Text(
                formatedSunSet,
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ],
      ),
    );
  }
}
