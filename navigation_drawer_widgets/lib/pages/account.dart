import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  const Account({Key key}) : super(key: key);
  //Ruta
  static const String route = '/account';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Text('Cuenta'),
        ),
        body: new Container(
          child: Center(child: new Text('Perfil del Usuario')),
        ));
  }
}
