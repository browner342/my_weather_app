import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_weather_app/data/local_memmory_shared_preferences/shared_preferences_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  final SharedPreferencesImpl sharedPreferencesImpl = SharedPreferencesImpl();
  MockSharedPreferences mockSharedPreferences;
  group('Given SharedPreferencesImpl class', () {
    setUp(() {
      mockSharedPreferences = MockSharedPreferences();
    });

    test('should return city list from shared preferences', () async {});
  });
}
