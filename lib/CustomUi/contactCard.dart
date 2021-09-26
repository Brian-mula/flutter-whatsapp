import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsapp/models/ContactModel.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({Key? key, required this.contactModel}) : super(key: key);

  final ContactModel contactModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          child: Icon(
            Icons.person_outline,
            color: Colors.white,
            size: 30,
          ),
          backgroundColor: Colors.blueGrey[200],
        ),
        title: Text(
          contactModel.name,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          contactModel.status,
          style: TextStyle(fontSize: 13),
        ),
      ),
    );
  }
}
