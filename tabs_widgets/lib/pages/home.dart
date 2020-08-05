import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Column(
        children: <Widget>[
          new Icon(
            Icons.home,
            size: 150.0,
            color: Colors.red,
          ),
          new Text('Primera Ventana de Tab')
        ],
      ),
    );
  }
}