import 'package:project1/features/get_cities/model.dart';

class GetCitiesStates{}
class GetCitiesLoadingStates extends GetCitiesStates{}
class GetCitiesSuccessStates extends GetCitiesStates{
  final List<CityModel> list;
  GetCitiesSuccessStates({required this.list});
}
class GetCitiesFailedStates extends GetCitiesStates{}