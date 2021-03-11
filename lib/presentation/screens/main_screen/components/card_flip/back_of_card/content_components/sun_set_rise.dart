import 'package:flutter/material.dart';

class SunSetRise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.wb_twighlight),
              Text('Sunrise: 8:21'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.wb_twighlight),
              Text('Sunset: 19:45'),
            ],
          ),
        ],
      ),
    );
  }
}
