import 'package:flutter/material.dart';

import 'contact_card.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('My Contacts'),
      ),
      body: ListView(
        children: [
          ContactCard('Muhamed','mo@gmail.com','0146513555'),
          ContactCard('ahmed','ahm@gmail.com','5453453531'),
          ContactCard('Muhamed','mo@gmail.com','0146513555'),
          ContactCard('ahmed','ahm@gmail.com','5453453531'),
          ContactCard('Muhamed','mo@gmail.com','0146513555'),
        ],
      ),
    );
  }
}
