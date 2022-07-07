import 'dart:io';
import 'package:classapp/helpers/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AttendanceView extends StatefulWidget {
  const AttendanceView({ Key? key }) : super(key: key);

  @override
  State<AttendanceView> createState() => _AttendanceViewState();
}

class _AttendanceViewState extends State<AttendanceView> {
  XFile? _pickedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Attendance"),
      ),

      body: Center(
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 160, right: 160),
              child: ElevatedButton(onPressed: () {
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
                                Navigator.pop(context);
                               _pickedImage = await ImagePickerHelper().pickImage(ImageSource.gallery);
                               setState(() {});
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
                                Navigator.pop(context);
                                _pickedImage = await ImagePickerHelper().pickImage(ImageSource.camera);
                                setState(() {});
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
                    child: const Icon(Icons.more_horiz, 
                    size: 30,),
                    ),
            ),

                  if (_pickedImage != null)...{
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Image.file(
                      File(_pickedImage!.path),
                      fit: BoxFit.cover,
                      width: double.infinity,
                      ),
                      IconButton(onPressed: () {
                        _pickedImage = null;
                        setState(() {});
                      }, 
                      icon: const Icon(Icons.cancel, color: Colors.red, size: 40,),),
                      ],
                    )
                  }
          ],
        ),
      ),
      
    );
  }
}