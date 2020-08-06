import 'package:flutter/material.dart';

class Explorar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Icon(
              Icons.explore,
              size: 150.0,
              color: Colors.white,
            ),
            new Text('Segunda Ventana de Tab',
                style: new TextStyle(fontSize: 40, color: Colors.white))
          ],
        ),
      ),
    );
  }
}
