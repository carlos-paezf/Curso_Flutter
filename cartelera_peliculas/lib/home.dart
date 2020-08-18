import 'package:flutter/material.dart';
import 'media_list.dart';

class MyHomePage extends StatefulWidget {
  //! Constructor
  MyHomePage({Key key, this.title}) : super(key: key);
  //! Variables
  final String title;
  //* Sobrescritura del método
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //! Variables

  //! Sobrescritura del método
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //! Cabecera de la página
      appBar: AppBar(
        //? Titulo acompañado de subtitulo
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          //? Arreglo para tener el acompañamiento del subtitulo
          children: <Widget>[
            Text(
              widget.title,
            ),
            //? Visibilidad del subtitulo
            Visibility(
              visible: true,
              child: Text('Lista de Peliculas',
                  style: TextStyle(fontSize: 15.0, color: Colors.white70)),
            ),
          ],
        ),
        //! Acompañamiento de Iconos
        actions: <Widget>[
          //? Icono de buscar
          IconButton(
              icon: Icon(Icons.search, color: Colors.white), onPressed: () {}),
          //? Icono de detalles
          IconButton(
              icon: Icon(Icons.details, color: Colors.purple[50], size: 20.0),
              onPressed: () {})
        ],
      ),
      //! Menú lateral
      drawer: new Drawer(
        child: new ListView(children: <Widget>[
          //? Encabezado de la lista
          new DrawerHeader(child: Material()),
          //? Listado de opciones
          new ListTile(
              title: Text('Cine', style: TextStyle(fontSize: 17)),
              trailing: new Icon(Icons.local_movies, color: Colors.white)),
          new Divider(height: 5.0),
          new ListTile(
              title: Text('Televisión', style: TextStyle(fontSize: 17)),
              trailing: new Icon(Icons.tv, color: Colors.white)),
          new Divider(height: 5.0),
          new ListTile(
              title: Text('Salir', style: TextStyle(fontSize: 17)),
              trailing: new Icon(Icons.exit_to_app, color: Colors.white),
              onTap: () => Navigator.of(context).pop()),
          new Divider(
            height: 5.0,
          ),
        ]),
      ),
      //! Cuerpo de la aplicación
      body: PageView(
        children: <Widget>[
          new MediaList()
        ]
      ),
      //! Pestañas en la parte inferior de la aplicación
      bottomNavigationBar: BottomNavigationBar(items: _getFooterItems()),
    );
  }

  //! Método para las pestañas inferiores
  List<BottomNavigationBarItem> _getFooterItems() {
    return [
      new BottomNavigationBarItem(
          icon: Icon(Icons.play_circle_outline, color: Colors.white),
          title: Text('Populares', style: TextStyle(color: Colors.white))),
      new BottomNavigationBarItem(
          icon: Icon(Icons.update, color: Colors.white),
          title: Text('Próximamente', style: TextStyle(color: Colors.white))),
      new BottomNavigationBarItem(
          icon: Icon(Icons.star_border, color: Colors.white),
          title: Text('Mejor Ranking', style: TextStyle(color: Colors.white))),
    ];
  }
}
