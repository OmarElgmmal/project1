import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/views/auth/thimar_login/states.dart';
import '../../../shared/logic/cache_helper.dart';
import '../../../shared/logic/dio_helper.dart';
import '../../../shared/logic/helper_methods.dart';
import '../../home/view.dart';
import 'model.dart';


class LoginCubit extends Cubit<LoginStates>{
  LoginCubit():super(LoginStates());


  bool isPasswordHidden = true;
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  void login() async {

    if (formKey.currentState!.validate()) {
      emit(LoginLoadingStates());
      final response = await DioHelper().sendData(
        "login",
        data: {
          "phone": phoneController.text,
          "password": passwordController.text,
          "type": Platform.operatingSystem,
          "device_token": "test",
          "user_type": "client",
        },
      );
      print(response.response?.data);

      if (response.isSuccess) {
        final model = UserData.fromJson(response.response!.data);
        await CacheHelper.saveUserData(model.model);
        showMessage(response.message, type: MessageType.success);
        emit(LoginSuccessStates());
        toGetNavigate(const HomeView());
      } else {
        print(response.message);
        showMessage(response.message);
        emit(LoginFailedStates());
      }
    }
    }
}