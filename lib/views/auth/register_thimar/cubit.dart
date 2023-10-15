import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/views/auth/register_thimar/states.dart';
import '../../../features/get_cities/model.dart';
import '../../../shared/logic/dio_helper.dart';
import '../../../shared/logic/helper_methods.dart';
import '../confirm_code/view.dart';


class RegisterCubit extends Cubit<RegisterStates>{
  RegisterCubit():super(RegisterStates());

  CityModel? selectedCity;
  final formKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isLoading = false;

  void register() async {
    if (formKey.currentState!.validate())
    {
      emit(RegisterLoadingStates());
      final response = await DioHelper().sendData("client_register", data: {
        "fullname": fullNameController.text,
        "password": passwordController.text,
        "password_confirmation": confirmPasswordController.text,
        "phone": phoneController.text,
        "country_id": 1,
        "city_id": selectedCity!.id,
      });
      if (response.isSuccess) {
        showMessage(response.message, type: MessageType.success);
        emit(RegisterSuccessStates());
        toGetNavigate(
          ConfirmCode(
            isActive: true,
            phone: phoneController.text,
          ),
        );
      } else {
        showMessage(response.message);
        emit(RegisterFailedStates());
      }
    }
  }
}