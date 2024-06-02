import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Utils/api.dart';
import '../Utils/app_constant.dart';
import 'dio_interceptor.dart';


class DataProvider{
  final DioInterceptor dioInterceptor;
  Dio _dio=Dio();
  DataProvider({required this.dioInterceptor}){
    _dio=Dio();
    _dio..options.baseUrl=Api.baseUrl
      ..options.connectTimeout = const Duration(seconds: 50)
      ..options.receiveTimeout = const Duration(seconds: 50)
    //  ..options.receiveDataWhenStatusError=true
      ..options.headers={
        'Content-Type': 'application/json',
      };
    _dio.interceptors.add(dioInterceptor);

    //https://ahmedyusuf.medium.com/secure-flutter-project-with-ssl-pinning-45b18458022e
    //https://dwirandyh.medium.com/securing-your-flutter-app-by-adding-ssl-pinning-474722e38518
    //Enable to ssl pinning
    // (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
    //   ByteData bytes = CertReader.getCert()!;
    //   SecurityContext sc = SecurityContext();
    //   sc.setTrustedCertificatesBytes(bytes.buffer.asUint8List());
    //   HttpClient httpClient = HttpClient(context: sc);
    //   return httpClient;
    // };

  }


  Future<Response> getDataWithParams({required String urlEndPoint, required Map<String, dynamic> data})async{
    try{
      final p=await SharedPreferences.getInstance();
      var token=p.getString('');
      var response = await _dio.get(urlEndPoint, queryParameters: data, options: Options(headers: {'Authorization':'$token',}));
      return response;

    }on DioException  catch(ex){
      if(ex.response?.statusCode==401){
        ////print("401 response print: ${ex.response?.data}');
        Fluttertoast.showToast(msg: '${ex.response?.data}');
      }else if(ex.response?.statusCode==400){

        Fluttertoast.showToast(msg: '${ex.response?.data['message']}');
      }else if (ex.response?.statusCode==429){
        // Fluttertoast.showToast(msg: '${ex.response?.data}');
        // Utils.showCustomFlutterToast(ex.response?.data);
      }else if(ex.response?.statusCode==403){
        // navigatorKey.currentState?.pushNamedAndRemoveUntil(AppConstant.loginRoute, (route) => false);
        Fluttertoast.showToast(msg: 'Session expired');
      }
      if(ex.type == DioErrorType.connectionTimeout){
        throw Exception("Connection  Timeout Exception");
      }
      throw Exception(ex.message);
    }
  }
  Future<Response> getDataWithParamsWithoutToken({required String urlEndPoint, required Map<String, dynamic> data})async{
    try{
      var response = await _dio.get(urlEndPoint, data: data);

      return response;

    }on DioException  catch(ex){
      throw Exception(ex.message);
    }
  }
  Future<Response> postData({required String urlEndPoint,required Map<String, dynamic> data})async{
    try{
      final p=await SharedPreferences.getInstance();
      var token=p.getString('');

      String jsonString = jsonEncode(data);

      var response = await _dio.post(urlEndPoint, data: jsonString, options: Options(
          headers: {'Authorization':'$token',}
      ));
      return response;

    }on DioException  catch(ex){
      throw Exception(ex.message);
    }
  }
  Future<Response> postFormData({required String urlEndPoint,required Map<String, dynamic> data, required File file})async{
    final p=await SharedPreferences.getInstance();
    var ddd=data;

    ddd['file']=await MultipartFile.fromFile(file.path);
    print("submiteDatafdf $ddd");
    var formData=FormData.fromMap(ddd);
    try{
      var token=p.getString('');
      var response = await _dio.post( urlEndPoint,data: formData,options: Options(headers: {'Authorization':'$token'}));

      print("submiteDatafdf ${response.requestOptions.data}");
      return response;
    }on DioException  catch(ex){
      throw Exception(ex.message);
    }
  }

}