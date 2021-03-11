import 'package:flutter/foundation.dart';

class CityData extends ChangeNotifier {
  List<String> _cityList = [
    'Las Palmas',
    'New York',
    'Berlin',
    'Wroclaw',
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

  List<String> get showCities => _cityList;
  int get amountOfCities => _cityList.length;
}
