import 'package:classapp/app/route.dart';
import 'package:classapp/app/widgets/app_drawer.dart';
import 'package:classapp/features/profile/model/prolie_model.dart';
import 'package:classapp/features/profile/services/profile_services.dart';
import 'package:classapp/helpers/snacks.dart';
import 'package:classapp/models/dummypage_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


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
    return Scaffold(
      drawer:const AppDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.greenAccent.shade100,
        title: Text(AppLocalizations.of(context).profile),
        centerTitle: true,
        
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

              const SizedBox(height: 20,),
              Text(AppLocalizations.of(context).ro)
          ],

        ),
      ),
      
    );
  }
}