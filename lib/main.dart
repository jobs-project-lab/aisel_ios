import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:test_1/pages.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  // check if is running on Web
  if (kIsWeb) {
    // initialiaze the facebook javascript SDK
    FacebookAuth.instance.webInitialize(
      appId: "245334946489238", //<-- YOUR APP_ID
      cookie: true,
      xfbml: true,
      version: "v9.0",
    );
  }
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  // ignore: non_constant_identifier_names
  bool is_loggedIn = false;
  Map userData = {};
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
          builder: (context) => Scaffold(
                body: is_loggedIn
                    ? new Pages()
                    : Center(
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 100,
                              width: double.infinity,
                              child: Image.network(
                                  "https://aisel-sy.com/assets/images/logo.png"),
                              margin: EdgeInsets.only(top: 300),
                            ),
                            ElevatedButton.icon(
                              label: Text(
                                  "الدخول باستخدام فيسبوكhttps://github.com/jobs-project-lab/aisel_ios.git"),
                              icon: Icon(Icons.login),
                              style: ElevatedButton.styleFrom(
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(35)),
                                  padding: EdgeInsets.all(20)),
                              onPressed: () async {
                                print("getting user token");
                                List<String> permessions = [
                                  "public_profile",
                                  "email",
                                  "pages_show_list",
                                  "pages_read_user_content",
                                  "pages_read_engagement",
                                  "pages_manage_engagement",
                                  "pages_messaging",
                                  "pages_manage_metadata"
                                ];
                                LoginResult res = await FacebookAuth.instance
                                    .login(permissions: permessions);
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                setState(() {
                                  prefs.setString(
                                      'token', res.accessToken.token);
                                  is_loggedIn = true;
                                });
                              },
                            )
                          ],
                        ),
                      ),
              )),
    );
  }
}
