import 'package:dio/dio.dart';

class LoginController{
  Future<String?> sentData(String phone,String password) async{
    try{
      final response = await Dio().post("https://thimar.amr.aait-d.com/api/login",data: {
        "phone" : phone,
        "password" : password,
        "type" : "android",
        "device_token" : "test",
        "user_type" : "client"
      });
      print(response.data);
      return "success";
    }on DioException catch(ex){
      print(ex.response?.data["message"]);
      return ex.response?.data["message"];
    }
  }
}