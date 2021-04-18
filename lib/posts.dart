import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'appBar.dart';
import 'drawer.dart';
import 'pages.dart';

void main() {
  runApp(Posts());
}

class Posts extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Post();
  }
}

class Post extends State<Posts> {
  bool isLoading = true;
  List posts = [];
  String token;
  void loadPosts() async {
    token = ModalRoute.of(context).settings.arguments.toString();
  }

  @override
  // ignore: must_call_super
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => loadPosts());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {'/pages': (context) => Pages()},
      title: "المنشورات",
      home: Builder(
        builder: (context) => Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
              appBar: Bar("المنشورات", false),
              drawer: AppDrawer(),
              body: Container(
                child: isLoading
                    ? Center(
                        child: Container(
                            margin: EdgeInsets.only(top: 50),
                            child: Column(
                              children: <Widget>[
                                CircularProgressIndicator(),
                                Text("جار تحميل المنشورات")
                              ],
                            )))
                    : RefreshIndicator(
                        child: NestedScrollView(
                            headerSliverBuilder:
                                (BuildContext context, bool innerBoxScrolled) {
                              return <Widget>[
                                SliverList(
                                  delegate: SliverChildListDelegate([]),
                                ),
                              ];
                            },
                            body: Container(
                                margin: EdgeInsets.only(top: 50),
                                child: Column(
                                  children: <Widget>[Text("تم التحميل")],
                                ))),
                        onRefresh: () async {
                          setState(() {
                            isLoading = true;
                          });
                        }),
              )),
        ),
      ),
    );
  }
}
