import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String name;
  ChatScreen({Key key, this.name}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textEditingController =
      new TextEditingController();
  Widget _buildTextComposer() {
    return new Container(
        child: new Row(
      children: <Widget>[
        new Flexible(
          child: new TextField(
            controller: _textEditingController,
          ),
        ),
        new Container(
          child: ClipOval(
            child: Material(
              color: Colors.black, // button color
              child: InkWell(
                splashColor: Colors.grey, // inkwell color
                child: SizedBox(
                  width: 45,
                  height: 45,
                  child: Icon(
                    Icons.send,
                    color: Colors.white,
                    size: 20.0,
                  ),
                ),
                onTap: () {},
              ),
            ),
          ),
        )
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Column(children: <Widget>[
          Container(
            child: _buildTextComposer(),
          )
        ]),
      ),
    );
  }
}
