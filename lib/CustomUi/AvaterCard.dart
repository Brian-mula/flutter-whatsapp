import 'package:flutter/material.dart';
import 'package:whatsapp/models/ContactModel.dart';

class AvterCard extends StatelessWidget {
  const AvterCard({Key? key,required this.contact}) : super(key: key);
  final ContactModel contact;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.blueGrey[200],
                child: Icon(Icons.person,size: 30,color: Colors.white,),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.clear,size: 13,color: Colors.white,)),
              )
            ],
          ),
          SizedBox(height: 2,),
          Text(contact.name,style: TextStyle(
            fontSize: 12
          ),)
        ],
      ),
    );
  }
}
