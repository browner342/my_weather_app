import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:my_weather_app/data/constants/constants.dart';
import 'package:my_weather_app/data/local_memmory_shared_preferences/shared_preferences_impl.dart';
import 'package:my_weather_app/data/location/my_location.dart';

class CityData extends ChangeNotifier {
  MyLocation myLocation = GetIt.instance<MyLocation>();
  SharedPreferencesImpl _sharedPreferencesImpl = SharedPreferencesImpl();
  List<String> _cityList = [];
  //user choose city to look at in menage city screen
  CarouselControllerImpl _carouselControllerImpl = CarouselControllerImpl();

  CarouselControllerImpl get carouselController => _carouselControllerImpl;

  Future<void> setChosenCity(int numberOfChosenCity) async {
    await _carouselControllerImpl.animateToPage(numberOfChosenCity);

    notifyListeners();
  }

  Future<void> getDataFromMemory() async {
    _cityList = await _sharedPreferencesImpl.showCityListFromMemory();
    checkForDuplicates();
  }

  Future<void> addCity(String cityName) async {
    if (_cityList.length <= kMaxAmountCitiesInMemory) {
      _cityList.add(cityName);
      checkForDuplicates();

      await _sharedPreferencesImpl.updateMemory(_cityList);
      notifyListeners();
    } else {
      //  TODO: add info for user, that max is kMaxAmount
    }
  }

  Future<void> deleteCity(int index) async {
    _cityList.removeAt(index);
    checkForDuplicates();
    await _sharedPreferencesImpl.updateMemory(_cityList);
    notifyListeners();
  }

  Future<void> firstElemMyLocation() async {
    String locationCityName = await myLocation.getCityNameFromLocation();

    if (locationCityName != null) {
      _cityList.insert(0, locationCityName);
      checkForDuplicates();
    }
  }

  checkForDuplicates() {
    List<String> tmp = _cityList;
    _cityList = tmp.toSet().toList();
  }

  List<String> get showCities => _cityList;
  int get amountOfCities => _cityList.length;
}
