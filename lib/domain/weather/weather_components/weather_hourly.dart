import 'package:my_weather_app/domain/constants/constants.dart';

class WeatherHourly {
  List<int> temperature = List.filled(kAmoutHourlyComponents, 0);
  List<String> weatherIcon = List.filled(kAmoutHourlyComponents, 'fail');

  // List<double> get temperature => _temperature;
  // List<String> get weatherIcon => _weatherIcon;
}
