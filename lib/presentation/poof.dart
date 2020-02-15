import 'package:flutter/material.dart';
import 'package:news_app/presentation/splash_page.dart';

class Poof extends StatelessWidget {
  static const String routeNamed = 'Poof';

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((d) {
      Navigator.pushReplacementNamed(context, SplashPage.routeNamed);
    });
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
