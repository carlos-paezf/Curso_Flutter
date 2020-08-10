import 'package:flutter/material.dart';

class Llamadas extends StatefulWidget {
  Llamadas({Key key}) : super(key: key);

  @override
  _LlamadasState createState() => _LlamadasState();
}

class _LlamadasState extends State<Llamadas> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text('Llamadas'),
    );
  }
}