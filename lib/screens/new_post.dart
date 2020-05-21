import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../constant.dart';

class NewPost extends StatefulWidget {
  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 20.0, left: 30.0, right: 22.0),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  GestureDetector(
                      child: Icon(
                    Icons.send,
                    color: Colors.blue,
                    size: 40,
                  ))
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://avatars1.githubusercontent.com/u/36922198?s=400&u=2f6c001435568e44b18fc5f657062532dcf92758&v=4"),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          maxLength: null,
                          decoration: InputDecoration.collapsed(
                            hintText: "Write something",
                            hintStyle: KMsgStyle,
                          ),
                        ),
                      ),
                      height: 100,
                      decoration: BoxDecoration(
//                          color: Colors.grey,
                        border: Border.all(color: Colors.grey, width: 2.0),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
//                      child: TextField(),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 40,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.camera_alt, size: 50.0,),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
//                child: Text("this pic"),
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://avatars1.githubusercontent.com/u/36922198?s=400&u=2f6c001435568e44b18fc5f657062532dcf92758&v=4'),
                    
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

