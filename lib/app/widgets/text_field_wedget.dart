import 'package:flutter/material.dart';

class DefultTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  const DefultTextFormField({ Key? key, required this.controller, required this.labelText }) : super(key: key);

  @override
  State<DefultTextFormField> createState() => _DefultTextFormFieldState();
}

class _DefultTextFormFieldState extends State<DefultTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle:const TextStyle(
          color: Colors.red,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: Colors.greenAccent.shade200),),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide:const BorderSide(color: Colors.black),),
      ),
      
    );
  }
}