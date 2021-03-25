import 'package:flutter_test/flutter_test.dart';
import 'package:geocoder/geocoder.dart';
import 'package:mockito/mockito.dart';
import 'package:my_weather_app/data/location/my_location.dart';

class MockMyLocation extends Mock implements MyLocation {}

void main() {
  MockMyLocation mockMyLocation;

  setUp(() {
    mockMyLocation = MockMyLocation();
  });
  group('Given MyLocation class', () {
    test('when coords == null should return null and print Error location', () {
      when(mockMyLocation.myActualLocation())
          .thenAnswer((_) async => Coordinates(null, null));

      final result = mockMyLocation.getCityNameFromLocation();

      expect(result, null);
    });
  });
}
