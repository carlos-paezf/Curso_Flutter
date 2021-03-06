import 'package:flutter/material.dart';
import 'common/HttpHandler.dart';
import 'model/Media.dart';
import 'media_list_item.dart';

class MediaList extends StatefulWidget {
  MediaList({Key key}) : super(key: key);
  @override
  _MediaListState createState() => _MediaListState();
}

class _MediaListState extends State<MediaList> {
  //! Atributos
  List<Media> _media = new List();

  //! Sobrescritura de métodos
  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  //? Función para rescatar los elementos de la lista
  void loadMovies() async {
    var movies = await HttpHandler().fetchMovies();
    setState(() {
      _media.addAll(movies);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new ListView.builder(
        itemCount: _media.length,
        itemBuilder: (BuildContext context, int index) {
          return MediaListItem();
        },
      ),
    );
  }
}
