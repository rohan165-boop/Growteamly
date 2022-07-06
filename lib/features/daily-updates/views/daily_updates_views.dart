import 'dart:developer';

import 'package:classapp/app/route.dart';
import 'package:classapp/features/daily-updates/model/dailyupdate_model.dart';
import 'package:classapp/features/daily-updates/services/dailyupdate_service.dart';
import 'package:classapp/features/daily-updates/views/add_dailyupdates_views.dart';
import 'package:classapp/features/daily-updates/widgets/simmers.dart';
import 'package:flutter/material.dart';

class DailyUpdateView extends StatefulWidget {
  const DailyUpdateView({ Key? key }) : super(key: key);

  @override
  State<DailyUpdateView> createState() => _DailyUpdateViewState();
}

class _DailyUpdateViewState extends State<DailyUpdateView> {
  List<DailyupdateModel> dailyUpdates = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getfetchDailyUpdates();
  }

  getfetchDailyUpdates() async{
    DailyupdateServices dailyUpdate =  DailyupdateServices();
    dailyUpdates = await dailyUpdate.fetchdailyupdate();
    _isLoading = false;
    if(mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("DailyUpdates"),
      ),

      body: _isLoading?
       const ListShimmer()
        :

         ListView.separated(
              separatorBuilder: (BuildContext context, int index)=> const Divider(),
                itemCount: dailyUpdates.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(dailyUpdates[index].title??""),
                    subtitle: Text(dailyUpdates[index].description??""),
                    trailing: dailyUpdates[index].acknowledget ==null? Row(
                      mainAxisSize: MainAxisSize.min,
                      children:  [
                        InkWell(
                          onTap: () {
                            log("Edit Tapped");
                          },
                          child: const Icon(Icons.edit)),
                        const SizedBox(width: 10,),
                        InkWell(
                          onTap: () {
                            log("Delete Tapped");
                          },
                          child:const Icon(Icons.delete))
                      ],
                    ) : const SizedBox(),
                  );
                },
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                Navigator.pushNamed(context, AppRoute.addDailyUpdateRoute);
              },
              child:const Icon(Icons.add, size: 50, color: Colors.red,),
              ),
              );
  
      
      
    
  }
}