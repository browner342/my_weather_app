import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_weather_app/presentation/screens/main_screen/components/card_flip/back_of_card/back_card.dart';
import 'package:my_weather_app/presentation/screens/main_screen/components/card_flip/front_of_card/front_card.dart';

class FlipAnimationCards extends StatefulWidget {
  FlipAnimationCards({this.positionedNumber});
  final int positionedNumber;

  @override
  _FlipAnimationCardsState createState() => _FlipAnimationCardsState();
}

class _FlipAnimationCardsState extends State<FlipAnimationCards> {
  bool _showFront = true;
  FrontCard frontCard;
  BackCard backCard;

  Widget __transitionBuilder(Widget widget, Animation<double> animation) {
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnim,
      child: widget,
      builder: (context, widget) {
        final isUnder = (ValueKey(_showFront) != widget.key);
        var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
        tilt *= isUnder ? -1.0 : 1.0;
        final value =
            isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
        return Transform(
          transform: Matrix4.rotationY(value)..setEntry(3, 0, tilt),
          child: widget,
          alignment: Alignment.center,
        );
      },
    );
  }

  @override
  void initState() {
    frontCard = FrontCard(positionedNumber: widget.positionedNumber);
    backCard = BackCard(positionedNumber: widget.positionedNumber);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(
          () {
            _showFront = !_showFront;
          },
        );
      },
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 800),
        transitionBuilder: __transitionBuilder,
        layoutBuilder: (widget, list) => Stack(children: [widget, ...list]),
        child: _showFront ? frontCard : backCard,
        switchInCurve: Curves.easeInBack,
        switchOutCurve: Curves.easeOutBack,
      ),
    );
  }
}
