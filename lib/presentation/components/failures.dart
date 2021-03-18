import 'package:flutter/material.dart';

class Failures {
  Future<void> noInternetConnection(context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('No internet connection'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Check if your device has internet connection.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
