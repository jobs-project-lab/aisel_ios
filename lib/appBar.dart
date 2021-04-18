import 'package:flutter/material.dart';

class Bar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final String title;
  final bool allowBack;

  Bar(
    this.title,
    this.allowBack, {
    Key key,
  })  : preferredSize = Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
        textDirection: TextDirection.rtl,
      ),
      backgroundColor: Colors.red,
      automaticallyImplyLeading: true,
      leading: allowBack
          ? IconButton(
              icon: Icon(Icons.chevron_left),
              onPressed: () {
                Navigator.pop(context);
              })
          : null,
      centerTitle: true,
      actions: <Widget>[
        PopupMenuButton<String>(itemBuilder: (BuildContext context) {
          return [
            PopupMenuItem(
                child: Container(
              alignment: Alignment.topRight,
              child: Text(
                "من نحن",
                textDirection: TextDirection.rtl,
              ),
            )),
            PopupMenuItem(
                child: Container(
                    child: Text("التحقق من وجود تحديثات"),
                    alignment: Alignment.topRight)),
          ];
        })
      ],
    );
  }
}
