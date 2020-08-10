import 'package:flutter/material.dart';
//Para la nueva libreria configuramos el archivo pubspec.yaml en
//seccion english word= ^3.1.5
import 'package:english_words/english_words.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Infinite List View',
      //Retirar la cinta de debug
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primarySwatch: Colors.purple),
      home: RandomWords(title: 'Infinite List View'),
    );
  }
}

class RandomWords extends StatefulWidget {
  RandomWords({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  //Lista de palabras en pares
  final _suggestions = <WordPair>[];
  //Lista de palabras guardadas por el usuario, no se repiten dentro de la lista
  final _saved = new Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        //Icono de menu en la esquina del encabezado
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.linear_scale), onPressed: _pushSaved)
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  //Funcion de Mostrar items guardados
  void _pushSaved() {
    //Enrutar a la nueva pagina
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      //variable con el mapeado de la lista _saved
      final tiles = _saved.map((pair) {
        return new ListTile(
          title: Text(pair.asPascalCase),
        );
      });
      //Separacion entre items
      final divided =
          ListTile.divideTiles(context: context, tiles: tiles).toList();
      return new Scaffold(
        appBar: AppBar(
          title: Text('Items Guardados'),
        ),
        body: new ListView(children: divided),
      );
    }));
  }

  //Funcion de lista de sugerencias de palabras
  Widget _buildSuggestions() {
    //Recibe el contexto y el indice
    return ListView.builder(itemBuilder: (context, i) {
      //Si el indice es impar se retorna una division
      if (i.isOdd) return new Divider();
      //Dividir el indice en 2
      final index = i ~/ 2;
      //Cada vez que se cumple la condicion, se toman 10 elementos mas en la lista
      if (index >= _suggestions.length) {
        _suggestions.addAll(generateWordPairs().take(10));
      }
      //Retorna las filas con cada palabra segun su indice
      return _buildRow(_suggestions[index]);
    });
  }

  //Funcion que construye las filas con las palabras
  Widget _buildRow(WordPair pair) {
    //Si elemento es seleccionado para guardar, añadirlo a la lista de guardado
    final bool alreadySaved = _saved.contains(pair);
    //Imprimir en consola el elmento seleccionado
    for (var item in _saved) {
      print(item);
    }
    return ListTile(
      title: Text(pair.asPascalCase),
      //Si solo aparece el borde del icono, no se ha guardado.
      //Si aparece el icono con relleno, el item se ha guardado
      trailing: Icon(alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: Colors.purple),
      //Al presionar en la fila de la lista
      onTap: () {
        setState(() {
          //Si el item esta guardado y se vuelve a seleccionar, eliminarlo del Guardar
          if (alreadySaved) {
            _saved.remove(pair);
          //Si no esta guardado, y se presiona, guardar en la lista
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}
