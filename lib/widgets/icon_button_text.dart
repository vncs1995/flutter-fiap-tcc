import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconButtonWithText extends StatelessWidget {
  IconButtonWithText({this.onPressed, this.title});
  final VoidCallback onPressed;
  final String title;
  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            'assets/pokeball.svg',
            height: 200,
            width: 200,
          ),
          tooltip: this.title,
          onPressed: onPressed,
        ),
        Text(
          this.title,
          style: TextStyle(fontSize: 20),
        )
      ],
    );
  }
}
