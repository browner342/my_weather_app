import 'dart:io';

class InternetConnection {
  Future<bool> isConnected() async {
    try {
      var result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
