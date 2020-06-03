import 'package:flutter/material.dart';
import 'package:facebookclone/shared/constant.dart';

class BottomSheetContent extends StatefulWidget {
  @override
  _BottomSheetContentState createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  String imageUrl =
      "https://avatars1.githubusercontent.com/u/36922198?s=400&u=2f6c001435568e44b18fc5f657062532dcf92758&v=4";
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
                  fontSize: 20.0),
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
                              fontFamily: 'Avenir-heavy'),
                          children: <TextSpan>[
                            TextSpan(
                                text: "   4 hours ago",
                                style: TextStyle(
                                    color: Color(0xFFC4C4C4),
                                    fontFamily: 'Avenir-heavy'))
                          ]),
                    ),
                    subtitle: Text(
                      "Lorem ipsum dolor sit amet, consectetur",
                      style: TextStyle(
                          color: Color(0xFF242424), fontFamily: 'Avenir-black'),
                    ),
                  );
                }),
          ),
          SingleChildScrollView(
            child: Row(
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
                IconButton(
                    icon: Icon(
                      Icons.send,
                      color: Color(0xFF1977F1),
                      size: 30,
                    ),
                    onPressed: null)
              ],
            ),
          )
        ],
      ),
    );
  }
}
