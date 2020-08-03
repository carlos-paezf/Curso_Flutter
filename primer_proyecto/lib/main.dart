import 'package:flutter/material.dart';

void main(){
  runApp(
    new MaterialApp(
      title: 'Mi primera Aplicacion en Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Mi primera Aplicacion con Flutter')
        ),
        body: new Container(
          child: new Center(
            child: new Text('Hola Mundo')
          )
        )
      )
    )
  );
}