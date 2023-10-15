import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/features/categories/model.dart';
import 'package:project1/features/categories/states.dart';
import 'package:project1/shared/logic/dio_helper.dart';


class CategoriesCubit extends Cubit<CategoriesStates>{
  CategoriesCubit() :super(CategoriesStates());
  
  Future<void> getData()async{
    emit(CategoryLoadingState());
    final response =await DioHelper().getData("categories");
    if(response.isSuccess){
      final model = CategoriesData.fromJson(response.response!.data);
      emit(CategorySuccessState(list: model.list));
    } else{
      emit(CategoryFailedState(msg: response.message));
    }
  }
}