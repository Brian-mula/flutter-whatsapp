import 'package:flutter/material.dart';
import 'package:whatsapp/CustomUi/CustomCard.dart';
import 'package:whatsapp/models/ChatModel.dart';

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
        currentMessage: "Hello babes ):"),
    ChatModel(
        name: "ISC group",
        time: "12:00",
        isGroup: true,
        icon: "group.svg",
        currentMessage: "Hello everyone):"),
    ChatModel(
        name: "Mutai Abigael",
        time: "13:00",
        isGroup: false,
        icon: "person.svg",
        currentMessage: "Hello Mulati ):"),
    ChatModel(
        name: "BiTSA association ",
        time: "14:00",
        isGroup: true,
        icon: "group.svg",
        currentMessage: "Hello Mulati "),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
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
