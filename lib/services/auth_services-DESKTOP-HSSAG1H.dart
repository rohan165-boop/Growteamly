import 'dart:convert';
import 'dart:developer';

import 'package:classapp/constants/api_endpoints.dart';
import 'package:classapp/models/login_response_model.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as devtools show log;

class Authservices {
  Future<LoginResponseModel>
  login(String username, String password) async{
   final http.Response? response = await http
      .post(Uri.parse(ApiEndpoints.baseUrl+ApiEndpoints.login,),
   headers: {
     "Accept": "application/json",
    // "Content-Type": "application/json",
    },
    body: {
      "username": username,
      "password": password
    }
   );
  // log(response!.body);
  Map<String, dynamic> json = jsonDecode(response!.body);
  LoginResponseModel model = LoginResponseModel.fromJson(json);
  return model;

  // log(model.status.toString());
  // log(model.data.toString());
  // log(json["data"]);
  // log(json["status"]);
  }
}