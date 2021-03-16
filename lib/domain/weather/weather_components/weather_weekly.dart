import 'package:my_weather_app/domain/constants/constants.dart';

class WeatherWeekly {
  List<double> temperatureDay = List(kAmoutWeeklyComponents);
  List<double> temperatureNight = List(kAmoutWeeklyComponents);
  List<String> weatherIcon = List(kAmoutWeeklyComponents);

  // List<double> get temperatureDay => _temperatureDay;
  // List<double> get temperatureNight => _temperatureNight;
  // List<String> get weatherIcon => _weatherIcon;
}
