import 'package:flutter/material.dart';
import 'package:whatsapp/CustomUi/AvaterCard.dart';
import 'package:whatsapp/CustomUi/contactCard.dart';
import 'package:whatsapp/models/ContactModel.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({Key? key}) : super(key: key);

  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  List<ContactModel> contacts = [
    ContactModel(
        name: "Mulati Brian", status: "Live,love,laugh", select: false),
    ContactModel(name: "Gabby Mula", status: "Gabbymercial", select: false),
    ContactModel(
        name: "Kathuke Jullie", status: "Using whatsapp", select: false),
    ContactModel(name: "Abby Mutai", status: "Daddieee", select: false),
    ContactModel(name: "Nelvine Mulati", status: "Matara eddu", select: false),
    ContactModel(
        name: "Mulati Brian", status: "Live,love,laugh", select: false),
    ContactModel(
        name: "Mulati Brian", status: "Live,love,laugh", select: false),
  ];
  List<ContactModel> groups = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              Text(
                "New group",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                "Add participants",
                style: TextStyle(
                  fontSize: 13,
                ),
              )
            ],
          ),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
        ),
        body: Stack(
          children: [
            ListView.builder(
                itemCount: contacts.length +1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Container(
                      height: groups.length>0? 90 :10,
                    );
                  }
                  return InkWell(
                      onTap: () {
                        if (contacts[index -1].select == false) {
                          setState(() {
                            contacts[index -1].select = true;
                            groups.add(contacts[index -1]);
                          });
                        } else {
                          setState(() {
                            contacts[index -1].select = false;
                            groups.remove(contacts[index -1]);
                          });
                        }
                      },
                      child: ContactCard(contactModel: contacts[index -1]));
                }),
            groups.length > 0
                ? Column(
                    children: [
                      Container(
                        height: 75,
                        color: Colors.white,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: contacts.length,
                            itemBuilder: (context, index) {
                              if (contacts[index].select == true) {
                                return InkWell(
                                    onTap: () {
                                      setState(() {
                                        contacts[index].select = false;
                                        groups.remove(contacts[index]);
                                      });
                                    },
                                    child: AvterCard(contact: contacts[index]));
                              } else {
                                return Container();
                              }
                            }),
                      ),
                      Divider(
                        thickness: 2,
                      )
                    ],
                  )
                : Container()
          ],
        ));
  }
}
