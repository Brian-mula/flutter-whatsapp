import 'package:flutter/material.dart';
import 'package:whatsapp/pages/chatPage.dart';
import 'package:whatsapp/screens/Settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WhatsApp'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          PopupMenuButton<String>(onSelected: (value) {
            if (value == "Settings") {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Settings()));
            }
          }, itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                child: Text('New group'),
                value: 'New group',
              ),
              PopupMenuItem(
                child: Text('New broadcast'),
                value: 'New broadcast',
              ),
              PopupMenuItem(
                child: Text('Whatsapp web'),
                value: 'Whatsapp web',
              ),
              PopupMenuItem(
                child: Text('Starred message'),
                value: 'Starred message',
              ),
              PopupMenuItem(
                child: Text('Settings'),
                value: "Settings",
              ),
            ];
          })
        ],
        bottom: TabBar(
          indicatorColor: Colors.white,
          controller: _controller,
          tabs: [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(text: "Chats"),
            Tab(
              text: "Status",
            ),
            Tab(
              text: "Calls",
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [Text('Camera'), ChartPage(), Text('Status'), Text('Calls')],
      ),
    );
  }
}
