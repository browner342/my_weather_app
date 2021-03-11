import 'package:flutter/material.dart';
import 'package:my_weather_app/presentation/constants/const_names.dart';
import 'package:my_weather_app/presentation/constants/const_styles.dart';
import 'package:my_weather_app/presentation/data/city_data.dart';
import 'package:provider/provider.dart';

String cityName;

class GetWeatherScreen extends StatelessWidget {
  static const String id = kGetWeatherScreenId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/getWeatherBack.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: kBackArrowSize,
                  ),
                ),
              ),
              SizedBox(
                height: 125,
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: kTextFieldDecoration,
                  onChanged: (value) {
                    cityName = value;
                  },
                ),
              ),
              Container(
                decoration: kButtonStyle,
                child: FlatButton(
                  onPressed: () {
                    Provider.of<CityData>(context, listen: false)
                        .addCity(cityName);
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Get Weather',
                    // style: kButtonTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
