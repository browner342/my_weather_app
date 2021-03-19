import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';

class MyLocation {
  double _longitude;
  double _latitude;

  Future<Coordinates> _myActualLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      _latitude = position.latitude;
      _longitude = position.longitude;

      return Coordinates(_latitude, _longitude);
    } catch (e) {
      print(e);
      return Coordinates(null, null);
    }
  }

  Future<String> getCityNameFromLocation() async {
    try {
      Coordinates coordinates = await _myActualLocation();
      if (coordinates.latitude == null || coordinates.longitude == null) {
        print('Error location');
        return null;
      }

      var address =
          await Geocoder.local.findAddressesFromCoordinates(coordinates);

      return address.first.locality;
    } catch (e) {
      print(e);
      return 'fail location';
    }
  }
}
