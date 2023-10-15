import 'package:project1/features/categories/model.dart';

class CategoriesStates{}

class CategoryLoadingState extends CategoriesStates{}
class CategorySuccessState extends CategoriesStates{
  final List<CategoryModel> list;
  CategorySuccessState({required this.list});
}
class CategoryFailedState extends CategoriesStates{
  final String msg;
  CategoryFailedState({required this.msg});
}