import 'dart:developer';

import 'package:classapp/Loging.dart';
import 'package:classapp/constants/app_constants.dart';
import 'package:classapp/features/attendance/views/attendance_views.dart';
import 'package:classapp/features/daily-updates/views/daily_updates_views.dart';
import 'package:classapp/features/dashboard/views/dashboard_views.dart';
import 'package:classapp/features/leaves/views/leaves_views.dart';
import 'package:classapp/features/profile/views/profile_views.dart';
import 'package:classapp/injector.dart';
import 'package:classapp/providers/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  // final String Phonenumber;
  // final String? Password;
  const Homepage({ Key? key,  }) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

List<Widget> pages = [
  DashboardView(),
  DailyUpdateView(),
  AttendanceView(),
  LeavesView(),
  ProfileView()
];

int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        if(_currentIndex == 0) {
        SystemNavigator.pop();
        } else {
          _currentIndex = 0;
          setState(() {});
        }
        return false;
      },
      child: Scaffold(
        // appBar: AppBar(
        //   centerTitle: true,
        //   title: Text("Home Page"),
        //   actions: [
        //     IconButton(onPressed: () {
        //       locator.get<SharedPreferences>().clear();
        //       Navigator.pushAndRemoveUntil(
        //         context, MaterialPageRoute(
        //           builder: (context) => Logingpage()),
        //            (route) => false);
        //     },
        //      icon: Icon(Icons.logout))
        //   ],
        // ),
    
        body: pages[_currentIndex],
    
    
        bottomNavigationBar: BottomNavigationBar( 
          selectedItemColor: Color.fromARGB(255, 55, 247, 7),
          unselectedItemColor: Colors.blueAccent,
        currentIndex: _currentIndex,
        onTap: (index) {
         setState(() {
            _currentIndex = index;
         });
        },
        items:const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard,),
          label:"Dashboard" ),
          BottomNavigationBarItem(icon: Icon(Icons.update,),
          label: "DailyUpdates"),
          BottomNavigationBarItem(icon: Icon(Icons.insights,),
          label: "Attendance"),
          BottomNavigationBarItem(icon: Icon(Icons.holiday_village,),
          label: "Leaves"),
          BottomNavigationBarItem(icon: Icon(Icons.person,),
          label: "Profile"),
        ],),
       
        
      ),
    );
  }
}