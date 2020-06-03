import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../shared/constant.dart';
import 'package:facebookclone/services/auth.dart';
import 'package:facebookclone/shared/loading.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email;
  String password;
  String error = '';
  bool regLoading = false;
  bool logLoading = false;


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
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) => email = value,
                        validator: (value) => value.isEmpty ? 'this field can\t be empty' : null,
                        controller: _emailController,
                        decoration: InputDecoration(
                            hintText: "Email Address", hintStyle: kInputTextStyle),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        onChanged: (value) => password = value,
                        validator: (value) => value.length < 6 ? 'password character must be at least 6' : null,
                        obscureText: true,
                        controller: _passwordController,
                        decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: kInputTextStyle),
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
                      Text(error.isEmpty ? '' : error  , style: TextStyle(color: Colors.red, fontSize: 18.0),),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child: Buttons(
                                loading: logLoading,
                                text: 'Sign in',
                                color: Color(0xFF1977F1),
                                onTap: () {
                              print('working');
                              Navigator.pushNamed(context, '/newpost');
                            }),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 4,
                            child: Buttons(
                              loading: regLoading,
                                text: 'Register',
                                color: Color(0xFF131F38),
                                onTap: () async{
                              try{
                                if(_formKey.currentState.validate()) {
                                  setState(() => regLoading = true);
                                  dynamic result = await _auth.registerUserWithEmailAndPassword(email, password);
                                  if (result == null) {
                                    setState(() => regLoading = false);
                                    error = 'something went wrong';
                                  } else {
                                    setState(() => regLoading = false);
                                    Navigator.pushReplacementNamed(context, '/feeds');
                                  }
                                }
                              }catch(e){

                              }
                            }),
                          )
                        ],
                      ),
                    ],
                  ),
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
  final bool loading;

  Buttons({this.text, this.color, this.onTap, this.loading});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.0,
        child: Center(
          child: loading ? Loading(): Text(text, style: KButtonTextStyle),
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(40),
        ),
      ),
    );
  }
}
