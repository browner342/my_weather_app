import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:my_weather_app/data/weather/data_decoder.dart';
import 'package:my_weather_app/domain/constants/constants.dart';
import 'package:my_weather_app/domain/weather/weather.dart';
import '../../fixture/fixture_reader.dart';

void main() {
  var weatherData = jsonDecode(fixture('onecallWeatherData.json'));
  DataDecoder dataDecoder = DataDecoder(weatherData: weatherData);
  Weather weather = dataDecoder.decodeData();

  group('Given data decoder class, take weather data', () {
    test('Should decode weatherNow parameters', () async {
      var actual = weather.weatherNow;
      expect(actual.temperatureDay, 30.01);
      expect(actual.weatherIcon, '800');
      expect(actual.condition, 'clear sky');
    });

    test('Should decode weatherHourly parameters', () {
      var actual = weather.weatherHourly;
      expect(actual.temperature[0], 30.01);
      expect(actual.temperature[5], 26.43);
      expect(actual.temperature[kAmoutHourlyComponents - 1], 28.41);

      expect(actual.weatherIcon[0], '800');
      expect(actual.weatherIcon[5], '800');
      expect(actual.weatherIcon[kAmoutHourlyComponents - 1], '800');
    });

    test('Should decode weatherWeekly parameters', () {
      var actual = weather.weatherWeekly;
      expect(actual.temperatureDay[0], 31.04);
      expect(actual.temperatureDay[5], 40.91);
      expect(actual.temperatureDay[kAmoutWeeklyComponents - 1], 39.79);

      expect(actual.weatherIcon[0], '800');
      expect(actual.weatherIcon[5], '800');
      expect(actual.weatherIcon[kAmoutWeeklyComponents - 1], '800');
    });
  });
}
