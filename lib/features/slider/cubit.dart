import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/features/slider/states.dart';
import '../../shared/logic/dio_helper.dart';
import 'model.dart';

class SliderCubit extends Cubit<SliderStates>{
  SliderCubit() : super(SliderStates());


  Future<void> getData()async{
    emit(GetSliderLoadingStates());
    final response = await DioHelper().getData("sliders");
    print(response.response!.data);
    if(response.isSuccess){
      final model = SliderData.fromJson(response.response!.data);
      emit(GetSliderSuccessStates(list: model.list));
    } else {
      emit(GetSliderFailedStates(msg: response.message));
    }
  }
}