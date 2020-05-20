import 'package:flutter/material.dart';
import 'constant.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 100.0, left: 40.0, right: 40.0),
//        color: Colors.white,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    'Facebook',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 30.0,
                        fontFamily: 'avenir',
                        fontWeight: FontWeight.w900),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    "Connect with friends and Stay safe",
                    style: TextStyle(
                        color: Color(0xFF242424),
                        fontSize: 30.0,
                        fontFamily: 'avenir',
                        fontWeight: FontWeight.w900),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Enter Address",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 20.0)),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 20.0)),
                ),
                SizedBox(
                  height: 20,
                ),
                RichText(
                  text: TextSpan(
                    text: 'By Signing up, you agree to the ',
                    style: TextStyle(color: Colors.grey),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Terms and condition',
                          style: TextStyle(color: Colors.blue)),
                      TextSpan(text: ' of this service'),
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Buttons('Sign in', Color(0xFF1977F1)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Buttons('Register', Color(0xFF131F38)),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  final String text;
  final Color color;

  Buttons(this.text, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      child: Center(
        child: Text(text, style: KButtonTextStyle),
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(40),
      ),
    );
  }
}
