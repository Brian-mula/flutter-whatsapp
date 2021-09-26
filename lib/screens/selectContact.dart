import 'package:flutter/material.dart';
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
      ContactModel(name: "Mulati Brian", status: "Live, love lie"),
      ContactModel(name: "Junior", status: "Live lie"),
      ContactModel(name: "Edureka", status: "savage"),
      ContactModel(name: "ISC", status: "Live, love lie"),
      ContactModel(name: "Jullie", status: "Live, love lie"),
      ContactModel(name: "Vinny", status: "Live, love lie"),
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
            itemCount: contact.length, itemBuilder: (context, index) => ContactCard(contactModel: contact[index],)));
  }
}
