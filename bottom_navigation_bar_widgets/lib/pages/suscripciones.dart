import 'package:flutter/material.dart';

class Suscripciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Icon(
              Icons.subscriptions,
              size: 150.0,
              color: Colors.white,
            ),
            new Text('Tercera Ventana de Tab',
                style: new TextStyle(fontSize: 40, color: Colors.white))
          ],
        ),
      ),
    );
  }
}
