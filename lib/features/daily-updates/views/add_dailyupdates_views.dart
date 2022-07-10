import 'dart:developer';

import 'package:classapp/app/widgets/screen_padding.dart';
import 'package:classapp/app/widgets/text_field_wedget.dart';
import 'package:flutter/material.dart';

class AddDailyUpdate extends StatefulWidget {
  const AddDailyUpdate({ Key? key }) : super(key: key);

  @override
  State<AddDailyUpdate> createState() => _AddDailyUpdateState();
}

class _AddDailyUpdateState extends State<AddDailyUpdate> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController =TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenPadding(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Row(
                children:[
              Padding(padding:const EdgeInsets.only(top: 60, left: 20),
              child: IconButton(onPressed: () {
                Navigator.of(context).pop();
              }, 
              icon: const Icon(Icons.arrow_back_ios, 
              color: Colors.black, 
              size: 25,)),),
          
              const Padding(
                padding: EdgeInsets.only(top: 60, left: 20),
                child: Text("Add Daily Update",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),),
              ),
                ]
              ), 
          
              Container(
                height: 2,
                width: 360,
                color: Colors.black,
              ),
              const SizedBox(height: 50,),
              
              TextFormField(
                controller: _dateController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),),
                     hintText: "Update for*",
                     labelText: "Update for*",
                     labelStyle: const TextStyle(
                      color: Colors.green,
                     ),
              suffixIcon: IconButton(icon:const Icon(Icons.calendar_month), 
              onPressed: ()async{
              final pickDate = await showDatePicker(context: context, 
              initialDate: DateTime.now(), 
              firstDate: DateTime.now().subtract(const Duration( days: 365)), 
              lastDate: DateTime.now().add(const Duration(days: 365)));
              if(pickDate !=null) {
                _dateController.text = pickDate.toString();
              }
              },)
                ),
              
              ),
              const SizedBox(height: 40,),
                  
                  
               TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),),
                     hintText: "Title*",
                     labelText: "Title*",
                     labelStyle: const TextStyle(
                      color: Colors.green,
                     ),
                ),
                       ),
                  
              const SizedBox(height: 40,),
                  
              const Text("Mention your Productivity (Work Done) of the Day *",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.normal
              ),),
               const SizedBox(height: 40,),
                  
                  
               TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),),
                     hintText: "Description*",
                     labelText: "Description*",
                     labelStyle: const TextStyle(
                      color: Colors.green,
                     ),
                ),
                       ),
                       const SizedBox(height: 30,),
          
                       DefultTextFormField(controller: _descriptionController, labelText: "Description"),
                       const SizedBox(height: 160,),
            
              Row( 
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                   ElevatedButton(onPressed: () {}, 
              child:const Text("Cancel"),),
                  
               ElevatedButton(onPressed: () {
                log(_dateController.text + _titleController.text + _descriptionController.text);
              }, 
              child:const Text("Submit"),),
                  
               
                ],
              ),
          
            ],
          ),
        ),
      ),
      
    );
  }
}