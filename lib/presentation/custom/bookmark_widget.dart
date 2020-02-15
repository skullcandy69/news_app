import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/models/news.dart';
import 'package:news_app/stores/user_store.dart';
import 'package:news_app/utils/styles.dart';
import 'package:provider/provider.dart';

class BookMarkWidget extends StatefulWidget {
  final bool isMarked;
  final News news;

  BookMarkWidget({this.isMarked = false, this.news});

  @override
  _BookMarkWidgetState createState() => _BookMarkWidgetState();
}

class _BookMarkWidgetState extends State<BookMarkWidget> {
  bool isMarked;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isMarked = widget.isMarked;
  }

  @override
  Widget build(BuildContext context) {
    return isMarked
        ? Container()
        : InkWell(
            onTap: () {
              setState(() {
                isMarked = !isMarked;
              });
              WidgetsBinding.instance.addPostFrameCallback((Duration duration) {
                Provider.of<UserStore>(context).storeFavoriteNews(widget.news);
              });
            },
            child: Container(
              padding: EdgeInsets.all(
                ScreenUtil.instance.setWidth(8),
              ),
              child: Icon(
                isMarked ? Icons.bookmark : Icons.bookmark_border,
                color: Styles.amber,
              ),
            ),
          );
  }
}
