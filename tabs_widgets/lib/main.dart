import 'package:flutter/material.dart';
//Importar las clases de nuestro widgets
import 'package:tabs_widgets/pages/home.dart';
import 'package:tabs_widgets/pages/video.dart';
import 'package:tabs_widgets/pages/contact.dart';

void main() {
  runApp(new MaterialApp(
    home: MyTabs(),
  ));
}

class MyTabs extends StatefulWidget {
  @override
  _MyTabsState createState() => _MyTabsState();
}

//Añadir la clase SingleTickerProviderStateMixin para la animacion
class _MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin {
  //Crear Controllador para nuestro tab
  TabController controller;
  //Sobrescribir el metodo
  @override
  void initState() {
    super.initState();
    //Instanciar el controlador con la cantidad de tabs y la animacion
    controller = new TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Encabezado
      appBar: new AppBar(
        title: new Text('Tabs Widgets'),
        backgroundColor: Colors.red[900],
        //Botones para la navegacion en el tab
        bottom: new TabBar(
          //Coleccion de iconos en el tab
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.home)),
            new Tab(icon: new Icon(Icons.ondemand_video)),
            new Tab(icon: new Icon(Icons.contacts))
          ],
          //Controlador
          controller: controller,
        ),
      ),
      //Cuerpo
      body: new TabBarView(
        //Coleccion de widgets con funcionalidades
        children: <Widget>[
          new Home(),
          new Video(),
          new Contact()
        ],
        //Controlador de los widgets
        controller: controller
      ),
    );
  }
}
