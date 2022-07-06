import 'dart:convert';
import 'dart:developer';

import 'package:classapp/constants/api_endpoints.dart';
import 'package:classapp/core/header.dart';
import 'package:classapp/core/network_client.dart';
import 'package:classapp/models/login_response_model.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as devtools show log;
class Authservices {
  Future<LoginResponseModel?> login(String username, String password) async{
    final http.Response? response = await NetworkClient().postRequest(
      path: ApiEndpoints.login,
      body: {"username": username, "password": password}
      );

    LoginResponseModel? model;
 
  if(response != null) {

   Map<String, dynamic> json = jsonDecode(response.body);
   model = LoginResponseModel.fromJson(json);
   }

  
  return model;
  }
}