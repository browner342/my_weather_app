import 'package:flutter/material.dart';
import 'package:my_weather_app/domain/weather/weather_components/sun_set_rise.dart';
import 'package:intl/intl.dart';

class SunSetRiseComponent extends StatelessWidget {
  SunSetRiseComponent({this.sunSetRise});
  final SunSetRise sunSetRise;

  @override
  Widget build(BuildContext context) {
    final formatedSunRise = DateFormat('Hm').format(sunSetRise.sunRiseTime);
    final formatedSunSet = DateFormat('Hm').format(sunSetRise.sunSetTime);

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.wb_twighlight),
              Text('Sunrise: $formatedSunRise'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.wb_twighlight),
              Text('Sunset: $formatedSunSet'),
            ],
          ),
        ],
      ),
    );
  }
}
