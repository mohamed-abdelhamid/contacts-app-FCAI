import 'package:contact/model/my_contacts.dart';
import 'package:contact/screens/add_contact.dart';
import 'package:flutter/material.dart';

import '../widgets/contact_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('My Contacts'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddContact())).then((value) => setState((){}));
        },
      ),
      body: ListView.builder(
        itemCount: MyContacts.contacts.length,
        itemBuilder: (context, index) => ContactCard(
            MyContacts.contacts[index].name,
            MyContacts.contacts[index].mail,
            MyContacts.contacts[index].phone),
      ),
    );
  }
}
