import 'dart:convert';

import 'package:classapp/constants/api_endpoints.dart';
import 'package:classapp/core/network_client.dart';

import '../model/dailyupdate_model.dart';
import 'package:http/http.dart' as http;

class DailyupdateServices {
    Future<List<DailyupdateModel>> fetchdailyupdate() async{
    final http.Response? response = await NetworkClient().getRequest(
      path: ApiEndpoints.dailyUpdate);
      
      List<DailyupdateModel> dailyUpdates = [];
      if(response != null && response.statusCode == 200) {
        Map< String, dynamic> json = jsonDecode(response.body);
        json["data"].forEach((e) {
          DailyupdateModel dailyUpdate = DailyupdateModel.fromJson(e);
          dailyUpdates.add(dailyUpdate);
        });
      }
      return dailyUpdates;
  }
}