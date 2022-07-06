import 'dart:convert';

import 'package:classapp/constants/api_endpoints.dart';
import 'package:classapp/core/network_client.dart';
import 'package:classapp/features/profile/model/prolie_model.dart';
import 'package:http/http.dart' as http;

class ProfileService {

//to fetch profile 
  Future<ProfileModel?> fetchprofile() async{
    final http.Response? response = await NetworkClient().getRequest(
      path: ApiEndpoints.profile);

      ProfileModel? profile;
      if(response != null && response.statusCode == 200) {
        Map< String, dynamic> json = jsonDecode(response.body);
        profile = ProfileModel.fromJson(json);
      }

      return profile;
  }

}