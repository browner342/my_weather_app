import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:my_weather_app/data/networking/place_service.dart';
import 'package:my_weather_app/domain/cites_weather.dart';
import 'package:my_weather_app/presentation/constants/const_names.dart';
import 'package:my_weather_app/presentation/constants/const_styles.dart';
import 'package:my_weather_app/presentation/data/city_data.dart';
import 'package:my_weather_app/presentation/data/spinner.dart';
import 'package:my_weather_app/presentation/screens/get_weather_screen/address_search.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

String cityName;

class GetWeatherScreen extends StatelessWidget {
  static const String id = kGetWeatherScreenId;

  @override
  Widget build(BuildContext context) {
    final spinner = Provider.of<Spinner>(context);
    final cityData = Provider.of<CityData>(context, listen: false);
    final citiesWeather = Provider.of<CitiesWeather>(context, listen: false);
    final _controller = TextEditingController();
    _controller.text = '';

    return Scaffold(
      appBar: AppBar(),
      body: ModalProgressHUD(
        inAsyncCall: spinner.showSpinner,
        child: Scaffold(
          backgroundColor: kBackgroundColor,
          body: Container(
            constraints: BoxConstraints.expand(),
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: TextField(
                      style: TextStyle(color: Colors.black),
                      decoration: kTextFieldDecoration,
                      controller: _controller,
                      readOnly: true,
                      onTap: () async {
                        // generate a new token here
                        final sessionToken = Uuid().v4();
                        final Suggestion result = await showSearch(
                          context: context,
                          delegate: AddressSearch(sessionToken),
                        );

                        cityName = result.placeId.split(',')[0];
                        if (cityName != null) {
                          _controller.text = cityName;
                        }
                      },
                    ),
                  ),
                  FlatButton(
                    padding: EdgeInsets.all(16.0),
                    color: kButtonBackgroundColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    splashColor: Colors.grey.shade300,
                    onPressed: () async {
                      if (cityName != null) {
                        spinner.changeSpinnerState();
                        await cityData.addCity(cityName);

                        List<String> cityNames = cityData.showCities;
                        await citiesWeather.setCityWeather(cityNames);

                        spinner.changeSpinnerState();

                        int count = 0;
                        Navigator.of(context).popUntil((_) => count++ >= 2);
                      }
                    },
                    child: Text(
                      'Get Weather',
                      style: kButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
