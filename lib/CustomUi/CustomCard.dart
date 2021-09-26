import 'package:flutter/material.dart';
import 'package:whatsapp/models/ChatModel.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsapp/screens/individualPage.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, required this.chatModel}) : super(key: key);
  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => IndividualPage(chatModel: chatModel,)));
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: chatModel.isGroup? Icon(Icons.group,size: 30,color: Colors.white,):Icon(Icons.person_outline,size: 30,color: Colors.white,),
              backgroundColor: Colors.blueGrey,
            ),
            title: Text(
              chatModel.name,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: [
                Icon(Icons.done_all),
                SizedBox(
                  width: 3,
                ),
                Text(
                  chatModel.currentMessage,
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            trailing: Text(chatModel.time),
          ),
        ],
      ),
    );
    // ignore: dead_code
    const Divider(
      thickness: 1,
    );
  }
}
