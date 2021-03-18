import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:my_weather_app/data/location/my_location.dart';
import 'package:my_weather_app/domain/cites_weather.dart';
import 'package:my_weather_app/presentation/data/city_data.dart';
import 'package:my_weather_app/presentation/data/spinner.dart';
import 'package:my_weather_app/presentation/screens/get_weather_screen/get_weather_screen.dart';
import 'package:my_weather_app/presentation/screens/loading_screen.dart';
import 'package:my_weather_app/presentation/screens/main_screen/main_screen.dart';
import 'package:my_weather_app/presentation/screens/manage_cities_screen/manage_cities_screen.dart';
import 'package:provider/provider.dart';

void main() {
  GetIt.instance.registerLazySingleton(() => MyLocation());
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<CityData>(create: (_) => CityData()),
      ChangeNotifierProvider<CitiesWeather>(create: (_) => CitiesWeather()),
      ChangeNotifierProvider<Spinner>(create: (_) => Spinner()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyWeather(),
    ),
  ));
}

class MyWeather extends StatefulWidget {
  @override
  _MyWeatherState createState() => _MyWeatherState();
}

class _MyWeatherState extends State<MyWeather> {
  @override
  Widget build(BuildContext context) {
    // Fixing App Orientation.
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return MaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      initialRoute: LoadingScreen.id,
      routes: {
        LoadingScreen.id: (context) => LoadingScreen(),
        MainScreen.id: (context) => MainScreen(),
        ManageCitiesScreen.id: (context) => ManageCitiesScreen(),
        GetWeatherScreen.id: (context) => GetWeatherScreen(),
      },
    );
  }
}
