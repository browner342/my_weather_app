import 'package:flutter/foundation.dart';
import 'package:my_weather_app/data/location/my_location.dart';

class CityData extends ChangeNotifier {
  List<String> _cityList = [
    'Warsaw',
    'London',
    'Amsterdam',
  ];

  addCity(String cityName) {
    _cityList.add(cityName);
    notifyListeners();
  }

  deleteCity(int index) {
    _cityList.removeAt(index);
    notifyListeners();
  }

  Future<void> firstElemMyLocation() async {
    String locationCityName = await MyLocation().getCityNameFromLocation();

    if (locationCityName != null) {
      _cityList.insert(0, locationCityName);
    }
  }

  List<String> get showCities => _cityList;
  int get amountOfCities => _cityList.length;
}
