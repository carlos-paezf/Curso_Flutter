import '../common/Util.dart';

class Media {
  int id;
  double voteAverage;
  String title;
  String posterPath;
  String backdropPath;
  String overview;
  String releaseDate;
  List<dynamic> genreIds;

  //! Método para obtener las imagenes
  String getPosterUrl() => getMediumPictureUrl(posterPath);
  String getBackDropUrl() => getLargePictureUrl(backdropPath);
  String getGenres() => getGenreValues(genreIds);

  //! Constructor de tipo factory
  factory Media(Map jsonMap){
    return new Media.deserialize(jsonMap);
  }

  //! Obteniendo los datos desde el json
  Media.deserialize(Map json):
    id = json['id'].toInt(),
    voteAverage = json['vote_average'].toDoble(),
    title = json['title'],
    posterPath = json['poster_path'] ?? '',
    backdropPath = json['backdrop_path'] ?? '',
    overview = json['overview'],
    releaseDate = json['release_date'],
    genreIds = json['genre_ids'].toList();
}
