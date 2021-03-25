import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_weather_app/data/networking/internet_connection.dart';

class MockInternetLookUp extends Mock implements InternetLookUp {}

void main() {
  InternetLookUp mockInternetLookUp = MockInternetLookUp();
  InternetConnection internetConnection = InternetConnection();

  setUp(() {
    internetConnection.internetLookUp = mockInternetLookUp;
  });

  group('Given InternetConnection class', () {
    test('when there is no connection should return false', () async {
      List<InternetAddress> empty = [];
      when(mockInternetLookUp.internetLookUp()).thenAnswer((_) async => empty);

      var result = await internetConnection.isConnected();

      expect(result, false);
    });

    test('when there is connection should return true', () async {
      List<InternetAddress> tmp = [InternetAddress.anyIPv4];
      when(mockInternetLookUp.internetLookUp()).thenAnswer((_) async => tmp);

      var result = await internetConnection.isConnected();

      expect(result, true);
    });
  });
}
