import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: MyDialog(),
  ));
}

//Crear Clase que extienda de un Stateful Widget
class MyDialog extends StatefulWidget {
  @override
  _MyDialogState createState() => new _MyDialogState();
}

//Enumerador con posibles valores
enum DialogAction{
  yes, 
  no
}

//Estado del widget
class _MyDialogState extends State<MyDialog> {
  //Declaracion de Variables
  String _inputValue = '';

  //Alerta de resultado en consola
  void _alertResult(DialogAction action){
    print('Tu selección es $action');
  }

  //Informacion que se mostrar en la Alerta
  void _showAlert(String value){
    AlertDialog dialog = new AlertDialog(
      content: new Text(
        //Valor pasado por Text Field
        value
      ),
      actions: <Widget>[
        //Botones dentro de la Alerta

        /* Boton SI */
        new FlatButton(
          onPressed: () {
            _alertResult(
              DialogAction.yes
            );
          }, 
          child: new Text(
            'Si'
          )
        ),

        /* Boton NO */
        new FlatButton(
          onPressed: () {
            _alertResult(
              DialogAction.no
            );
          }, 
          child: new Text(
            'No'
          )
        )
      ],
    );
    //Mostrar el dialogo en contexto renderizado
    showDialog(
      context: context, 
      child: dialog
    );
  }

  //Obtener valor de Text Field
  void _onChanged(String value){
    setState(() {
      _inputValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Encabezado
      appBar: new AppBar(
        title: new Text('Alert Dialog Widgets'),
      ),
      //Cuerpo
      body: new Container(
        //Padding entre widgets y bordes
        padding: const EdgeInsets.all(40.0),
        child: new Center(
          child: new Column(
            //Coleccion de widgets
            children: <Widget>[

              /* #1 Campo para ingresar texto */
              new TextField(
                decoration: new InputDecoration(
                  hintText: 'Ingrese el texto aqui:',
                ),
                onChanged: (String value){
                  _onChanged(value);
                },
              ),
              
              //Padding entre Text Field y el Boton de Alerta
              new Padding(padding: new EdgeInsets.all(10.0)),

              /* #2 Boton de Alerta */
              new RaisedButton(
                child: new Text(
                  'Ver Alerta'
                ),
                onPressed: (){
                  _showAlert(
                    //Valor rescatado del Text Field
                    _inputValue
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
