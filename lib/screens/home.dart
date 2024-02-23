import 'package:contact/model/my_contacts.dart';
import 'package:contact/providers/contact_provider.dart';
import 'package:contact/screens/add_contact.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/contact_card.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddContact()));
        },
      ),
      body: ListView.builder(
        itemCount: Provider.of<ContactProvider>(context).myContacts.contacts.length,
        itemBuilder: (context, index) => ContactCard(
            Provider.of<ContactProvider>(context).myContacts.contacts[index].name,
            Provider.of<ContactProvider>(context).myContacts.contacts[index].mail,
            Provider.of<ContactProvider>(context).myContacts.contacts[index].phone),
      ),
    );
  }
}
