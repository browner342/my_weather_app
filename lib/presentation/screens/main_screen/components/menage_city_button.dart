import 'package:flutter/material.dart';
import 'package:my_weather_app/presentation/constants/const_styles.dart';
import 'package:my_weather_app/presentation/screens/manage_cities_screen/manage_cities_screen.dart';

class MenageCityButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(
        Icons.search_outlined,
        size: 30.0,
        color: kButtonInsideColor,
      ),
      backgroundColor: kButtonBackgroundColor,
      onPressed: () {
        Navigator.pushNamed(context, ManageCitiesScreen.id);
      },
    );
  }
}
