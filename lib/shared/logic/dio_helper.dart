import 'package:dio/dio.dart';


class DioHelper
{
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://thimar.amr.aait-d.com/api/"
    ),
  );
  Future<CustomResponse>sendData(String endPoint,{Map<String,dynamic>? data})async{
    try{
      final response = await _dio.post(
        endPoint,
        data: data,
      );
      return CustomResponse(message: response.data["message"], isSuccess: true,response: response);
    } on DioException catch(ex){
      return CustomResponse(message: ex.response?.data["message"]??"", isSuccess: false,response: ex.response);
    }
  }

  void getData(){}

}


class CustomResponse
{
  late final String message;
  late final bool isSuccess;
  late final Response? response;

  CustomResponse({required this.message,required this.isSuccess,this.response});

}
