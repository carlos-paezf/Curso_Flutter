import 'package:flutter/material.dart';

void main() {
  runApp(
    new MaterialApp(
      home: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){

    /**
     * Creacion de variables constantes para usar en varias tarjetas
     */
    final double iconSize = 40.0;
    final double textSize = 40.0;
    /* Puedo convertir en constante una propiedad con sus elemetos */
    final TextStyle textStyle = new TextStyle(
      color: Colors.black87,
      fontSize: 30.0,
    );

    /**
     * El widget Scaffold toma un número de widgets diferentes como argumentos con nombre, 
     * cada uno de los cuales se coloca en el layout del Scaffold en el lugar apropiado.
     * Es tambien conocido como andamiaje
     */
    return new Scaffold(
      /* Titulo del encabezado de la app */
      appBar: new AppBar(
        title: new Text('Aplicacion con Stateless Widgets'),
      ),
      /* Cuerpo del App */
      body: new Container(
        /* Alineacion en el centro */
        child: Center(
          /* Columna de widgets */
          child: new Column(
            /* Expansion en el eje X */
            crossAxisAlignment: CrossAxisAlignment.stretch,
            /* Coleccion de widgets */
            children: <Widget>[
              /* Llamado del Widgets personalizado */

              /* #1 */
              new MyCard(
                title: new Text(
                  'App con Flutter', 
                  style: new TextStyle(
                    color: Colors.black87,
                    fontSize: textSize,
                  ),
                ), 
                icon: new Icon(
                  Icons.add_to_home_screen, 
                  size: iconSize, 
                  color: Colors.redAccent,
                ),
              ),

              /* #2 */
              new MyCard(
                title: new Text(
                  'Stateless: Widgets Inmutables',
                  style: textStyle,
                ), 
                icon: new Icon(
                  Icons.work, 
                  size: iconSize, 
                  color: Colors.lightBlue,
                ),
              ),

              /* #3 */
              new MyCard(
                title: new Text(
                  'Ir a GitHub',
                  style: textStyle,
                ),
                icon: new Icon(
                  Icons.account_circle,
                  size: iconSize,
                  color: Colors.deepPurple,
                ),
              ),

            ],

          ),

        ),

      )

    );

  }

}


/// Widget que emplea la reutilizacion de código y de esa manera,
/// poder ser llamado en varias ocasiones y evitar la redundancia de código
class MyCard extends StatelessWidget{
  /* Variables a adoptar */
  final Widget title;
  final Widget icon;
  /* Constructor */
  MyCard({this.title, this.icon});
  @override
  Widget build(BuildContext context){
    return new Container(
      /* Padding en la parte inferior de cada tarjeta */
      padding: const EdgeInsets.only(bottom: 0.5),
      /* Creacion de las tarjetas */
      child: new Card(
        child: new Container(
          /* Padding entre el texto-icono, de los bordes */
          padding: const EdgeInsets.all(20.0),
          child: Column(
            /* Coleccion de widgets que cambiaran segun el contexto */
            children: <Widget>[
              this.title, 
              this.icon
              ],

          ),

        ),

      ),
      
    );

  }

}