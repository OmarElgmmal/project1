import 'package:dio/dio.dart';

class RegisterController{
  Future<String?> sentData(String phone,String password,String password_confirmation) async{
    try{
      final response = await Dio().post("https://thimar.amr.aait-d.com/api/client_register",data: {
        "phone" : phone,
        "password" : password,
        "password_confirmation" : password_confirmation,
        "fullname" : "fullname",
        "country_id" : 1,
        "city_1" : 7,

      });
      print(response.data);
      return "success";
    }on DioException catch(ex){
      print(ex.response?.data["message"]);
      return ex.response?.data["message"];
    }
  }
}