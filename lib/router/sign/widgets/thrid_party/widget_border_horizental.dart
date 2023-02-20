import 'package:charmin/constants/constants.dart';
import 'package:flutter/material.dart';

class HorizentalBorder extends StatelessWidget {
  const HorizentalBorder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const Expanded(
        child: Divider(
          color: Color(0xFF282843),
          height: 1.0,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: sapceGap * 2),
        child: Text(
          'OR',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      const Expanded(
        child: Divider(
          color: Color(0xFF282843),
          height: 1.0,
        ),
      ),
    ]);
  }
}
