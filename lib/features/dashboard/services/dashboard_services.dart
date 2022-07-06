import 'dart:convert';

import 'package:classapp/constants/api_endpoints.dart';
import 'package:classapp/core/network_client.dart';
import 'package:classapp/features/dashboard/models/dashboard_card_model.dart';
import 'package:http/http.dart' as http;

class DashboardServices {

Future<DashboardCardModel?> fetchDashboardCardData() async{
  final http.Response?  response = 
      await NetworkClient().getRequest(path: ApiEndpoints.dashboardCardData);
      DashboardCardModel? dashboardCardModel;

      if (response != null && response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        dashboardCardModel = DashboardCardModel.fromJson(jsonResponse); 
      } else {
        dashboardCardModel = null;

      }
      return dashboardCardModel;
}

}