import 'dart:convert';

import 'package:http/http.dart';

class Suggestion {
  Suggestion(this.description, this.placeId);
  final String placeId;
  final String description;

  @override
  String toString() {
    return placeId;
  }
}

class PlaceApiProvider {
  final client = Client();

  PlaceApiProvider(this.sessionToken);
  final sessionToken;

  static final String apiKey = 'AIzaSyAMVg7Bleb752lB-p01A5PeDaNtyV4CFms';

  Future<List<Suggestion>> fetchSuggestions(String input, String lang) async {
    final request =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&types=(cities)&language=$lang&key=$apiKey&sessiontoken=$sessionToken';
    final response = await client.get(request);

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      if (result['status'] == 'OK') {
        //  compose suggestions in a list
        var test = result['predictions']
            .map<Suggestion>((p) => Suggestion(p['place_id'], p['description']))
            .toList();

        return test;
      }
      if (result['status'] == 'ZERO_RESULTS') {
        return [];
      }
      throw Exception(result['error_message']);
    } else {
      throw Exception('Failed to fetch suggestion');
    }
  }
}
