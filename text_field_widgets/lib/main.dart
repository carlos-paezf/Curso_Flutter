import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: MyTextField(),
  ));
}


//Extender el campo de texto de StatefulWidgets
class MyTextField extends StatefulWidget {
  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  //Declaracion de Variables
  String inputValue = '';
  //Crear el controlador del campo de Texto
  final TextEditingController controller = new TextEditingController();

  //Funcion para el envio del texto
  void onSubmitted(String value) {
    setState(() {
      //Crear un widgets tipo historial de busqueda recientes
      inputValue = value + '\n' + inputValue;
      //Resetear el input text, luego de cada envio
      controller.text = '';
    });
  }
  //Sobrescritura de metodo para renderizar el contexto
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Encabezado
      appBar: AppBar(
        title: new Text('Text Field Widgets'),
        backgroundColor: Colors.deepPurple,
      ),
      //Cuerpo
      body: new Container(
        padding: const EdgeInsets.all(50.0),
        child: new Center(
          child: new Column(
            //Arreglo de widgets
            children: <Widget>[
              /* #1 Campo de Texto */
              new TextField(
                decoration:
                    new InputDecoration(hintText: 'Ingrese el texto aqui:'),
                //llamada a la funcion
                onSubmitted: (String value) {
                  onSubmitted(value);
                },
                //llamada al controlador
                controller: controller,
              ),
              //Padding entre inputText y Label
              new Padding(padding: new EdgeInsets.all(10.0)),
              /* #2 Label de Historial */
              new Text(
                inputValue,
                style: new TextStyle(
                  fontSize: 20.0,
                  color: Colors.grey
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
