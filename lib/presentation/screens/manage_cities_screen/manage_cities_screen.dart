import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_weather_app/presentation/constants/const_names.dart';
import 'package:my_weather_app/presentation/constants/const_styles.dart';
import 'package:my_weather_app/presentation/screens/get_weather_screen/get_weather_screen.dart';

import 'components/city_list_widget.dart';

class ManageCitiesScreen extends StatelessWidget {
  static const String id = kManageCitiesScreenId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, GetWeatherScreen.id);
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: kBackArrowSize,
                    )),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.12,
                ),
                Text(
                  'City list',
                  style: kTitleStyle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            CityList(),
            SizedBox(
              height: 80.0,
            )
          ],
        ),
      ),
    );
  }
}
