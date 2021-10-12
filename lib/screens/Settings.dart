import 'package:flutter/material.dart';
import 'package:whatsapp/CustomUi/SettingsAv.dart';
import 'package:whatsapp/CustomUi/SettingsCard.dart';
import 'package:whatsapp/models/SettingsModel.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);


  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  List<SettingsModel>settings=[
    SettingsModel(title: "Accounts", subtitle: "Privacy,security,change number", icon: Icons.vpn_key),
    SettingsModel(title: "Chats", subtitle: "Theme,wallpapers,chat history", icon: Icons.chat),
    SettingsModel(title: "Notification", subtitle: "Message,group & call tones", icon: Icons.notifications),
    SettingsModel(title: "Storage and data", subtitle: "Network usage,auto-download", icon: Icons.donut_large),
    SettingsModel(title: "Help", subtitle: "FAQ,contact us,privacy policy", icon: Icons.help),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
            Container(
              height: 75,
              child: SettingsAv(),
            ),
          Divider(thickness: 1,),
          Expanded(
            child: ListView.builder(
              itemCount: settings.length,
              itemBuilder: (context,index)=>InkWell(
                onTap: (){},
                child: SettingsCard(settingsModel: settings[index],))),
          ),
         Center(
           child: Column(
             children: [
               Text("from",style: TextStyle(
                 fontSize: 12,
                 color: Colors.grey
               ),),
               Text("FACEBOOK",style: TextStyle(
                 letterSpacing: 2,
                 fontSize: 16,
                 fontWeight: FontWeight.bold
               ),)
             ],
           ),
         )
        ],
      )
    );
  }

  
}
