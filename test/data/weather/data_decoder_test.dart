import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:my_weather_app/data/weather/data_decoder.dart';
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

    test('Should decode weatherHourly parameters', () {});
  });
}
