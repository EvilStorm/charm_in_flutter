import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'button_circle.dart';

class ThirdPartySignInSection extends StatelessWidget {
  const ThirdPartySignInSection({Key? key, required this.height})
      : super(key: key);

  final double height;
  final double appIconSize = 35;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          flex: 1,
          child: CircleButton(
            callback: () {},
            child: SvgPicture.asset(
              "assets/images/google_logo.svg",
              width: appIconSize,
              height: appIconSize,
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: CircleButton(
            callback: () {},
            backgroundColor: const Color(0xFF4267B2),
            child: SvgPicture.asset(
              "assets/images/facebook_logo.svg",
              width: appIconSize,
              height: appIconSize,
              color: Colors.white,
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: CircleButton(
            callback: () {},
            backgroundColor: const Color(0xFFFFE812),
            child: SvgPicture.asset(
              "assets/images/kakaotalk_logo.svg",
              width: appIconSize,
              height: appIconSize,
            ),
          ),
        ),
        Visibility(
          visible: Platform.isIOS,
          child: Flexible(
            flex: 1,
            child: CircleButton(
              callback: () {},
              backgroundColor: const Color(0xFF555555),
              child: SvgPicture.asset(
                "assets/images/apple_logo.svg",
                width: appIconSize,
                height: appIconSize,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
