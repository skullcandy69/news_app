import 'dart:core';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:news_app/database/database.dart';
import 'package:news_app/services/preference_service.dart';
import 'package:news_app/services/user_service.dart';
import 'package:news_app/utils/string_value.dart';
import 'package:news_app/utils/styles.dart';
import 'package:url_launcher/url_launcher.dart';

final preferenceService = PreferenceService.getInstance();
final userService = UserService.getInstance();
final DatabaseHelper databaseHelper = DatabaseHelper.getInstance();

//Screen size
final double defaultHeight = 812;
final double defaultWidth = 375;

showCbSnackbar(String text, BuildContext context) {
  if (context != null) {
    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            text,
            style: Styles.snackTextStyle,
          ),
          duration: Duration(milliseconds: 2000),
        ),
      );
  }
}

showCbToast(String text) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 1,
      fontSize: Styles.textTagFont);
}

networkErrorDialog(BuildContext context, {@required Function onConfirm}) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          title: Text(
            StringValue.networkError,
            style: TextStyle(
                color: Styles.secondaryColor, fontSize: Styles.smallFont),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                StringValue.retry.toUpperCase(),
                style: TextStyle(
                    color: Styles.primaryColor, fontSize: Styles.smallFont),
              ),
              onPressed: onConfirm,
            ),
          ],
        ),
      );
    },
  );
}

launchURL(String yourUrl) async {
  String url = yourUrl;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

enum Show { text, type }
