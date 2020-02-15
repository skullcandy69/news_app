import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobx/mobx.dart';
import 'package:news_app/presentation/animation/provide_animation_widget.dart';
import 'package:news_app/stores/user_store.dart';
import 'package:news_app/utils/globals.dart';
import 'package:news_app/utils/string_value.dart';
import 'package:news_app/utils/styles.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatefulWidget {
  final bool showTextField;
  final Function setTextFieldVisibility;
  final Show show;

  CustomAppBar(
      {this.showTextField = false, this.setTextFieldVisibility, this.show});

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool isHidden = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil.instance.setHeight(32),
        vertical: ScreenUtil.instance.setHeight(16),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(
              ScreenUtil.instance.setWidth(88),
            ),
            bottomRight: Radius.circular(
              ScreenUtil.instance.setWidth(88),
            ),
          ),
          color: Colors.amberAccent),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              _hideAppBarItem(),
              InkWell(
                onTap: () {
                  if (widget.showTextField) {
                    widget.setTextFieldVisibility(false, widget.show);
                    WidgetsBinding.instance
                        .addPostFrameCallback((Duration duration) {
                      Future.delayed((Duration(milliseconds: 200)), () {
                        setState(() {
                          isHidden = !isHidden;
                        });
                      });
                    });
                  } else {
                    setState(() {
                      isHidden = !isHidden;
                    });
                  }
                },
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Text(
                        StringValue.filter,
                        style: TextStyle(
                          fontSize: Styles.smallFont,
                        ),
                      ),
                      SizedBox(
                        width: ScreenUtil.instance.setWidth(8),
                      ),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 400),
                        padding: EdgeInsets.all(
                          ScreenUtil.instance.setWidth(8),
                        ),
                        child: Icon(!isHidden ? Icons.filter_list : Icons.sort),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _hideAppBarItem() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 800),
      margin: EdgeInsets.symmetric(
        horizontal: ScreenUtil.instance.setWidth(16),
      ),
      child: isHidden
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ProvideAnimation(
                  child: InkWell(
                    onTap: () {
                      if (widget.show == Show.text &&
                          widget.showTextField == true) {
                        widget.setTextFieldVisibility(false, Show.text);
                      } else {
                        widget.setTextFieldVisibility(true, Show.text);
                      }
                    },
                    child: Tooltip(
                      message: 'Search',
                      child: Container(
                        padding: EdgeInsets.all(
                          ScreenUtil.instance.setWidth(8),
                        ),
                        decoration: BoxDecoration(
                          color: Styles.whiteColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              ScreenUtil.instance.setHeight(24),
                            ),
                          ),
                        ),
                        child: Icon(Icons.search),
                      ),
                    ),
                  ),
                  transitionFormat: isHidden
                      ? TransitionFormat.rightToLeft
                      : TransitionFormat.leftToRight,
                ),
                SizedBox(
                  width: ScreenUtil.instance.setWidth(8),
                ),
                ProvideAnimation(
                  transitionFormat: isHidden
                      ? TransitionFormat.rightToLeft
                      : TransitionFormat.rightToLeft,
                  child: InkWell(
                    onTap: () {
                      WidgetsBinding.instance.addPostFrameCallback((d) {
                        UserStore user = Provider.of<UserStore>(context);
                        if (user.isNewsHighlightLoading) {
                          showCbSnackbar(
                              'Please wait for the other process to complete',
                              context);
                        } else {
                          user.sortNewResponse();
                        }
                      });
                    },
                    child: Tooltip(
                      message: 'Sort Highlights',
                      child: Container(
                        decoration: BoxDecoration(
                          color: Styles.whiteColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              ScreenUtil.instance.setHeight(24),
                            ),
                          ),
                        ),
                        padding: EdgeInsets.all(
                          ScreenUtil.instance.setWidth(8),
                        ),
                        child: Icon(Icons.date_range),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: ScreenUtil.instance.setWidth(8),
                ),
                InkWell(
                  onTap: () {
                    if (widget.showTextField && widget.show == Show.type) {
                      widget.setTextFieldVisibility(false, Show.type);
                    } else {
                      widget.setTextFieldVisibility(true, Show.type);
                    }
                  },
                  child: Tooltip(
                    message: 'Filter Type',
                    child: Container(
                      decoration: BoxDecoration(
                        color: Styles.whiteColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            ScreenUtil.instance.setHeight(24),
                          ),
                        ),
                      ),
                      padding: EdgeInsets.all(
                        ScreenUtil.instance.setWidth(8),
                      ),
                      child: Icon(Icons.filter_list),
                    ),
                  ),
                ),
              ],
            )
          : SizedBox(),
    );
  }
}
