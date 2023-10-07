import 'gender_styles.dart';
import 'package:bmi_calculator/model/gender.dart';
import 'package:bmi_calculator/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GenderIconTranslated extends StatelessWidget {
  final Gender gender;
  final bool isSelected;

  const GenderIconTranslated(
      {Key? key, required this.gender, this.isSelected = false})
      : super(key: key);

  static final Map<Gender, String> _genderImages = {
    Gender.female: "assets/images/gender_female.svg",
    Gender.other: "assets/images/gender_other.svg",
    Gender.male: "assets/images/gender_male.svg",
  };

  bool get _isOtherGender => gender == Gender.other;
  String get _assetName => _genderImages[gender]!;

  double _iconSize(BuildContext context) {
    return screenAwareSize(_isOtherGender ? 22.0 : 16.0, context);
  }

  double _genderLeftPadding(BuildContext context) {
    return screenAwareSize(_isOtherGender ? 8.0 : 0.0, context);
  }

  @override
  Widget build(BuildContext context) {
    Widget icon = Padding(
      padding: EdgeInsets.only(left: _genderLeftPadding(context)),
      child: SvgPicture.asset(
        _assetName,
        height: _iconSize(context),
        width: _iconSize(context),
        color: isSelected ? null : Color.fromRGBO(143, 144, 156, 1.0),
      ),
    );

    Widget rotatedIcon = Transform.rotate(
      angle: -genderAngles[gender]!,
      child: icon,
    );

    Widget iconWithALine = Padding(
      padding: EdgeInsets.only(bottom: circleSize(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [rotatedIcon, const GenderLine()],
      ),
    );

    Widget rotatedIconWithALine = Transform.rotate(
      angle: genderAngles[gender]!,
      alignment: Alignment.bottomCenter,
      child: iconWithALine,
    );

    Widget centerediconWithALine = Padding(
      padding: EdgeInsets.only(bottom: circleSize(context)),
      child: rotatedIconWithALine,
    );

    return centerediconWithALine;
  }
}

class GenderLine extends StatelessWidget {
  const GenderLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: screenAwareSize(8.0, context),
          bottom: screenAwareSize(6.0, context)),
      child: Container(
        height: screenAwareSize(8.0, context),
        width: 1.0,
        color: const Color.fromRGBO(
          216,
          217,
          223,
          0.54,
        ),
      ),
    );
  }
}
