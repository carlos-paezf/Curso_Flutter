import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/chat_model.dart';
import 'package:whatsapp_clone/models/status_model.dart';

class Estados extends StatefulWidget {
  Estados({Key key}) : super(key: key);

  @override
  _EstadosState createState() => _EstadosState();
}

//! Estados de los contactos
class _EstadosState extends State<Estados> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          new ListTile(
            leading: new CircleAvatar(
              backgroundImage: AssetImage(statusdata[0].imageURL),
              foregroundColor: Theme.of(context).accentColor,
              backgroundColor: Colors.grey,
            ),
            title: Text(
              statusdata[0].name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(statusdata[0].time),
          ),
          //! Separacion entre mi estado y los recientes
          new Container(
              padding: EdgeInsets.only(top: 2.0, left: 15.0),
              child: Text('Recientes')),
          new ListTile(
            leading: new CircleAvatar(
              backgroundImage: AssetImage(statusdata[1].imageURL),
              foregroundColor: Theme.of(context).accentColor,
              backgroundColor: Colors.grey,
            ),
            title: Text(
              statusdata[1].name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(statusdata[1].time),
          ),
          //! Separacion entre los recientes y los ya vistos
          new Container(
              padding: EdgeInsets.only(top: 2.0, left: 15.0),
              child: Text('Vistos')),
          new ListTile(
            leading: new CircleAvatar(
              backgroundImage: AssetImage(statusdata[3].imageURL),
              foregroundColor: Theme.of(context).accentColor,
              backgroundColor: Colors.grey,
            ),
            title: Text(
              statusdata[3].name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(statusdata[3].time),
          ),
          new ListTile(
            leading: new CircleAvatar(
              backgroundImage: AssetImage(statusdata[2].imageURL),
              foregroundColor: Theme.of(context).accentColor,
              backgroundColor: Colors.grey,
            ),
            title: Text(
              statusdata[2].name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(statusdata[2].time),
          ),
        ],
      ),
    );
  }
}
