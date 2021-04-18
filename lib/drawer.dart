import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(
              child: Text(
                "آيسل لخدمة الرد التلقائي",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              alignment: Alignment.bottomCenter,
            ),
            decoration: BoxDecoration(
                color: Colors.white24,
                image: DecorationImage(
                  image: NetworkImage(
                      "https://aisel-sy.com/assets/images/logo.png"),
                )),
          ),
          ListTile(
            title: Text("إضافة وتعديل الردود"),
            leading: Icon(Icons.chat_bubble),
            onTap: () => {Navigator.pushNamed(context, "/pages")},
          ),
        ],
      ),
    );
  }
}
