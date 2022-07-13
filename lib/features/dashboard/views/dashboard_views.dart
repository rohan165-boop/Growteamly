import 'dart:collection';

import 'package:classapp/features/dashboard/models/dashboard_card_model.dart';
import 'package:classapp/features/dashboard/services/dashboard_services.dart';
import 'package:classapp/features/dashboard/widgets/card_data_widget.dart';
import 'package:classapp/providers/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({ Key? key }) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  DashboardCardModel? dashboardCard;
  bool _isLoading =true;

  @override
  void initState() {
    super.initState();
    fetchDashboardCardData();
  }
   
   fetchDashboardCardData() async{
    DashboardCardModel? respons = await DashboardServices().fetchDashboardCardData();
    dashboardCard = respons;
    _isLoading =false;
    if(mounted) setState(() {});
   }

  @override
  Widget build(BuildContext context) {
    final language = Provider.of<LanguageProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).hello),
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
            onTap: () {
              showModalBottomSheet(context: context, 
              backgroundColor: Colors.grey.shade600,
              shape:const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40)
                )
              ),
              builder: (context) {
                return SizedBox(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.of(context).pop();
                          language.changeLocale();
                        },
                        title:const Text("English",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.of(context).pop();
                          language.changeLocale();
                        },
                        title:const Text("Nepali",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),),
                      )

                    ],
                  ),
                );
              });
            },
            child:const Icon(Icons.more_vert, 
            size: 30, 
            color: Colors.redAccent,),
          )
        ],
      ),

      body: _isLoading? Center(
        child: CircularProgressIndicator(
          color: Colors.red.shade700,
           backgroundColor: Colors.green.shade700,),) :
           dashboardCard == null ? const Center(child: Text("Something is Wrong"),):
           Column(
        children: [
          const SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              children: [
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                children:[
                Carddatawidget(
                 icon:const Icon(Icons.av_timer, size: 20,),
                 title: 'My Missing Check Out',
                  data: dashboardCard!.myMissingCheckoutCount.toString(),
                 //  containercolor: Colors.redAccent,
                  ),

                Carddatawidget( icon:const Icon(Icons.folder_shared, size: 20,),
                 title: "My Ghost Count",
                  data: dashboardCard!.myghostCount.toString(),
                  containercolor: Colors.green,
                  ),

                Carddatawidget(
                  icon:const Icon(Icons.account_balance_wallet, size: 20,),
                title: 'My Leaves Balance',
                 data: dashboardCard!.myLeaveBalance.toString(),
                 // containercolor: Colors.pink,
                 ),

                Carddatawidget(
                 icon:const Icon(Icons.update, size: 20,),
                  title: 'My Daily Update',
                   data: dashboardCard!.myNoDailyUpdate.toString(),
                   containercolor: Colors.purple,
                   ),
                const SizedBox(height: 10,),

                  Carddatawidget(
                   icon:const Icon(Icons.file_copy, size: 20,),
                    title: 'My Not Acknowledge',
                     data: dashboardCard!.myNoteAcknowledged.toString(),
                     // containercolor: Colors.yellow,
                     ),
                ],
                ),
              ],
            ),
          )

        ],
      ),
      
    );
  }
}