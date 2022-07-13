import 'package:classapp/app/route.dart';
import 'package:classapp/app/route_handler.dart';
import 'package:classapp/app/themes/dark_theme.dart';
import 'package:classapp/constants/app_constants.dart';
import 'package:classapp/injector.dart';
import 'package:classapp/providers/auth_provider.dart';
import 'package:classapp/providers/counter_provider.dart';
import 'package:classapp/providers/language_provider.dart';
import 'package:classapp/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async{
WidgetsFlutterBinding.ensureInitialized();
await setupLocator();
String? token = locator.get<SharedPreferences>().getString(AppConstants.token);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => CounterProvider()),
      ChangeNotifierProvider(create: (context) => Authprovider()),
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ChangeNotifierProvider(create: (context) => LanguageProvider()),

    ],
     child: Myapp(token: token,),));
}
class Myapp extends StatelessWidget {
  final String? token;
  const Myapp({ Key? key, this.token }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme =Provider.of<ThemeProvider>(context);
    final appLocale = Provider.of<LanguageProvider>(context);
    return  MaterialApp(
      localizationsDelegates:const [
        AppLocalizations.delegate, 
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
  supportedLocales:const [
    Locale('en', ''), // English, no country code
    Locale('ne', ''), // Nepali, no country code
  ],
      locale: appLocale.currentLocale,
      title:"Grow Teamly",
      navigatorKey: AppSettings.navigatorKey,
      onGenerateRoute: RouteHandler.generateRoute,
      // home: token != null ? Homepage(): Logingpage(),
      initialRoute: token != null? AppRoute.homeRoute : AppRoute.loginRoute,
      debugShowCheckedModeBanner: false,
      theme: appTheme.currentTheme,
      
    );
  }
}

class AppSettings{
  static GlobalKey<NavigatorState>navigatorKey = GlobalKey<NavigatorState>();
}
  