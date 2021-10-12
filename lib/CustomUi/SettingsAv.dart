import 'package:flutter/material.dart';

class SettingsAv extends StatefulWidget {
  const SettingsAv({Key? key}) : super(key: key);

  @override
  _SettingsAvState createState() => _SettingsAvState();
}

class _SettingsAvState extends State<SettingsAv> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blueGrey[200],
        radius: 25,
        child: Icon(Icons.person,color: Colors.white,),
      ),
      title: Text("Mulati Brian",style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),),
      subtitle: Text("UI developer"),
    );
  }
}
