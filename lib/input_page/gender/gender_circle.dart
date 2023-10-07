import 'gender_styles.dart';
import 'package:flutter/material.dart';

class GenderCirlce extends StatelessWidget {
  const GenderCirlce({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: circleSize(context),
      height: circleSize(context),
      decoration: const BoxDecoration(
          shape: BoxShape.circle, color: Color.fromRGBO(80, 80, 183, 1)),
    );
  }
}
