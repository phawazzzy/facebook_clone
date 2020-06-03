import 'package:flutter/material.dart';
import 'constant.dart';

class InputTextField extends StatefulWidget {
  @override
  _InputTextFieldState createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NewTextField(),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class NewTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      maxLines: null,
      maxLength: null,
      decoration: InputDecoration.collapsed(
        hintText: 'write something',
        hintStyle: KMsgStyle,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFE7E9ED),
          ),
        ),
      ),
    );
  }
}
