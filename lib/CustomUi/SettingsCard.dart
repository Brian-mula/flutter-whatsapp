import 'package:flutter/material.dart';
import 'package:whatsapp/models/SettingsModel.dart';

class SettingsCard extends StatefulWidget {
  const SettingsCard({Key? key, required this.settingsModel}) : super(key: key);
  final SettingsModel settingsModel;

  @override
  _SettingsCardState createState() => _SettingsCardState();
}

class _SettingsCardState extends State<SettingsCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 0),
      child: ListTile(
        leading: Icon(widget.settingsModel.icon, color: Colors.blue),
        title: Text(
          widget.settingsModel.title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(widget.settingsModel.subtitle),
      ),
    );
   
  }
}
