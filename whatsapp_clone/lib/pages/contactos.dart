import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/contacts_model.dart';
import 'package:whatsapp_clone/pages/chat_screen.dart';

class Contacts extends StatefulWidget {
  Contacts({Key key}) : super(key: key);

  @override
  _ContactsState createState() => _ContactsState();
}

//! Lista de Total de Contactos en telefono
class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //? Cabecera de menu y cantidad de contactos
            Text(
              'Contactos',
            ),
            Visibility(
              visible: true,
              child: Text(
                '4 contactos',
                style: TextStyle(
                  fontSize: 12.0,
                ),
              ),
            ),
          ],
        ),
        //? Buscar Contactos y mas Opciones
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          )
        ],
      ),
      body: ListView.builder(
      itemCount: contactData.length,
      itemBuilder: (context, i) => new Column(
        children: <Widget>[
          Divider(height: 0.0),
          ListTile(
            leading: new CircleAvatar(
              backgroundImage: AssetImage(contactData[i].imagenURL),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  contactData[i].name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            subtitle: Container(
                padding: EdgeInsets.only(top: 5.0),
                child: Text(contactData[i].status)),
            onTap: () {
              var route = new MaterialPageRoute(
                  builder: (BuildContext context) =>
                      new ChatScreen(name: contactData[i].name));
              Navigator.of(context).push(route);
            },
          )
        ],
      ),
    ),
    );
  }
}