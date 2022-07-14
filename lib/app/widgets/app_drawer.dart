import 'package:classapp/app/route.dart';
import 'package:classapp/app/themes/light_theme.dart';
import 'package:classapp/helpers/confirmation_dialog.dart';
import 'package:classapp/injector.dart';
import 'package:classapp/providers/language_provider.dart';
import 'package:classapp/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themepro =Provider.of<ThemeProvider>(context);
    final language =Provider.of<LanguageProvider>(context);
    return SafeArea(
        child: Drawer(
          child: Column(
            children: [
              const SizedBox(height: 20,),
              ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset("assets/p.jpg",height: 130,),),
              const SizedBox(height: 20,),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AppRoute.settingsRoute);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:const [
                    Icon(Icons.settings),
                    SizedBox(width: 20,),
                     Text("Setting",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:const [
                  Icon(Icons.settings),
                  SizedBox(width: 20,),
                   Text("Setting",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),),
                ],
              ),
               const SizedBox(height: 20,),
              InkWell(
                onTap: () {
                   showModalBottomSheet(context: context, 
              backgroundColor: Colors.grey.shade600,
              shape:const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40)
                )
              ),
              builder: (context) {
                return SizedBox(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.of(context).pop();
                          language.setEnglish();
                        },
                        title:const Text("English",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.of(context).pop();
                          language.setNepali();
                        },
                        title:const Text("Nepali",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),),
                      )

                    ],
                  ),
                );
              });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:const [
                    Icon(Icons.language),
                    SizedBox(width: 20,),
                     Text("Language",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),),
                  ],
                ),
              ),
               const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                   onTap: () {
                  themepro.changeTheme();
                },
                child: Icon(
                  themepro.currentTheme == lightTheme ? 
                   Icons.light_mode : 
                   Icons.dark_mode) ,
                   ),
                   const SizedBox(width: 20,),
                   const Text("Theme",
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),),
                  
                ],
              ),
              const Spacer(),
              Container(
                height: 2,
                width: 200,
                color: Colors.black,
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Log Out",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),),
                  const SizedBox(width: 20,),
                  IconButton(onPressed:  () async{
            final bool isConfirmed = await getConfirmationDialog(context);
            if(isConfirmed) {
              locator.get<SharedPreferences>().clear();
              Navigator.pushNamedAndRemoveUntil(context, AppRoute.loginRoute, (route) => false);
            }
                   } , 
                  icon: const Icon(Icons.logout))
                ],
              ),
              const SizedBox(height: 50,)
            ],
          ),
        ),
      );
  }
}