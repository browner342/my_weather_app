import 'package:flutter/foundation.dart';

class Spinner extends ChangeNotifier {
  bool _showSpinner = false;

  void changeSpinnerState() {
    _showSpinner = !_showSpinner;
    notifyListeners();
  }

  bool get showSpinner => _showSpinner;
}
