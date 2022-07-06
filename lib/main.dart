import 'package:classapp/app/route.dart';
import 'package:classapp/app/route_handler.dart';
import 'package:classapp/constants/app_constants.dart';
import 'package:classapp/injector.dart';
import 'package:classapp/providers/auth_provider.dart';
import 'package:classapp/providers/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
WidgetsFlutterBinding.ensureInitialized();
await setupLocator();
String? token = locator.get<SharedPreferences>().getString(AppConstants.token);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => CounterProvider()),
      ChangeNotifierProvider(create: (context) => Authprovider())
    ],
     child: Myapp(token: token,),));
}
class Myapp extends StatelessWidget {
  final String? token;
  const Myapp({ Key? key, this.token }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title:"Grow Teamly",
      navigatorKey: AppSettings.navigatorKey,
      onGenerateRoute: RouteHandler.generateRoute,
      // home: token != null ? Homepage(): Logingpage(),
      initialRoute: token != null? AppRoute.homeRoute : AppRoute.loginRoute,
      debugShowCheckedModeBanner: false,
      
    );
  }
}

class AppSettings{
  static GlobalKey<NavigatorState>navigatorKey = GlobalKey<NavigatorState>();
}
  