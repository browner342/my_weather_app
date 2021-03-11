import 'package:flutter/material.dart';
import 'package:my_weather_app/presentation/constants/const_styles.dart';
import 'package:my_weather_app/presentation/screens/main_screen/components/card_flip/back_of_card/content_components/horizontal_divider.dart';
import 'package:my_weather_app/presentation/screens/main_screen/components/card_flip/back_of_card/content_components/hourly_component.dart';
import 'package:my_weather_app/presentation/screens/main_screen/components/card_flip/back_of_card/content_components/sun_set_rise.dart';
import 'package:my_weather_app/presentation/screens/main_screen/components/card_flip/back_of_card/content_components/weekly_component.dart';
import 'package:my_weather_app/presentation/screens/main_screen/components/card_flip/back_of_card/content_components/wind.dart';

class BackCardContent extends StatelessWidget {
  BackCardContent({this.cityName});
  final String cityName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 10.0),
            child: Text(
              cityName,
              style: kTitleStyle,
            ),
          ),
          HorizontalDivider(),
          Hourly(),
          HorizontalDivider(),
          Weekly(),
          Expanded(
            child: Row(
              children: [
                SunSetRise(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: VerticalDivider(
                    color: Colors.black45,
                  ),
                ),
                Wind(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
