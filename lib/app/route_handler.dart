import 'package:classapp/Loging.dart';
import 'package:classapp/app/route.dart';
import 'package:classapp/features/daily-updates/views/add_dailyupdates_views.dart';
import 'package:classapp/home.dart';
import 'package:classapp/models/dummypage_model.dart';
import 'package:classapp/pages/domypage.dart';
import 'package:flutter/material.dart';

class RouteHandler{
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var arguments = settings.arguments;
    switch(settings.name) {
      case AppRoute.loginRoute:
      return MaterialPageRoute(builder: (context) => const Logingpage());
      case AppRoute.homeRoute:
      return MaterialPageRoute(builder: (context) => const Homepage());
      case AppRoute.domyRoute:
      return MaterialPageRoute(builder: (context) =>  DomyPage(
        data: arguments as DummyPageModel,
      ),);
       case AppRoute.addDailyUpdateRoute:
      return MaterialPageRoute(builder: (context) => const AddDailyUpdate() );
     
      default : 
      return MaterialPageRoute(builder: (context) => const Logingpage());
    }
  }
}