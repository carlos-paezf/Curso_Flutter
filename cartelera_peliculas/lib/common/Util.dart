final String _imageUrlMedium = 'https://image.tmdb.org/t/p/w300';
final String _imageUrlLarge = 'https://image.tmdb.org/t/p/w500';

//* Obtener los tamaños de las imagenes
String getMediumPictureUrl(String path) => _imageUrlMedium + path;
String getLargePictureUrl(String path) => _imageUrlLarge + path;

//* Mapa de generos, id->valor
Map<int, String> _genreMap = {20: 'Terror', 22: 'Magia'};

//* Convertir en list los valores del map
List<String> genresToList(List<dynamic> genreIds) => genreIds.map((id) => _genreMap[id]).toList();

//* Obtener los valores del list
String getGenreValues(List<dynamic> genreIds){
  StringBuffer buffer = new StringBuffer();
  buffer.writeAll(genresToList(genreIds), ', ');
  return buffer.toString();
}