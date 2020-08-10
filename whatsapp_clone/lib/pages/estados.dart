import 'package:flutter/material.dart';

class Estados extends StatefulWidget {
  Estados({Key key}) : super(key: key);

  @override
  _EstadosState createState() => _EstadosState();
}

class _EstadosState extends State<Estados> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text('Estados'),
    );
  }
}