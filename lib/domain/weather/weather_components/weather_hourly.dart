import 'package:my_weather_app/domain/constants/constants.dart';

class WeatherHourly {
  List<double> temperature = List(kAmoutHourlyComponents);
  List<String> weatherIcon = List(kAmoutHourlyComponents);

  // List<double> get temperature => _temperature;
  // List<String> get weatherIcon => _weatherIcon;
}
