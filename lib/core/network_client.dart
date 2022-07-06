import 'dart:developer';

import 'package:classapp/constants/api_endpoints.dart';
import 'package:classapp/core/header.dart';
import 'package:classapp/helpers/snacks.dart';
import 'package:classapp/injector.dart';
import 'package:classapp/main.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NetworkClient {
  Future<http.Response?> getRequest({String baseUrl = ApiEndpoints.baseUrl, required String path}) async{
    //response could be null or non nullable , so we make it nullable at the beginning.
    http.Response? response;
    // try and catch block for exception hendling
    try {
      response = await http.get(Uri.parse(baseUrl + path),
      headers: getHeader(),
      );
      if (response.statusCode == 200) {
        locator.get<SharedPreferences>().setString(path, response.body);
      } else if(response.statusCode == 500) {
        AppSnacks.showToast("Server is Down", false);
      }
    }catch(e){
      final _cacheValue = locator<SharedPreferences>().getString(path);
      if(_cacheValue != null) {
        response = http.Response( _cacheValue, 200);
      }

      AppSnacks.showSnackBar(AppSettings.navigatorKey.currentContext!, message: "Something went Wrong");
    }
    log(response !=null ? response.statusCode.toString() : "response is null"); 
    return response;
  }

   Future<http.Response?> postRequest({String baseUrl =ApiEndpoints.baseUrl, 
  required String path,
   Map<String, dynamic>? body}) async{
    http.Response? response;
    try{
      response = await http.post(Uri.parse(baseUrl + path),
       headers: getHeader(),
       body: body,
       );
    } catch(e) {
      log(e.toString());
    }
    return response;
  }

}