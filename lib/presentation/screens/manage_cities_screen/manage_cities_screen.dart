import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_weather_app/data/networking/internet_connection.dart';
import 'package:my_weather_app/presentation/components/failures.dart';
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
        child: Icon(
          Icons.add,
          color: kButtonInsideColor,
        ),
        onPressed: () async {
          if (await InternetConnection().isConnected()) {
            Navigator.pushNamed(context, GetWeatherScreen.id);
          } else {
            Failures().noInternetConnection(context);
          }
        },
        backgroundColor: kButtonBackgroundColor,
      ),
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
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
