class MoviesData {
  late final int page;
  late final List<MovieModel> list;
  late final int totalPages;
  late final int totalResults;

  MoviesData.fromJson(Map<String, dynamic> json){
    page = json['page'];
    list = List.from(json['results']).map((e)=>MovieModel.fromJson(e)).toList();
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}

class MovieModel {
  late final bool adult;
  late final String backdropPath;
  late final List<int> genreIds;
  late final int id;
  late final String originalLanguage;
  late final String originalTitle;
  late final String overview;
  late final double popularity;
  late final String? posterPath;
  late final String releaseDate;
  late final String title;
  late final bool video;
  late final double? voteAverage;
  late final int voteCount;

  MovieModel.fromJson(Map<String, dynamic> json){
    adult = json['adult'];
    backdropPath = json['backdrop_path']==null? "https://img.freepik.com/free-vector/404-error-tech-poster_24908-77787.jpg?w=740&t=st=1696818388~exp=1696818988~hmac=519e24e42f4829b8ae18617f2a8503beac7cb9e1ceaecabef551e689028177ef":"http://image.tmdb.org/t/p/original${json['backdrop_path']}";
    genreIds = List.castFrom<dynamic, int>(json['genre_ids']);
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = double.tryParse(json['popularity'].toString())??0;
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = double.tryParse(json['vote_average'].toString())??0;
    voteCount = json['vote_count'];
  }
}