import 'package:flutter/material.dart';

class Video extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Column(
        children: <Widget>[
          new Icon(
            Icons.ondemand_video,
            size: 150.0,
            color: Colors.purple,
          ),
          new Text('Segunda Ventana de Tab')
        ],
      ),
    );
  }
}