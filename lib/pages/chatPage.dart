import 'package:flutter/material.dart';
import 'package:whatsapp/CustomUi/CustomCard.dart';
import 'package:whatsapp/models/ChatModel.dart';
import 'package:whatsapp/screens/selectContact.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({Key? key}) : super(key: key);

  @override
  _ChartPageState createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  List<ChatModel> chats = [
    ChatModel(
        name: "Mulati Brian",
        time: "12:00",
        isGroup: false,
        icon: "person.svg",
        currentMessage: "Hello babes ):",
        status:"Hey there whatsapp"
        ),
    ChatModel(
        name: "ISC group",
        time: "12:00",
        isGroup: true,
        icon: "group.svg",
        currentMessage: "Hello everyone):",
        status: "We're develope"
        ),
    ChatModel(
        name: "Mutai Abigael",
        time: "13:00",
        isGroup: false,
        icon: "person.svg",
        currentMessage: "Hello Mulati ):",
        status: "Full stack developer"
        ),
    ChatModel(
        name: "BiTSA association ",
        time: "14:00",
        isGroup: true,
        icon: "group.svg",
        currentMessage: "Hello Mulati ",
        status: "Live,laugh love"
        ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // messaging button
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (builder) => SelectContact()));
          },
          child: Icon(Icons.chat),
        ),
        body: ListView.builder(
          itemCount: chats.length,
          itemBuilder: (context, index) => CustomCard(
            chatModel: chats[index],
          ),
        ));
  }
}
