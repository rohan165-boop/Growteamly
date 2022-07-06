import 'package:classapp/constants/app_constants.dart';
import 'package:classapp/injector.dart';
import 'package:shared_preferences/shared_preferences.dart';

Map<String, String> getHeader () {
  Map< String, String> header ={"Accept":"application/json"};

  String? token = locator<SharedPreferences>().getString(AppConstants.token);
  //if token is not null , then we should add authorization header only in this condition 
  if(token !=null){
    Map<String, String> authorizationHeader = {"Authorization":"Bearer $token"};
    header.addAll(authorizationHeader);
  }

  return header;
}