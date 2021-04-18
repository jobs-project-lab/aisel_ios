import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test_1/drawer.dart';
import 'appBar.dart';
import 'package:shimmer/shimmer.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'posts.dart';

void main() {
  runApp(Pages());
}

class Pages extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Page();
  }
}

class Page extends State<Pages> {
  List pages = [];
  bool is_loading = false;
  String token;
  @override
  // ignore: must_call_super
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => loadPages());
  }

  void loadPages() async {
    setState(() {
      is_loading = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();

    token = (prefs.getString('token') ?? "");

    var url = "https://aisel-sy.com/api/getToken.php";
    Map data = {'token': token};
    http.Response response = await http.post(url, body: data);
    var result = jsonDecode(response.body);
    url = "https://aisel-sy.com/api/get_pages.php";
    data = {'token': result["token"], 'lang_code': 'ar', 'country': 'SY'};
    response = await http.post(url, body: data);
    result = jsonDecode(response.body);
    List pgs = result;
    pgs.removeWhere((element) => element["name"] == null);
    for (var page in pgs) {
      var graphResponse = await http.get(
          'https://graph.facebook.com/v8.0/me?fields=picture.width(500).height(500)&access_token=${page["access_token"]}');
      var image = jsonDecode(graphResponse.body);
      pages.add({
        'name': page["name"],
        'image': image["picture"]['data']['url'],
        'token': page["access_token"]
      });
    }
    setState(() {
      is_loading = false;
    });
  }

  void getPosts(String pageToken) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Posts(),
            settings: RouteSettings(arguments: pageToken)));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "الصفحات",
      initialRoute: "/",
      routes: {'/pages': (context) => Pages()},
      home: Builder(
          builder: (context) => Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                  appBar: Bar("الصفحات", false),
                  drawer: AppDrawer(),
                  body: Container(
                    child: Center(
                      child: Container(
                          child: is_loading
                              ? Shimmer.fromColors(
                                  period: Duration(seconds: 1),
                                  child: Column(
                                    children: <Row>[
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Column>[
                                            Column(children: <Widget>[
                                              Container(
                                                  height: 50,
                                                  width: 50,
                                                  margin: EdgeInsets.only(
                                                      top: 20,
                                                      bottom: 10,
                                                      left: 20,
                                                      right: 20),
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.grey))
                                            ]),
                                            Column(
                                              children: <Widget>[
                                                Container(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Colors.grey,
                                                    ),
                                                    width: 200,
                                                    height: 10,
                                                    margin: EdgeInsets.only(
                                                      top: 30,
                                                      bottom: 10,
                                                      left: 20,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Colors.grey,
                                                    ),
                                                    width: 200,
                                                    height: 10,
                                                    margin: EdgeInsets.only(
                                                      top: 10,
                                                      bottom: 10,
                                                      left: 20,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                          ]),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Column>[
                                            Column(children: <Widget>[
                                              Container(
                                                  height: 50,
                                                  width: 50,
                                                  margin: EdgeInsets.only(
                                                      top: 20,
                                                      bottom: 10,
                                                      left: 20,
                                                      right: 20),
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.grey))
                                            ]),
                                            Column(
                                              children: <Widget>[
                                                Container(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Colors.grey,
                                                    ),
                                                    width: 200,
                                                    height: 10,
                                                    margin: EdgeInsets.only(
                                                      top: 30,
                                                      bottom: 10,
                                                      left: 20,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Colors.grey,
                                                    ),
                                                    width: 200,
                                                    height: 10,
                                                    margin: EdgeInsets.only(
                                                      top: 10,
                                                      bottom: 10,
                                                      left: 20,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                          ]),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Column>[
                                            Column(children: <Widget>[
                                              Container(
                                                  height: 50,
                                                  width: 50,
                                                  margin: EdgeInsets.only(
                                                      top: 20,
                                                      bottom: 10,
                                                      left: 20,
                                                      right: 20),
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.grey))
                                            ]),
                                            Column(
                                              children: <Widget>[
                                                Container(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Colors.grey,
                                                    ),
                                                    width: 200,
                                                    height: 10,
                                                    margin: EdgeInsets.only(
                                                      top: 30,
                                                      bottom: 10,
                                                      left: 20,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Colors.grey,
                                                    ),
                                                    width: 200,
                                                    height: 10,
                                                    margin: EdgeInsets.only(
                                                      top: 10,
                                                      bottom: 10,
                                                      left: 20,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                          ]),
                                    ],
                                  ),
                                  baseColor: Colors.grey[600],
                                  highlightColor: Colors.red[100],
                                  direction: ShimmerDirection.rtl,
                                )
                              : RefreshIndicator(
                                  onRefresh: () async {
                                    setState(() {
                                      is_loading = true;
                                      pages = [];
                                      loadPages();
                                    });
                                  },
                                  child: ListView.builder(
                                      itemCount: pages.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Card(
                                            child: Container(
                                          margin: EdgeInsets.only(bottom: 10),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: <Column>[
                                                Column(children: <Widget>[
                                                  Container(
                                                      height: 75,
                                                      width: 75,
                                                      margin: EdgeInsets.only(
                                                          top: 20,
                                                          bottom: 10,
                                                          right: 20),
                                                      padding: EdgeInsets.only(
                                                          bottom: 10),
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          image: DecorationImage(
                                                              image: NetworkImage(
                                                                  pages[index][
                                                                          "image"]
                                                                      .toString()),
                                                              fit:
                                                                  BoxFit.fill)))
                                                ]),
                                                Column(
                                                  children: <Widget>[
                                                    Container(
                                                      child: Container(
                                                        child: Text(pages[index]
                                                                ["name"]
                                                            .toString()),
                                                        width: 200,
                                                        margin: EdgeInsets.only(
                                                          top: 30,
                                                          bottom: 10,
                                                          left: 20,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Container(
                                                        width: 200,
                                                        child: ElevatedButton(
                                                          child: Text(
                                                              "اختر هذه الصفحة"),
                                                          onPressed: () => {
                                                            getPosts(
                                                                pages[index]
                                                                    ['token'])
                                                          },
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ]),
                                        ));
                                      }))),
                    ),
                  )))),
    );
  }
}
