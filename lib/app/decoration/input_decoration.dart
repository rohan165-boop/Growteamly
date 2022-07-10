import 'package:flutter/material.dart';

class InputFieldDecorations{
  InputDecoration textfieldDecoration = InputDecoration(
    hoverColor: Colors.pinkAccent,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide:const BorderSide(color: Colors.black),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(color: Colors.green.shade400),
        
         )
  );
}