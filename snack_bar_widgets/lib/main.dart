import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SnackBar Widgets',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MySnackBar(title: 'SnackBar Widgets'),
    );
  }
}

class MySnackBar extends StatelessWidget {
  const MySnackBar({Key key, this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: new MyButton(title: 'Deplegar SnackBar'),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({Key key, this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      child: Text(title),
      //Al tocar en el boton se debe mostrar:
      onPressed: () {
        //...el widget Snackbar con la siguiente funcion
        Scaffold.of(context).showSnackBar(
            //Creacion de un Snackbar
            new SnackBar(
          content: Text('Este es un SnackBar'),
          duration: new Duration(seconds: 5),
          //Se le puede otorgar una accion al snackbar
          action: new SnackBarAction(
            label: 'Click Here',
            //Al presionar me direcciona a otro snackbar en este caso
            onPressed: () {
              Scaffold.of(context).showSnackBar(new SnackBar(
                content: Text('Segundo SnackBar'),
                duration: new Duration(seconds: 5),
              ));
            },
          ),
        ));
      },
    );
  }
}
