import 'package:flutter/material.dart';
import 'screens/auth_page.dart';
import 'screens/new_post.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Facebook',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "/newpost",
      routes: {
        "/": (BuildContext context) => MyHomePage(),
        "/newpost": (BuildContext context) => NewPost(),
      }
    );
  }
}