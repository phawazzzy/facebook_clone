import 'package:flutter/material.dart';
import '../constant.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void useText() {
    print(_emailController.text);
    if (_emailController.text.length < 3) {
      print('invalid range');
    }
    print(_passwordController.text);
  }

  @override
  void initState() {
    _emailController.addListener(useText);
    _passwordController.addListener(useText);
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
                    style: KFBStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    "Connect with friends and Stay safe",
                    style: KConnectStyle,
                  ),
                ),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      hintText: "Email Address", hintStyle: kInputTextStyle),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                      hintText: "Password", hintStyle: kInputTextStyle),
                ),
                SizedBox(
                  height: 20,
                ),
                RichText(
                  text: TextSpan(
                    text: 'By Signing up, you agree to the ',
                    style: TextStyle(
                        color: Colors.grey, fontFamily: 'Avenir-black'),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Terms and Condition',
                          style: TextStyle(color: Colors.blue)),
                      TextSpan(text: ' of this service'),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Buttons('Sign in', Color(0xFF1977F1), () {
                        print('working');
                        Navigator.pushNamed(context, '/newpost');
                      }),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 4,
                      child: Buttons('Register', Color(0xFF131F38), () {
                        print('working');
                      }),
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
  final Function onTap;

  Buttons(this.text, this.color, this.onTap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.0,
        child: Center(
          child: Text(text, style: KButtonTextStyle),
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(40),
        ),
      ),
    );
  }
}
