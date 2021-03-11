import 'package:flutter/material.dart';
import 'package:my_weather_app/presentation/constants/const_styles.dart';
import 'package:swipedetector/swipedetector.dart';

class CityTile extends StatefulWidget {
  CityTile({this.cityName, this.callbackSwipeDetector});

  final String cityName;
  final callbackSwipeDetector;

  @override
  _CityTileState createState() => _CityTileState();
}

class _CityTileState extends State<CityTile> {
  bool swiped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          // un swiped tile
          swiped = false;
        });
      },
      child: SwipeDetector(
        onSwipeLeft: () {
          setState(() {
            // If tile is swiped
            swiped = true;
          });
        },
        onSwipeRight: () {
          setState(() {
            swiped = false;
          });
        },
        swipeConfiguration: SwipeConfiguration(
          horizontalSwipeMinDisplacement: 1.0,
        ),
        child: Stack(children: [
          Positioned(
            child: IconButton(
              icon: Icon(Icons.delete),
              iconSize: 40,
              onPressed: () {
                swiped = false;
                widget.callbackSwipeDetector();
              },
            ),
            left: MediaQuery.of(context).size.width - 60,
            top: kCityTileHeight / 5,
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 100),
            right: swiped ? MediaQuery.of(context).size.width / 6 : 0,
            height: kCityTileHeight,
            width: MediaQuery.of(context).size.width,
            child: TileItSelf(
              cityName: widget.cityName,
            ),
          ),
        ]),
      ),
    );
  }
}

class TileItSelf extends StatelessWidget {
  TileItSelf({this.cityName});
  final String cityName;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: kCityTileStyle,
      child: Center(
        child: Text(
          cityName,
          style: kCityTileTextStyle,
        ),
      ),
    );
  }
}
