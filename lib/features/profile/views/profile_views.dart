import 'package:classapp/app/route.dart';
import 'package:classapp/app/themes/dark_theme.dart';
import 'package:classapp/app/themes/light_theme.dart';
import 'package:classapp/features/profile/model/prolie_model.dart';
import 'package:classapp/features/profile/services/profile_services.dart';
import 'package:classapp/helpers/confirmation_dialog.dart';
import 'package:classapp/helpers/snacks.dart';
import 'package:classapp/injector.dart';
import 'package:classapp/models/dummypage_model.dart';
import 'package:classapp/providers/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ProfileView extends StatefulWidget {
  const ProfileView({ Key? key }) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  ProfileModel? profileModel;
  bool _isLoading = true;
  // bool _ispressed = false;

  @override
  void initState() {
    super.initState();
    initialFunction();
  }

  initialFunction() async{
    profileModel = await ProfileService().fetchprofile();
    _isLoading = false;
    if(mounted) setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    final themepro =Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent.shade100,
        title:const Text("profile"),centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              themepro.changeTheme();
            },
            child: Icon(
              themepro.currentTheme == lightTheme ? 
              Icons.light_mode : 
              Icons.dark_mode) ,
          ),
              
          // CupertinoSwitch(
          //   value: themepro.currentTheme == darkTheme, 
          //   onChanged: (val) {
          //   themepro.changeTheme();
          // } ),
          IconButton(onPressed: () async{
            final bool isConfirmed = await getConfirmationDialog(context);
            if(isConfirmed) {
              locator.get<SharedPreferences>().clear();
              //  Navigator.pushAndRemoveUntil(
              //    context, MaterialPageRoute(
              //    builder: (context) => const Logingpage()),
              //    (route) => false);
              Navigator.pushNamedAndRemoveUntil(context, AppRoute.loginRoute, (route) => false);
            }


            //show dialog for user confirmation
            // showDialog(
            //   barrierDismissible: false,
            //   context: context, builder: (context) {
            //   return AlertDialog(
            //     title: Text("Do you want to Logout"),
            //     content: Row(
            //       mainAxisAlignment: MainAxisAlignment.end,
            //       children: [
            //         // Align(),
            //         TextButton(onPressed: () {
            //           Navigator.pop(context);
            //         },
            //          child: Text("NO")),

            //          TextButton(onPressed: () {
            //           // locator.get<SharedPreferences>().clear();
            // Navigator.pushAndRemoveUntil(
            //   context, MaterialPageRoute(
            //     builder: (context) => Logingpage()),
            //      (route) => false);
            //          },
            //          child: Text("YES")),
                    
            //       ],
            //     ),
            //   );
            // });

            // locator.get<SharedPreferences>().clear();
            // Navigator.pushAndRemoveUntil(
            //   context, MaterialPageRoute(
            //     builder: (context) => Logingpage()),
            //      (route) => false);
          },
           icon:const Icon(Icons.logout))
        ],
      ),

      body: _isLoading ? 
      const Center(
        child: CircularProgressIndicator(),
        ) :
         
      Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20.0,),
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset("assets/p.jpg",height: 100,),),
             
              const SizedBox(height: 20,),
            
            Text(profileModel?.fullName ??"",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.purpleAccent.shade100
            ),),
            const SizedBox(height: 10,),
            
            Text("Date of Birth: ${profileModel?.dateofBirth ??""}",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.redAccent.shade100
            ),),
            const SizedBox(height: 10,),

            Text("Supervisor: ${profileModel?.supervisorName}",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent.shade100
            ),),

            ElevatedButton(onPressed: () {
              Navigator.pushNamed(context, AppRoute.domyRoute, arguments: DummyPageModel(name: "Rohan", address: "ktm", age: 2,),);
            },
             child: const Text("Navigate")),

             ElevatedButton(onPressed: () {
              AppSnacks.showToast("Error", true );
             },
              child: Icon(Icons.face, size: 40, color: Colors.red.shade700,),),
          ],

        ),
      ),
      
    );
  }
}