import 'package:flutter/material.dart';
import 'package:bottom_navigation_bar_widgets/pages/principal.dart';
import 'package:bottom_navigation_bar_widgets/pages/explorar.dart';
import 'package:bottom_navigation_bar_widgets/pages/suscripciones.dart';
import 'package:bottom_navigation_bar_widgets/pages/notificaciones.dart';
import 'package:bottom_navigation_bar_widgets/pages/biblioteca.dart';

void main() {
  runApp(MaterialApp(
    home: MyNavigator(),
  ));
}

class MyNavigator extends StatefulWidget {
  @override
  _MyNavigatorState createState() => _MyNavigatorState();
}

class _MyNavigatorState extends State<MyNavigator>
    with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //Encabezado
        appBar: new AppBar(
          title: new Text('Bottom Navigator Bar Widget'),
          backgroundColor: Colors.grey[900],
        ),
        //Color del cuerpo
        backgroundColor: Colors.grey[850],
        //Cuerpo
        body: new TabBarView(
          //Enlaces a los widgets
          children: <Widget>[
            new Principal(),
            new Explorar(),
            new Suscripciones(),
            new Notificaciones(),
            new Biblioteca()
          ],
          controller: controller,
        ),
        //Barra de navegacion inferior
        bottomNavigationBar: new Material(
            color: Colors.grey[900],
            child: new TabBar(
              //Configuracion de los tabs
              tabs: <Tab>[
                new Tab(
                    icon: new Icon(Icons.home, color: Colors.white70, size: 25),
                    child: new Text('Principal',
                        style: new TextStyle(fontSize: 12))),
                new Tab(
                    icon: new Icon(Icons.explore,
                        color: Colors.white38, size: 25),
                    child: new Text('Explorar',
                        style: new TextStyle(fontSize: 12))),
                new Tab(
                    icon: new Icon(Icons.subscriptions,
                        color: Colors.white38, size: 25),
                    child: new Text('Suscripciones',
                        style: new TextStyle(fontSize: 12.01))),
                new Tab(
                    icon: new Icon(Icons.notifications,
                        color: Colors.white38, size: 25),
                    child: new Text('Notificaciones',
                        style: new TextStyle(fontSize: 11.7))),
                new Tab(
                    icon: new Icon(Icons.video_library,
                        color: Colors.white38, size: 25),
                    child: new Text('Biblioteca',
                        style: new TextStyle(fontSize: 12)))
              ],
              controller: controller,
            )));
  }
}
