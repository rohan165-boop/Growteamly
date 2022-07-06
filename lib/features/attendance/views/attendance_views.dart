import 'dart:developer';

import 'package:classapp/helpers/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AttendanceView extends StatefulWidget {
  const AttendanceView({ Key? key }) : super(key: key);

  @override
  State<AttendanceView> createState() => _AttendanceViewState();
}

class _AttendanceViewState extends State<AttendanceView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Attendance"),
      ),

      body: Center(
        child:  ElevatedButton(onPressed: () {
                showModalBottomSheet(context: context, 
                backgroundColor: Colors.grey.shade400,
                shape:const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  )
                ),
                builder: (context) {
                  return SizedBox(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                       ListTile(
                        onTap: () async{ 
                         ImagePickerHelper().pickImage(ImageSource.gallery);
                        },
                        leading:const Icon(Icons.photo, size: 50,),
                        title:const  Text("Upload Image",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                        ),),
                       ),

                       ListTile(
                        onTap: () async{
                          ImagePickerHelper().pickImage(ImageSource.camera);
                        },
                         leading:const Icon(Icons.camera_alt, size: 50,),
                        title:const  Text("Camera",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                        ),),
                       ),
                      ],
                    ),
                  );
                });
              }, 
              child: const Icon(Icons.more_horiz, size: 30,),),
      ),
      
    );
  }
}