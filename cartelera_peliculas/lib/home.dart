import 'package:flutter/material.dart';

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
  //* Sobrescritura del método
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
      drawer: new Drawer(),
      //! Cuerpo de la aplicación
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
      //! Pestañas en la parte inferior de la aplicación
      bottomNavigationBar: BottomNavigationBar(items: _getFooterItems()),
    );
  }

  //! Método para las pestañas inferiores
  List<BottomNavigationBarItem> _getFooterItems() {
    return [
      new BottomNavigationBarItem(
          icon: Icon(Icons.play_circle_outline), title: Text('Populares')),
      new BottomNavigationBarItem(
          icon: Icon(Icons.update), title: Text('Próximamente')),
      new BottomNavigationBarItem(
          icon: Icon(Icons.star_border), title: Text('Mejor Ranking')),
    ];
  }
}
