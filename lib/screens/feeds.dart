import 'package:flutter/material.dart';
import '../constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flat_icons_flutter/flat_icons_flutter.dart';

const imageUrl =
    "https://avatars1.githubusercontent.com/u/36922198?s=400&u=2f6c001435568e44b18fc5f657062532dcf92758&v=4";

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
                        Container(
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
                                  fontSize: 20.0,
                                  color: Color(0xFFFFFFFF)),
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
                                    Text("write Something", style: KMsgStyle),
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
//                shrinkWrap: true,
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

class FeedContent extends StatefulWidget {
  @override
  _FeedContentState createState() => _FeedContentState();
}

class _FeedContentState extends State<FeedContent> {
  Color iconHeartColor = Colors.grey;

  Color changeColor() {
    setState(() {
      if (iconHeartColor == Colors.grey) {
        iconHeartColor = Color(0xFFEF0124);
      } else {
        iconHeartColor = Colors.grey;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFFFFFF),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage(imageUrl),
              ),
              title: Text(
                'Kareem Fawas',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Avenir-heavy',
                    fontSize: 20.0),
              ),
              subtitle: Text("4 hours ago"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 19.0),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad',
                style: TextStyle(fontFamily: 'Avenir-roman'),
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15.0),
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage("$imageUrl"),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: <Widget>[
                  IconButton(
                      splashColor: Colors.yellow,
                      icon: Icon(
                        FontAwesomeIcons.solidHeart,
                        size: 30.0,
                        color: iconHeartColor,
                      ),
                      onPressed: () {
                        print('got clicked');
                        changeColor();
                      }),
                  Text(
                    "24 likes",
                    style: TextStyle(
                        color: Color(0xFFEF0124),
                        fontSize: 20.0,
                        fontFamily: 'Avenir-heavy'),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet<void>(
                            context: context,
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15.0),
                                topRight: Radius.circular(15.0),
                              ),
                            ),
                            builder: (BuildContext context) {
                              return BottomSheetContent();
                            });
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.0, bottom: 1.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("write Comments", style: KMsgStyle),
                          ),
                        ),
//                      height: 100,
                        decoration: BoxDecoration(
                          color: Color(0xFFFCFCFC),
                          border:
                              Border.all(color: Color(0xFFE7E9ED), width: 2.0),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
//                      child: TextField(),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BottomSheetContent extends StatefulWidget {
  @override
  _BottomSheetContentState createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              "Comments",
              style: TextStyle(
                  color: Color(0xFF242424),
                  fontFamily: 'Avenir-black',
                fontSize: 20.0
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage(imageUrl),
                    ),
                    title: RichText(
                      text: TextSpan(
                          text: "Kareem Fawas",
                          style: TextStyle(
                            color: Color(0xFF1977F1),
                            fontFamily: 'Avenir-heavy'
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: "   4 hours ago",
                                style: TextStyle(
                                  color: Color(0xFFC4C4C4),
                                    fontFamily: 'Avenir-heavy'
                                ))
                          ]),
                    ),
                    subtitle: Text(
                      "Lorem ipsum dolor sit amet, consectetur",
                      style: TextStyle(color: Color(0xFF242424),
                          fontFamily: 'Avenir-black'),
                    ),
                  );
                }),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      maxLength: null,
                      decoration: InputDecoration.collapsed(
                        hintText: "Write Comment",
                        hintStyle: KMsgStyle,
                      ),
                    ),
                  ),
                  height: 50,
                  decoration: BoxDecoration(
//                          color: Colors.grey,
                    border: Border.all(color: Color(0xFFE7E9ED), width: 2.0),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
//                      child: TextField(),
                ),
              ),
              IconButton(icon: Icon(Icons.send, color: Color(0xFF1977F1), size: 30,), onPressed: null)
            ],
          )
        ],
      ),
    );
  }
}
