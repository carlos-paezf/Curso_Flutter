import 'package:flutter/material.dart';

class Camara extends StatefulWidget {
  Camara({Key key}) : super(key: key);
  @override
  _CamaraState createState() => _CamaraState();
}

//! Widget para la funcion de activar la Camara
class _CamaraState extends State<Camara> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Camara')
    );
  }
}