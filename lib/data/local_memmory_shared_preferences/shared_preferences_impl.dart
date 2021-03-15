import 'package:my_weather_app/data/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesImpl {
  Future<List<String>> showCityListFromMemory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> cityList = [];
    String tmp;

    for (int i = 0; i < kMaxAmountCitiesInMemory; i++) {
      if (prefs.containsKey(i.toString())) {
        tmp = prefs.getString(i.toString());
        cityList.add(tmp);
      }
    }

    return cityList;
  }

  Future<void> _clearMemory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    for (int i = 0; i < kMaxAmountCitiesInMemory; i++) {
      if (prefs.containsKey(i.toString())) {
        prefs.remove(i.toString());
      }
    }
  }

  Future<void> updateMemory(List<String> cityList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int index = 0;

    await _clearMemory();
    for (String city in cityList) {
      prefs.setString(index.toString(), city);
      index++;
    }
  }
}
