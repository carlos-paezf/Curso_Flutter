import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigator Router Widgets',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Navigator Router Widgets'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  //Agregar parametros cada vez que se llame la clase
  const MyHomePage({Key key, this.title}) : super(key: key);
  //Parametro a llamar
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
          child: new RaisedButton(
              child: new Text('Ir a siguiente pág'),
              onPressed: () {
                //Rutas para navegar
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        //Redireccionar a una nueva ventana
                        builder: (context) => new Second()));
              })),
    );
  }
}

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nueva Ventana de Navegación'),
      ),
      body: Center(
          child: new RaisedButton(
              child: new Text('Regresar'),
              onPressed: () {
                //Redireccionar a la ventana anterior
                Navigator.pop(context);
              })),
    );
  }
}
