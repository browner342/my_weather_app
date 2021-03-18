import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'card_flip/flip_animation_cards.dart';

class CityCards extends StatelessWidget {
  CityCards({this.amountOfCards});
  final int amountOfCards;

  List<FlipAnimationCards> flipCardsBuilder() {
    List<FlipAnimationCards> cardHolder = [];
    for (int i = 0; i < amountOfCards; i++) {
      cardHolder.add(FlipAnimationCards(
        positionedNumber: i,
      ));
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
            items: cardList,
            options: CarouselOptions(
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
