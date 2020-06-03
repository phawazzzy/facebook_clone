
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../shared/constant.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
class NewPost extends StatefulWidget {
  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  File _image;
  final _picker = ImagePicker();


  Future getImage() async {
    final pickedFile  = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedFile.path);
    });
    print(_image);
  }

  final String imageUrl = "https://avatars1.githubusercontent.com/u/36922198?s=400&u=2f6c001435568e44b18fc5f657062532dcf92758&v=4";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 20.0, left: 30.0, right: 22.0),
        child: SafeArea(
          child: SingleChildScrollView(
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
                    )),
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage(imageUrl),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
                          child: TextFormField(
                            onChanged: (value) {
                              print(value);
                            },
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
                          border: Border.all(color: Color(0xFFE7E9ED), width: 2.0),
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
                    child: FlatButton(
                      onPressed: () async{
                        await getImage();
                      },
                      child: Icon(
                        Icons.add_a_photo,
                        size: 40.0,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                child: _image == null ? Text("No image selected.") : Image.file(_image),
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
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
