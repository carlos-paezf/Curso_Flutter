import 'package:flutter/material.dart';
import 'package:cartelera_peliculas/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cartelera de Peliculas',
        //* Desactivar el check de Debug
      debugShowCheckedModeBanner: false,
        //? Tema Dia
      theme: ThemeData.light(),
        //? Tema Noche
      darkTheme: ThemeData.dark(),
        //! Titulo para el Stateful Widget
      home: MyHomePage(title: 'Cartelera de Peliculas'),
    );
  }
}

