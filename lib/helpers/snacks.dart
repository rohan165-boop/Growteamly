import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppSnacks {
  static showSnackBar(BuildContext context,{ String message ="sucess"}) {
  
    ScaffoldMessenger.of(context).showSnackBar( SnackBar(
      content: Text(message),
      duration:const Duration(milliseconds: 600),
       )
      );
  }

  static showToast(String massage, bool isSucess ) {
    Fluttertoast.showToast(
                msg: massage,
                backgroundColor: isSucess? Colors.green.shade600 : Colors.red.shade800,
                fontSize: 24,
                gravity: ToastGravity.BOTTOM_RIGHT,
                textColor: Colors.white,
                toastLength: Toast.LENGTH_SHORT,
                );
  }
}