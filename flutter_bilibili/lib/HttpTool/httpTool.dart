import 'package:flutter/material.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
class HttpTool {
  static final String GET = "get";
  static final String POST = "post";
  static final String DATA = "data";
  static final String CODE = "errorCode";

  Dio dio;
  static HttpTool _instance;

  static HttpTool getInstance() {
    if (_instance == null) {
      _instance = HttpTool();
    }
    return _instance;
  }

  HttpTool() {
    String platform;
    if(Platform.isAndroid){
      platform = 'android';
    }else if(Platform.isIOS){
      platform = 'ios';
    }
    dio = Dio(BaseOptions(
      /*baseUrl: "http://192.168.5.6:8085",*/
      headers: {'platform': platform, 'version': 11.0},
      connectTimeout: 5000,
      receiveTimeout: 100000,
    ));
  }

  //get请求
  get(String url, Function successCallBack,
      {params, Function errorCallBack}) async {
    _requstHttp(url, successCallBack, GET, params, errorCallBack);
  }

  //post请求
  post(String url, Function successCallBack,
      {params, Function errorCallBack}) async {
    _requstHttp(url, successCallBack, POST, params, errorCallBack);
  }

  _requstHttp(String url, Function successCallBack,
      [String method, FormData params, Function errorCallBack]) async {
    String errorMsg = '';
    int code;

    try {
      Response response;
//      _addStartHttpInterceptor(dio); //添加请求之前的拦截器
      if (method == GET) {
        if (params != null && params.isNotEmpty) {
          response = await dio.get(url, queryParameters: params);
        } else {
          response = await dio.get(url);
        }
      } else if (method == POST) {
        if (params != null && params.isNotEmpty) {
          response = await dio.post(url, data: params);
        } else {
          response = await dio.post(url);
        }
      }

      code = response.statusCode;
      if (code != 200) {
        errorMsg = '错误码：' + code.toString() + '，' + response.data.toString();
        _error(errorCallBack, errorMsg);
        return;
      }

      String dataStr = json.encode(response.data);
      Map<String, dynamic> dataMap = json.decode(dataStr);
//      if (dataMap != null && dataMap[CODE] != 0) {
//        errorMsg =
//            '错误码：' + dataMap[CODE].toString() + '，' + response.data.toString();
//        _error(errorCallBack, errorMsg);
//        return;
//      }

      if (successCallBack != null) {
        successCallBack(dataMap);
      }
    } catch (exception) {
      _error(errorCallBack, exception.toString());
    }
  }

  _error(Function errorCallBack, String error) {
    Fluttertoast.showToast(
        msg: error.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER);
    if (errorCallBack != null) {
      errorCallBack(error);
    }
  }

//  _addStartHttpInterceptor(Dio dio) {
//    dio.interceptors.request.onSend = (Options options) {
//      // 在请求被发送之前做一些事情   比如加密的一些操作 或者添加token等参数 对head 或者请求参数进行加工处理
//      Map<String, dynamic> headers = options.headers;
//      Map<String, dynamic> body = options.data;
//      /*request['token'] = '1111111111';
//      headers['addParam'] = 'aaaaaaaaaaaaaaa';*/
//      return options;
//    };
//  }
}