import 'package:dio/dio.dart';

class HttpService{
  Dio? _dio;

  String baseUrl = 'https://api.teklifimgelsin.com/api/briefLoanOffer';


  HttpService(){
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
    )
    );

    initializeInterceptors();
  }

  Future<Response> postRequest(int amount, int maturity,int type,int offer_count) async{
    Response response;
    try {
      response = await _dio!.post(baseUrl,
          data: {"amount" : amount,"maturity" : maturity,"type" : type,"offer_count" : offer_count });
    } on DioError catch (e) {
      print(e.error);
      throw Exception(e.message);
    }
    return response;
  }





  initializeInterceptors() {
    _dio!.interceptors.add(InterceptorsWrapper(
      onRequest: (request, requestInterceptorHandler) {
        print("${request.method} ${request.baseUrl}");
        return requestInterceptorHandler.next(request);
      },
      onResponse: (response, responseInterceptorHandler) {
        print("${response.data}");
        return responseInterceptorHandler.next(response);
      },
      onError: (error, errorInterceptorHandler) {
        print("${error.message}");
        return errorInterceptorHandler.next(error);
      },
    ));
  }





}
