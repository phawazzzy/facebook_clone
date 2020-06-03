import 'package:facebookclone/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../shared/constant.dart';
import 'package:facebookclone/screens/feeds/feed_content.dart';

class Feeds extends StatefulWidget {
  @override
  _FeedsState createState() => _FeedsState();
}

class _FeedsState extends State<Feeds> {
  final imageUrl =
      "https://avatars1.githubusercontent.com/u/36922198?s=400&u=2f6c001435568e44b18fc5f657062532dcf92758&v=4";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFFCFCFC),
        margin: EdgeInsets.only(
          top: 20.0,
        ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 30.0, right: 22.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Facebook', style: KFBStyle),
                        GestureDetector(
                          onTap: () async => await AuthService().signOut(),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 20.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Color(0xFF484E55),
                            ),
                            child: Center(
                              child: Text(
                                "Clone Mode",
                                style: TextStyle(
                                    fontFamily: 'Avenir-black',
                                    fontSize: 15.0,
                                    color: Color(0xFFFFFFFF)),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 30.0),
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: NetworkImage(imageUrl),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, "/newpost");
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:
                                    Text("write something", style: KMsgStyle),
                              ),
                              height: 50,
                              decoration: BoxDecoration(
                                color: Color(0xFFFCFCFC),
                                border: Border.all(
                                    color: Color(0xFFE7E9ED), width: 2.0),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
//                      child: TextField(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return FeedContent();
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



