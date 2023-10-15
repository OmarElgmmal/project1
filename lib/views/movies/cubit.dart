import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'model.dart';
import 'states.dart';


class MoviesCubit extends Cubit<MoviesStates>{
  MoviesCubit():super(MoviesStates());

  final List<MovieModel> _list = [];
  int pageNumber = 1;

  void getData({bool paginationLoading = false})async{
    if(paginationLoading)
    {
      emit(GetMoviesFromPaginationLoadingState(),);
    } else{
      emit(GetMovieIsLoadingState(),);

    }
    try{
      final response = await Dio().get("https://api.themoviedb.org/3/discover/movie?api_key=2001486a0f63e9e4ef9c4da157ef37cd&page=$pageNumber");
      print(response.data);
      var model = MoviesData.fromJson(response.data);
      if(model.list.isNotEmpty)
      {
        pageNumber++;
        _list.addAll(model.list);
      }
      emit(GetMovieSuccessState(
        list: _list,
      ),);
    } on DioException catch (ex){
      if(paginationLoading)
      {
        emit(GetMoviesFromPaginationFailedState(
          msg: ex.response!.data["errors"][0],
        ),);

      } else{
        emit(GetMovieFailedState(
          msg: ex.message??"Failed",
        ),);
      }
      print(ex.message);
    }
  }
}