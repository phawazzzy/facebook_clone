import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:facebookclone/shared/constant.dart';
import 'package:facebookclone/screens/feeds/bottom_sheet.dart';

class FeedContent extends StatefulWidget {
  @override
  _FeedContentState createState() => _FeedContentState();
}

class _FeedContentState extends State<FeedContent> {
  final imageUrl =
      "https://avatars1.githubusercontent.com/u/36922198?s=400&u=2f6c001435568e44b18fc5f657062532dcf92758&v=4";
  Color iconHeartColor = Colors.grey;

  void changeColor() {
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
                      fontFamily: 'Avenir-heavy',
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15.0),
                              topRight: Radius.circular(15.0),
                            ),
                          ),
                          builder: (BuildContext context) => BottomSheetContent(),
                        );
                      },
                      child: CommentContainer(),
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

class CommentContainer extends StatelessWidget {
  const CommentContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: Padding(
        padding: EdgeInsets.only(left: 10.0, bottom: 1.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "write Comments",
            style: KMsgStyle,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: Color(0xFFFCFCFC),
        border:
            Border.all(color: Color(0xFFE7E9ED), width: 2.0),
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }
}
