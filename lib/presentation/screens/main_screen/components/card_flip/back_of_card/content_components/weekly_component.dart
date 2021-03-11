import 'package:flutter/material.dart';
import 'package:my_weather_app/presentation/screens/main_screen/components/card_flip/back_of_card/content_components/horizontal_divider.dart';

class Weekly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WeeklyComponent(),
        HorizontalDivider(),
        WeeklyComponent(),
        HorizontalDivider(),
        WeeklyComponent(),
        HorizontalDivider(),
        WeeklyComponent(),
        HorizontalDivider(),
        WeeklyComponent(),
        HorizontalDivider(),
        WeeklyComponent(),
        HorizontalDivider(),
        WeeklyComponent(),
        HorizontalDivider(),
      ],
    );
  }
}

class WeeklyComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text('Sat, Mar 13'), Icon(Icons.wb_sunny), Text('20/18')],
        ),
      ),
    );
  }
}
