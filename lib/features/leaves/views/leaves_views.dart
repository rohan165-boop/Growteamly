import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class LeavesView extends StatefulWidget {
  const LeavesView({ Key? key }) : super(key: key);

  @override
  State<LeavesView> createState() => _LeavesViewState();
}

class _LeavesViewState extends State<LeavesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:const Text("leaves"),
      ),

      body: Column(
        children: [
           Expanded(
            flex: 4,
            child: CachedNetworkImage(imageUrl: 
            "https://machinelearningmastery.com/wp-content/uploads/2017/01/A-Gentle-Introduction-to-the-Random-Walk-for-Times-Series-Forecasting-with-Python.jpg",
            // height: 300,
            // width: double.infinity,
            fit: BoxFit.cover,
            errorWidget: (context, url,error) => const Icon(Icons.error, size: 50, color: Colors.redAccent,),
            progressIndicatorBuilder: (context, url, error) => const Center(
              child: CircularProgressIndicator(),
            ),
            ),
          ),
          const SizedBox(height: 20,),

          Container(
           height: 50,
           decoration: BoxDecoration(
             color: Colors.grey.shade400,
             borderRadius: BorderRadius.circular(25),
             border: Border.all(color: Colors.black)
           ),
           
           child: Padding(
             padding: const EdgeInsets.only(left: 40, right: 40),
             child: TextFormField(
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Colors.red),),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Colors.yellowAccent),),
                
              ),
               
             ),
           ),),
           const SizedBox(height: 20,),

          Expanded(flex: 3, 
          child: Container(
            decoration:const BoxDecoration(
              gradient: LinearGradient(colors:[ Colors.orange, Colors.greenAccent, Colors.pinkAccent  ])
            ),
            ),),
        ],
      ),
      
    );
  }
}