import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key key}) : super(key: key);
  //Ruta
  static const String route = '/settings';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Text('Configuración'),
        ),
        body: new Container(
          child: Center(child: new Text('Pantalla de Configuración')),
        ));
  }
}
