import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: MyButtom(),
  ));
}

//Clase que extiende de StatefulWidget, donde sobrescribimos el metodo
//que nos permite manejar el estado de nuestro widget, a la vez de que es
//notificado cada vez que hacemos una actualizacion en el widget.
class MyButtom extends StatefulWidget {
  @override
  _MyButtomState createState() => new _MyButtomState();
}

//Clase que renderiza el contexto de nuestro widget
class _MyButtomState extends State<MyButtom> {
  //Instanciacion de variables
  String flutterText = '';
  int index = 0;
  List<String> collections = [
    'Hello World',
    'こんにちは世界',
    'Hola Mundo',
    'Ciao mondo',
    'Olá mundo',
    'Γειά σου Κόσμε',
  ];

  //Metodo para cada vez que se presione el boton
  void onPressButton() {
    //Estado del Widget
    setState(() {
      //Asumir el tamaño de la lista
      int itemCount = collections.length - 1;
      flutterText = collections[index];
      //Operador condicional ternario para el cambio de estado
      index = index < itemCount ? index + 1 : index = 0;
    });
  }

  //Sobrescritura del metodo para renderizar el contexto
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      /* Encabezado de la Aplicación */
      appBar: new AppBar(
        title: new Text('Stateful Widgets'),
        backgroundColor: Colors.deepOrange,
      ),

      /* Cuerpo de la Aplicación */
      body: new Container(
        //Centrado
        child: Center(
          child: new Column(
            //Alineacion del widget
            mainAxisAlignment: MainAxisAlignment.center,
            //Coleccion de widgets
            children: <Widget>[
              /* #1 */
              new Text(
                flutterText,
                style: new TextStyle(fontSize: 50.0),
              ),

              //Padding entre widgets
              new Padding(padding: new EdgeInsets.all(10.0)),

              /* #2 */
              new RaisedButton(
                child: new Text(
                  'Actualizar',
                  style: new TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                  ),
                ),
                color: Colors.blueAccent,
                onPressed: onPressButton,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
