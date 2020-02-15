import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/models/screen_arguments.dart';
import 'package:news_app/presentation/animation/provide_animation_widget.dart';
import 'package:news_app/presentation/custom/custom_text_widget.dart';
import 'package:news_app/utils/styles.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsViewPage extends StatelessWidget {
  static const String routeNamed = 'QuestionViewPage';
  final ScreenArguments arguments;
  final bool isHome;

  NewsViewPage({this.arguments, this.isHome = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: isHome?Styles.blueColor:Styles.amber,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: ScreenUtil.instance.setHeight(40),
            ),
            _titleWidget(),
            _upperContainer(),
            _dragWidget(),
          ],
        ),
      ),
    );
  }

  Widget _titleWidget() {
    return Flexible(
      child: ProvideAnimation(
        transitionFormat: TransitionFormat.rightToLeft,
        child: Container(
          padding: EdgeInsets.all(
            ScreenUtil.instance.setWidth(16),
          ),
          margin: EdgeInsets.only(
            left: ScreenUtil.instance.setWidth(32),
            top: ScreenUtil.instance.setWidth(16),
            bottom: ScreenUtil.instance.setWidth(16),
          ),
          decoration: BoxDecoration(
            color: isHome?Styles.amber:Styles.blueColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                ScreenUtil.instance.setHeight(32),
              ),
              bottomLeft: Radius.circular(
                ScreenUtil.instance.setHeight(32),
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: CustomTextWidget(
                  'Title : ',
                  textStyle: TextStyle(
                      fontSize: Styles.smallFont, fontWeight: FontWeight.bold),
                ),
              ),
              Flexible(
                flex: 1,
                child: CustomTextWidget(
                  arguments.news.title,
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Styles.redColor,
                    fontSize: Styles.smallFont,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _upperContainer() {
    return Expanded(
      child: Hero(
        tag: arguments.news.urlToImage != null
            ? arguments.news.urlToImage + arguments.news.id.toString()
            : arguments.news.publishedAt + arguments.news.id.toString(),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: arguments.news.urlToImage != null
                  ? NetworkImage(
                      arguments.news.urlToImage,
                    )
                  //TODO add an default image
                  : AssetImage(''),
            ),
          ),
        ),
      ),
    );
  }

  void dragHere(DraggableDetails details) {
    print(details.offset);
    launch(arguments.news.url);
  }

  Widget _dragWidget() {
    return Expanded(
      child: ProvideAnimation(
        transitionFormat: TransitionFormat.leftToRight,
        child: Draggable(
          childWhenDragging: Container(),
          feedback: Container(
              height: ScreenUtil.instance.setHeight(280),
              child: _lowerContainer()),
          axis: Axis.horizontal,
          onDragEnd: dragHere,
          child: _lowerContainer(),
        ),
      ),
    );
  }

  Widget _lowerContainer() {
    return Container(
      margin: EdgeInsets.only(
        right: ScreenUtil.instance.setWidth(24),
        top: ScreenUtil.instance.setHeight(16),
      ),
      decoration: BoxDecoration(
        color: isHome?Styles.amber:Styles.blueColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(
            ScreenUtil.instance.setWidth(80),
          ),
          bottomRight: Radius.circular(
            ScreenUtil.instance.setWidth(80),
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil.instance.setWidth(32),
        vertical: ScreenUtil.instance.setHeight(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              constraints: BoxConstraints(
                maxWidth:
                    ScreenUtil.instance.setHeight(ScreenUtil.instance.width),
                maxHeight: ScreenUtil.instance.setHeight(100),
              ),
              child: CustomTextWidget(
                arguments.news.description,
                textStyle: TextStyle(
                  fontSize: Styles.textTagFont,
                ),
              ),
            ),
          ),
          SizedBox(
            height: ScreenUtil.instance.setHeight(8),
          ),
          Expanded(
            flex: 2,
            child: Container(
              constraints: BoxConstraints(
                maxWidth:
                    ScreenUtil.instance.setHeight(ScreenUtil.instance.width),
                maxHeight: ScreenUtil.instance.setHeight(100),
              ),
              child: CustomTextWidget(
                arguments.news.url,
                isTappable: true,
                textStyle: TextStyle(
                  fontSize: Styles.textTagFont,
                  color: Styles.darkBlue,
                ),
              ),
            ),
          ),
          SizedBox(
            height: ScreenUtil.instance.setHeight(8),
          ),
          Expanded(
            flex: 2,
            child: Container(
              constraints: BoxConstraints(
                maxWidth:
                    ScreenUtil.instance.setHeight(ScreenUtil.instance.width),
                maxHeight: ScreenUtil.instance.setHeight(100),
              ),
              child: CustomTextWidget(
                'Swipe Left  or Tap on the Url For More Details about news',
                isTappable: false,
                textStyle: TextStyle(
                  fontSize: Styles.textTagFont,
                  color: Styles.redColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
