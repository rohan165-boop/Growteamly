import 'package:flutter/material.dart';

class Carddatawidget extends StatelessWidget {
  final Icon icon;
final String title;
final String data;
final Color? containercolor;

  const Carddatawidget({ Key? key,
   required this.icon,
    required this.title, 
    required this.data, 
    this.containercolor }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
                    decoration: BoxDecoration(
                      color: containercolor != null? containercolor : Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(15.0)
                    ),
                    padding:const EdgeInsets.all(8.0),
                    height: 120,
                    width: 180,
                    child: Column(children: [
                      icon,
                       Text(title,style:const TextStyle(color: Colors.black, fontSize: 18),),
                      Text(data, style:const TextStyle(color: Colors.black,fontSize: 18),),
                    ],),
                  );
  }
}