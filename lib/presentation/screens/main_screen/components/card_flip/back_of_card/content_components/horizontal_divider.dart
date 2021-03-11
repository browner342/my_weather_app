import 'package:flutter/material.dart';

class HorizontalDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Divider(
        color: Colors.black45,
      ),
    );
  }
}
