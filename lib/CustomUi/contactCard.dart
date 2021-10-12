import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsapp/models/ContactModel.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({Key? key, required this.contactModel}) : super(key: key);

  final ContactModel contactModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 53,
        width: 50,
        child: Stack(
          children: [
            CircleAvatar(
              radius: 25,
              child: Icon(
                Icons.person_outline,
                color: Colors.white,
                size: 30,
              ),
              backgroundColor: Colors.blueGrey[200],
            ),
           contactModel.select? Positioned(
              bottom: 4,
              right: 5,
              child: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.teal,
                child: Icon(Icons.check,color: Colors.white,size: 18,)),
            ):Container(),
          ],
        ),
      ),
      title: Text(
        contactModel.name,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        contactModel.status,
        style: TextStyle(fontSize: 13),
      ),
    );
  }
}
