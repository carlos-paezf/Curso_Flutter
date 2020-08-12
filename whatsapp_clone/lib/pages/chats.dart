import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/chat_model.dart';
import 'package:whatsapp_clone/pages/chat_screen.dart';

class Chats extends StatefulWidget {
  Chats({Key key}) : super(key: key);

  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messageData.length,
      itemBuilder: (context, i) => new Column(
        children: <Widget>[
          Divider(height: 0.0),
          ListTile(
            leading: new CircleAvatar(
              backgroundImage: AssetImage(messageData[i].imagenURL),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  messageData[i].name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  messageData[i].time,
                  style: TextStyle(color: Colors.black54, fontSize: 13.0),
                ),
              ],
            ),
            subtitle: Container(
                padding: EdgeInsets.only(top: 5.0),
                child: Text(messageData[i].message)),
            onTap: () {
              var route = new MaterialPageRoute(
                  builder: (BuildContext context) =>
                      new ChatScreen(name: messageData[i].name));
              Navigator.of(context).push(route);
            },
          )
        ],
      ),
    );
  }
}
