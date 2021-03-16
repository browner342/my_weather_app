import 'package:flutter_test/flutter_test.dart';
import 'package:my_weather_app/domain/weather/weather.dart';

void main() {
  group('Given Weather class', () {
    Weather weather = Weather(cityName: 'Wroclaw');

    test('Returns city name given in initiation', () {
      expect(weather.cityName, 'Wroclaw');
    });
  });
}
