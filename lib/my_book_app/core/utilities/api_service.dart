import 'package:dio/dio.dart';
class ApiServices
{
  final Dio dio;
  ApiServices({required this.dio});
  Future<Map<String,dynamic>>get ({required String endPoint})async{
   var response= await dio.get('https://www.googleapis.com/books/v1/$endPoint');
   return response.data;
  }

}