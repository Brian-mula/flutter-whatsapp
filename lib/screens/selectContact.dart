import 'package:flutter/material.dart';
import 'package:whatsapp/CustomUi/ButtonCard.dart';
import 'package:whatsapp/CustomUi/contactCard.dart';
import 'package:whatsapp/models/ContactModel.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({
    Key? key,
  }) : super(key: key);

  @override
  _SelectContactState createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  @override
  Widget build(BuildContext context) {
    List<ContactModel> contact = [
      ContactModel(name: "Mulati Brian", status: "Live, love lie",select: false),
      ContactModel(name: "Junior", status: "Live lie",select: false),
      ContactModel(name: "Edureka", status: "savage",select: false),
      ContactModel(name: "ISC", status: "Live, love lie",select: false),
      ContactModel(name: "Jullie", status: "Live, love lie",select: false),
      ContactModel(name: "Vinny", status: "Live, love lie",select: false),
    ];
    return Scaffold(
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select contact",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "250 contacts",
                style: TextStyle(fontSize: 15),
              )
            ],
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            PopupMenuButton(onSelected: (val) {
              print(val);
            }, itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text("Invite a friend"),
                  value: "Invite a friend",
                ),
                PopupMenuItem(
                  child: Text("Contacts"),
                  value: "Contacts",
                ),
                PopupMenuItem(
                  child: Text("Refresh"),
                  value: "Refresh",
                ),
                PopupMenuItem(
                  child: Text("Help"),
                  value: "Help",
                ),
              ];
            })
          ],
        ),
        body: ListView.builder(
            itemCount: contact.length +2,
            itemBuilder: (context, index) {
              if (index == 0) {
                return ButtonCard(icon: Icons.group_add,name: "New group",);
              } else if (index == 1) {
                return ButtonCard(icon: Icons.person_add,name: "New Contact",);
              }
              return
              ContactCard(
                contactModel: contact[index-2],
              );
            }));
  }
}
