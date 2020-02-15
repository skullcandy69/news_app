import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/presentation/custom/custom_scroll_Widget.dart';
import 'package:news_app/presentation/feed_page.dart';
import 'package:news_app/presentation/home_page.dart';
import 'package:news_app/stores/user_store.dart';
import 'package:news_app/utils/globals.dart';
import 'package:news_app/utils/string_value.dart';
import 'package:news_app/utils/styles.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  static const String routeNamed = 'SplashPage';

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool isHomeSelected = true;
  Widget _widget = HomePage();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((Duration duration) {
      Provider.of<UserStore>(context).fetchFavNews();
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
        width: defaultWidth, height: defaultHeight, allowFontScaling: true)
      ..init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: GestureDetector(
        onHorizontalDragStart: (DragStartDetails details) {
          if (details.localPosition == 1.0) {
            if (!isHomeSelected) {
              setState(() {
                isHomeSelected = false;
                _widget = HomePage();
              });
            } else {
              setState(() {
                isHomeSelected = true;
                _widget = FeedPage();
              });
            }
          }
        },
        child: Container(
          color: isHomeSelected ? Styles.amber : Styles.blueColor,
          padding: EdgeInsets.only(
            top: ScreenUtil.instance.setHeight(32),
          ),
          child: Stack(
            children: <Widget>[
              _widget,
              _floatingBottomTabBar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _floatingBottomTabBar() {
    return Positioned(
      bottom: ScreenUtil.instance.setHeight(16),
      left: ScreenUtil.instance.setWidth(32),
      right: ScreenUtil.instance.setWidth(32),
      child: Card(
        elevation: 14,
        shape: BeveledRectangleBorder(
          borderRadius:
              BorderRadius.circular(ScreenUtil.instance.setHeight(35)),
        ),
        child: Container(
          height: ScreenUtil.instance.setHeight(70),
          width: ScreenUtil.instance.setWidth(290),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Styles.blackColor.withOpacity(0.16),
                blurRadius: ScreenUtil.instance.setHeight(30),
              ),
            ],
            color: Styles.whiteColor,
            borderRadius: BorderRadius.all(
              Radius.circular(ScreenUtil.instance.setHeight(35)),
            ),
          ),
          child: CustomScrollWidget(
            isSelected: isHomeSelected,
            firstTab: StringValue.home,
            secondTab: StringValue.feeds,
            primaryColor: Styles.whiteColor,
            secondaryColor: Styles.amber,
            leftPosition: 55,
            rightPosition: 200,
            onSelection: (bool value) {
              print('came value is ${value}');
              if (value) {
                setState(() {
                  isHomeSelected = value;
                  _widget = HomePage();
                });
              } else {
                setState(() {
                  isHomeSelected = value;
                  _widget = FeedPage();
                });
              }
            },
          ),
        ),
      ),
    );
  }
}
