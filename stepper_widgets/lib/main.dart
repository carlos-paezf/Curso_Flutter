import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: MyStepper(),
  ));
}

class MyStepper extends StatefulWidget {
  @override
  _MyStepperState createState() => _MyStepperState();
}

class _MyStepperState extends State<MyStepper> {
  //Declaracion de Variables
  int _currentStep = 0;
  //Lista de pasos
  List<Step> mySteps = [
    /* Paso #1 */
    new Step(title: new Text('Paso 1'), content: new Text('Aprender Flutter')),
    /* Paso #2 */
    new Step(title: new Text('Paso 2'), content: new Text('Desarrollar Apps')),
    /* Paso #3 */
    new Step(title: new Text('Paso 3'), content: new Text('Publicar las Apps'))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Encabezado
      appBar: new AppBar(title: new Text('Stepper Widgets')),
      //Cuerpo
      body: new Container(
          child: Center(
        //Pasos
        child: new Stepper(
          //Paso actual
          currentStep: this._currentStep,
          //Lista de Pasos
          steps: mySteps,
          //Tipo de lista de pasos
          type: StepperType.horizontal,
          //Al dar en boton continuar
          onStepContinue: () {
            setState(() {
              if (_currentStep < mySteps.length - 1) {
                _currentStep = _currentStep + 1;
              } else {
                _currentStep = 0;
              }
            });
          },
          //Al dar en el boton cancelar
          onStepCancel: () {
            setState(() {
              if (_currentStep > 0) {
                _currentStep = _currentStep - 1;
              } else {
                _currentStep = 0;
              }
            });
          },
          //Al seleccionar un paso en desorden
          onStepTapped: (step) {
            setState(() {
              _currentStep = step;
            });
          },
        ),
      )),
    );
  }
}
