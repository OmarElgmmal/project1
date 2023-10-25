import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/views/auth/confirm_code/states.dart';
import '../../../shared/logic/dio_helper.dart';
import '../../../shared/logic/helper_methods.dart';
import '../thimar_login/view.dart';
import '../thimar_password/view.dart';

class ConfirmCodeCubit extends Cubit<ConfirmCodeStates>
{
  ConfirmCodeCubit(): super(ConfirmCodeStates());

  bool isTimerFinished = false;
  final formKey = GlobalKey<FormState>();
  final codeController = TextEditingController();
  final phoneController = TextEditingController();
  bool isLoading = false;

  Future<void> resend({required String phone}) async{
    await DioHelper().sendData("resend_code", data:
        {
          "phone" :phone,
        }
    );
  }

  void verify({required bool isActive,required String phone}) async {

    final response = await DioHelper().sendData("verify", data: {
      "code": codeController.text,
      "type": Platform.operatingSystem,
      "device_token": "test",
      "phone":phone,
    });
    if (response.isSuccess) {
      showMessage(response.message, type: MessageType.success);
      if(isActive){
        toGetNavigate(const ThimarLogin());
      } else {
        toGetNavigate(const ThimarPassword());
      }
    } else {
      showMessage(response.message);
    }
    isLoading = false;
  }
}