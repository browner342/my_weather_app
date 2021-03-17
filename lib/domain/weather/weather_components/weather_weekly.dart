import 'package:my_weather_app/domain/constants/constants.dart';

class WeatherWeekly {
  List<int> temperatureDay = List.filled(kAmoutWeeklyComponents, 0);
  List<int> temperatureNight = List.filled(kAmoutWeeklyComponents, 0);
  List<String> weatherIcon = List.filled(kAmoutWeeklyComponents, 'fail');

  // List<double> get temperatureDay => _temperatureDay;
  // List<double> get temperatureNight => _temperatureNight;
  // List<String> get weatherIcon => _weatherIcon;
}
