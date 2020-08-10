import 'package:flutter/material.dart';

class Camara extends StatefulWidget {
  Camara({Key key}) : super(key: key);

  @override
  _CamaraState createState() => _CamaraState();
}

class _CamaraState extends State<Camara> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text('Camara')
    );
  }
}