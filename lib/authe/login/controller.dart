import 'dart:io';

import 'package:dio/dio.dart';


class LoginViewController {
  Future<String> sendData({required String phone,required String password}) async {
    try
    {
      print(Platform.operatingSystem);
      final response = await Dio().post("https://thimar.amr.aait-d.com/api/login",
        data:
        {
          "phone" : phone,
          "password" : password,
          "type" : Platform.operatingSystem,
          "device_token" : "test",
          "user_type" : "client",

        },);
      print(response.data);
      return "Success";
    } on DioException catch(ex){
      print(ex.response!.data["message"]);
      return ex.response!.data["message"];
    }
  }
}