import 'package:dio/dio.dart';

class DioInterceptor extends InterceptorsWrapper{



  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async{
    // var url="${options.uri}";
    // if(url==checkUrl){
    print("Network->onRequest Url:${options.uri}");
    print("Network->onRequest Data:${options.data}");
    // }
    return super.onRequest(options, handler);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async{

    // var url="${err.requestOptions.uri}";
    // // if(url==checkUrl){
    print("Network->onError->:${err.response?.requestOptions.uri}");
    print("Network->onError->:${err.response?.statusCode.toString()}");
    print("Network->onError->:${err.response?.statusCode.toString()}");
    // // }

    return super.onError(err, handler);
  }
  @override
  Future onResponse(Response response, ResponseInterceptorHandler handler)async {


    // var url="${response.requestOptions.uri}";
    //
    //
    // if(url==checkUrl){
    // ////print("Network->onResponse Url:${response.requestOptions.uri}');
    ////print("Network->onResponse Method:${response.requestOptions.method}');
    ////print("Network->onResponse Status Code:${response.statusCode}');
    ////print("Network->onResponse Message:${response.statusMessage}');
    ////print("Network->onResponse Header:${response.requestOptions.headers}');
    ////print("Network->onResponse Data:${response.data}');
    ////print("Network->onResponse Payload->:${response.requestOptions.data}');
    // }

    return super.onResponse(response, handler);
  }
}
