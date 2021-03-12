import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:my_weather_app/data/location/my_location.dart';
import 'package:my_weather_app/presentation/data/city_data.dart';

class MockMyLocation extends MyLocation {
  @override
  Future<String> getCityNameFromLocation() {
    return Future.value('Berlin');
  }
}

void main() {
  GetIt.instance.registerFactory(() => CityData());
  GetIt.instance.registerLazySingleton(() => MyLocation());

  var cityDataModel = GetIt.instance<CityData>();
  cityDataModel.myLocation = MockMyLocation();

  cityDataModel.addCity('Wroclaw');
  cityDataModel.addCity('Wroclaw');
  cityDataModel.addCity('Wroclaw');

  group('Given City Data page Loads', () {
    test(
        'When user add a city to a list of cities, bandage should increment by one',
        () {
      expect(cityDataModel.showCities.length, 3);
      cityDataModel.addCity('Wroclaw');
      expect(cityDataModel.showCities.length, 4);
    });

    test(
        'When user delete a city from list of cities, bandage should decrease by one',
        () {
      expect(cityDataModel.showCities.length, 3);
      cityDataModel.deleteCity(0);
      expect(cityDataModel.showCities.length, 2);
    });

    test(
        'App should take my location and adds it on the first place of the list',
        () async {
      await cityDataModel.firstElemMyLocation();
      expect(cityDataModel.showCities[0], 'Berlin');
    });
  });
}
