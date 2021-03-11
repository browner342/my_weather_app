import 'package:flutter/material.dart';

class Wind extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Wind'),
          Text('Direction: Northeast'),
          Text('12-28 km/h')
        ],
      ),
    );
  }
}
