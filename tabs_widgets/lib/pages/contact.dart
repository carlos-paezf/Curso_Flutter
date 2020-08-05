import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Column(
        children: <Widget>[
          new Icon(
            Icons.contacts,
            size: 150.0,
            color: Colors.deepOrange,
          ),
          new Text('Tercera Ventana de Tab')
        ],
      ),
    );
  }
}