import 'package:flutter/material.dart';
import 'package:news_app/utils/globals.dart';

class CustomTextWidget extends StatelessWidget {
  final bool isTappable;
  final String text;
  final TextStyle textStyle;

  CustomTextWidget(this.text,
      {this.isTappable = false, this.textStyle = const TextStyle()});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isTappable) {
          launchURL(text);
        }
      },
      child: Container(
        child: Text(
          text != null ? text : '',
          style: textStyle,
        ),
      ),
    );
  }
}
