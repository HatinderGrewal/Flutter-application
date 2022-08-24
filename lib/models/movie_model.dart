class MovieModel{

  String imdbID='';
  String title='';
  String year='';
  String poster='';

  MovieModel.empty();

  MovieModel.fromJson(Map<String,dynamic> json){
    imdbID = json['imdbID'] ?? '';
    title = json['title'] ?? '';
    year = json['year'] ?? '';
    poster = json['Poster'] ?? '';
  }

  @override
  String toString() {
    return 'MovieModel{imdbID: $imdbID, title: $title, year: $year, poster: $poster}';
  }
}