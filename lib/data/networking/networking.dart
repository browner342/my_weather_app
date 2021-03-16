import 'dart:async';

import 'package:http/http.dart' as http;
import 'dart:convert';

/*
Class NetworkHelper get directly to the internet,
collecting data, then return json decoded info.
 */
class Networking {
  Networking(this.url);

  final String url;

  Future<dynamic> getData() async {
    try {
      http.Response response =
          await http.get(url).timeout(Duration(seconds: 4));

      if (response.statusCode == 200) {
        String data = response.body;

        return jsonDecode(data);
      } else {
        print(response.statusCode);
      }
    } on TimeoutException catch (e) {
      print(e);
      return null;
    }
  }
}
