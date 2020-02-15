import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:news_app/presentation/animation/route_transition.dart';
import 'package:news_app/presentation/home_page.dart';
import 'package:news_app/presentation/news_view_page.dart';
import 'package:news_app/presentation/poof.dart';
import 'package:news_app/presentation/splash_page.dart';
import 'package:news_app/stores/user_store.dart';
import 'package:news_app/utils/string_value.dart';
import 'package:news_app/utils/styles.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    return MultiProvider(
      providers: [
        Provider<UserStore>.value(value: UserStore()),
      ],
      child: MaterialApp(
        title: StringValue.appTitle,
        theme: ThemeData(
          scaffoldBackgroundColor: Styles.whiteColor,
          fontFamily: Styles.ralewayRegularFontFamily,
        ),
        initialRoute: Poof.routeNamed,
        routes: {
          SplashPage.routeNamed: (BuildContext context) => SplashPage(),
          Poof.routeNamed: (BuildContext context) => Poof(),
        },
        onGenerateRoute: _onGenerateRoute,
      ),
    );
  }

  RouteTransition _onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomePage.routeNamed:
        return RouteTransition(
          child2: this,
          child1: Scaffold(body: HomePage()),
          duration: Duration(milliseconds: 400),
          transitionType: TransitionType.Slide,
        );
    }
  }
}
