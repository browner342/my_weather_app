import 'package:flutter/material.dart';
import 'package:my_weather_app/domain/constants/constants.dart';
import 'package:my_weather_app/domain/weather/weather_components/weather_weekly.dart';
import 'package:my_weather_app/presentation/screens/main_screen/components/card_flip/back_of_card/content_components/horizontal_divider.dart';
import 'package:intl/intl.dart';

class Weekly extends StatelessWidget {
  Weekly({this.weatherWeekly});
  final WeatherWeekly weatherWeekly;

  List<Widget> weeklyComponents(WeatherWeekly weatherWeekly) {
    List<Widget> list = [];

    for (int i = 0; i < kAmoutWeeklyComponents; i++) {
      list.add(
        WeeklyComponent(
          date: DateTime.now().add(Duration(days: i)),
          icon: weatherWeekly.weatherIcon[i],
          tempDay: weatherWeekly.temperatureDay[i],
          tempNight: weatherWeekly.temperatureNight[i],
        ),
      );
      list.add(HorizontalDivider());
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: weeklyComponents(weatherWeekly),
    );
  }
}

class WeeklyComponent extends StatelessWidget {
  WeeklyComponent({this.date, this.icon, this.tempDay, this.tempNight});
  final date;
  final icon;
  final tempDay;
  final tempNight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${DateFormat('EEE, d MMM').format(date)}'),
            Text(icon),
            Text(tempDay.toString() + '/' + tempNight.toString()),
          ],
        ),
      ),
    );
  }
}
