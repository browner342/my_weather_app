import 'package:flutter/material.dart';
import 'package:my_weather_app/presentation/constants/const_styles.dart';
import 'package:my_weather_app/presentation/data/city_data.dart';
import 'package:my_weather_app/presentation/screens/manage_cities_screen/components/city_tile.dart';
import 'package:provider/provider.dart';

class CityList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int i) {
                return Container(
                  height: kCityTileHeight,
                  child: CityTile(
                    cityName: Provider.of<CityData>(context).showCities[i],
                    callbackSwipeDetector: () {
                      Provider.of<CityData>(context, listen: false)
                          .deleteCity(i);
                    },
                  ),
                );
              },
              childCount: Provider.of<CityData>(context).showCities.length,
            ),
          )
        ],
      ),
    );
  }
}
