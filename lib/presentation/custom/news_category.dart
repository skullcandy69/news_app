import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsCategory extends StatelessWidget {
  final String image;
  final String text;

  NewsCategory(this.image, this.text);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            ScreenUtil.instance.setWidth(16),
          ),
        ),
      ),
      child: Container(
        child: Image.asset(image),
      ),
    );
  }
}
