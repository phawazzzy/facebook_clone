import 'package:facebookclone/screens/wrapper.dart';
import 'package:facebookclone/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'screens/auth_page.dart';
import 'screens/new_post.dart';
import 'screens/feeds/feeds.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return StreamProvider<FirebaseUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Facebook',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Wrapper(),
        routes: {
//        "/": (BuildContext context) => AuthPage(),
          "/newpost": (BuildContext context) => NewPost(),
          "/feeds": (BuildContext context) => Feeds()
        }
      ),
    );
  }
}