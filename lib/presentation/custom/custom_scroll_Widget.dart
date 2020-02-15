import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/presentation/animation/provide_animation_widget.dart';
import 'package:news_app/utils/styles.dart';

class CustomScrollWidget extends StatefulWidget {
  final bool isSelected;
  final String firstTab;
  final String secondTab;
  final Color primaryColor;
  final Color secondaryColor;
  final double leftPosition;
  final double rightPosition;
  final Function onSelection;

  CustomScrollWidget(
      {this.isSelected = false,
      this.onSelection,
      this.firstTab,
      this.primaryColor,
      this.secondaryColor,
      this.secondTab,
      this.leftPosition,
      this.rightPosition});

  @override
  _CustomScrollWidgetState createState() => _CustomScrollWidgetState();
}

class _CustomScrollWidgetState extends State<CustomScrollWidget> {
  bool isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: InkWell(
                onTap: () {
                  if (!isSelected) {
                    widget.onSelection(true);
                    setState(() {
                      isSelected = true;
                    });
                  }
                },
                child: _textWidget(
                  color: isSelected ? Styles.amber : Styles.blackColor,
                  text: widget.firstTab,
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  if (isSelected) {
                    widget.onSelection(false);
                    setState(() {
                      isSelected = false;
                    });
                  }
                },
                child: _textWidget(
                  text: widget.secondTab,
                  color: !isSelected ? Styles.amber : Styles.blackColor,
                ),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: ScreenUtil.instance.setHeight(0),
          left: ScreenUtil.instance.setWidth(
              isSelected ? widget.leftPosition : widget.rightPosition),
          child: ProvideAnimation(
            key: Key(isSelected.toString()),
            transitionFormat: isSelected
                ? TransitionFormat.rightToLeft
                : TransitionFormat.leftToRight,
            child: Container(
              color: widget.primaryColor,
              width: ScreenUtil.instance.setWidth(72),
              child: Row(
                children: <Widget>[
                  AnimatedContainer(
                    duration: Duration(milliseconds: 400),
                    curve: Curves.easeIn,
                    height: ScreenUtil.instance.setHeight(4),
                    width: ScreenUtil.instance.setWidth(isSelected ? 56 : 72),
                    decoration: BoxDecoration(
                      color: widget.secondaryColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(
                          ScreenUtil.instance.setHeight(10),
                        ),
                        topLeft: Radius.circular(
                          ScreenUtil.instance.setHeight(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _textWidget({String text, Color color}) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: Styles.extremeSmall,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
