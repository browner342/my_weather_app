import 'package:flutter/material.dart';

class Hourly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          HourlyComponent(),
          HourlyComponent(),
          HourlyComponent(),
          HourlyComponent(),
          HourlyComponent(),
          HourlyComponent(),
          HourlyComponent(),
          HourlyComponent(),
          HourlyComponent(),
          HourlyComponent(),
          HourlyComponent(),
          HourlyComponent(),
        ],
      ),
    );
  }
}

class HourlyComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('20:00'),
          SizedBox(
            height: 10.0,
          ),
          Icon(Icons.wb_sunny),
          SizedBox(
            height: 10.0,
          ),
          Text('16'),
        ],
      ),
    );
  }
}
