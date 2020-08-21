import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
//!!!!!! Por seguridad se omite el archivo, pero su estructura es final API_KEY = '########';
import 'package:cartelera_peliculas/common/Constants.dart';
import '../model/Media.dart';

class HttpHandler {
  //! Propiedades
  final String _baseURL = 'api.themoviedb.org';
  final String _lenguaje = 'en-US';

  //! Método principal para:
  //* - Hacer la llamada a Http.
  //* - Tomar la respuesta para usarlo en otros métodos.
  //? Las llamadas al API se hacen de manera async por lo tanto recibiremos un response future
  Future<dynamic> getJson(Uri uri) async {
    http.Response response = await http.get(uri);
    return json.decode(response.body);
  }

  //! Prueba para retornar un string
  /*
  Future<String> fectMovies(){
    var uri = new Uri.https(_baseURL, '3/movies/popular', {
      'api_key': API_KEY,
      'page': '3',
      'language': _lenguaje,
    });
    return getJson(uri).then((data) => data.toString());
  }
  */

  //! Renderizando el Json en forma de lista
  Future<List<Media>> fetchMovies() {
    var uri = new Uri.https(_baseURL, '3/movies/popular', {
      'api_key': API_KEY,
      'page': '1',
      'language': _lenguaje,
    });
    return getJson(uri).then(((data) =>
        data['results'].map<Media>((item) => new Media(item)).toList()));
  }
}
