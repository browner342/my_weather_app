import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:my_weather_app/domain/cites_weather.dart';
import 'package:my_weather_app/presentation/constants/const_names.dart';
import 'package:my_weather_app/presentation/constants/const_styles.dart';
import 'package:my_weather_app/presentation/data/city_data.dart';
import 'package:my_weather_app/presentation/data/spinner.dart';
import 'package:provider/provider.dart';

String cityName;

class GetWeatherScreen extends StatelessWidget {
  static const String id = kGetWeatherScreenId;

  @override
  Widget build(BuildContext context) {
    final spinner = Provider.of<Spinner>(context);
    final cityData = Provider.of<CityData>(context, listen: false);
    final citiesWeather = Provider.of<CitiesWeather>(context, listen: false);

    SystemChannels.textInput.invokeMethod('TextInput.show');

    return ModalProgressHUD(
      inAsyncCall: spinner.showSpinner,
      child: Scaffold(
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
                    autofocus: true,
                    onChanged: (value) {
                      cityName = value;
                    },
                  ),
                ),
                Container(
                  decoration: kButtonStyle,
                  child: FlatButton(
                    onPressed: () async {
                      spinner.changeSpinnerState();
                      await cityData.addCity(cityName);

                      List<String> cityNames = cityData.showCities;
                      await citiesWeather.setCityWeather(cityNames);

                      spinner.changeSpinnerState();
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
      ),
    );
  }
}
