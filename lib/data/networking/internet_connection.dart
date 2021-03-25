import 'dart:io';

class InternetLookUp {
  Future<List<InternetAddress>> internetLookUp() async {
    var result = await InternetAddress.lookup('google.com');
    return result;
  }
}

class InternetConnection {
  InternetLookUp internetLookUp = InternetLookUp();

  Future<bool> isConnected() async {
    try {
      var result = await internetLookUp.internetLookUp();
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
