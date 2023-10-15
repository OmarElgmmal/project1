import 'model.dart';

class MoviesStates{}

class GetMovieIsLoadingState extends MoviesStates{}

class GetMovieSuccessState extends MoviesStates{
  final List<MovieModel> list;

  GetMovieSuccessState({required this.list});
}

class GetMovieFailedState extends MoviesStates{
  final String msg;

  GetMovieFailedState({required this.msg});
}

class GetMoviesFromPaginationLoadingState extends MoviesStates{}
class GetMoviesFromPaginationFailedState extends MoviesStates{
  final String msg;

  GetMoviesFromPaginationFailedState({required this.msg});
}