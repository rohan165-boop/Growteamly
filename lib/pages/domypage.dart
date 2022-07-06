import 'package:classapp/constants/image_constants.dart';
import 'package:classapp/models/dummypage_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DomyPage extends StatefulWidget {
  final DummyPageModel data;
  const DomyPage({ Key? key, required this.data }) : super(key: key);

  @override
  State<DomyPage> createState() => _DomyPageState();
}

class _DomyPageState extends State<DomyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        // title: Text(widget.value),
      ),

      body: Center(
        child:Column(
          children: [
            Text(widget.data.name),
            Text(widget.data.address),
            Text(widget.data.age.toString()),
            
               SvgPicture.asset(ImageConstants.abc, height: 200,) ,
          ],

        ) ,
      ),
      
    );
  }
}