import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_weather_app/presentation/data/city_data.dart';
import 'package:provider/provider.dart';
import 'card_flip/flip_animation_cards.dart';

class CityCards extends StatelessWidget {
  CityCards({this.amountOfCards});
  final int amountOfCards;
  final _controller = CarouselControllerImpl();

  List<FlipAnimationCards> flipCardsBuilder() {
    List<FlipAnimationCards> cardHolder = [];
    for (int i = 0; i < amountOfCards; i++) {
      cardHolder.add(
        FlipAnimationCards(
          positionedNumber: i,
        ),
      );
    }
    return cardHolder;
  }

  @override
  Widget build(BuildContext context) {
    List<FlipAnimationCards> cardList = flipCardsBuilder();

    return SafeArea(
      child: ListView(
        children: [
          CarouselSlider(
            carouselController:
                Provider.of<CityData>(context).carouselController,
            items: cardList,
            options: CarouselOptions(
              initialPage: 0,
              height: MediaQuery.of(context).size.height - 30,
              enlargeCenterPage: true,
              autoPlay: false,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: false,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
          )
        ],
      ),
    );
  }
}
