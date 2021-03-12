import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:my_weather_app/data/location/my_location.dart';

class CityData extends ChangeNotifier {
  MyLocation myLocation = GetIt.instance<MyLocation>();
  List<String> _cityList = [];

  addCity(String cityName) {
    _cityList.add(cityName);
    notifyListeners();
  }

  deleteCity(int index) {
    _cityList.removeAt(index);
    notifyListeners();
  }

  Future<void> firstElemMyLocation() async {
    String locationCityName = await myLocation.getCityNameFromLocation();

    if (locationCityName != null) {
      _cityList.insert(0, locationCityName);
    }
  }

  List<String> get showCities => _cityList;
  int get amountOfCities => _cityList.length;
}
