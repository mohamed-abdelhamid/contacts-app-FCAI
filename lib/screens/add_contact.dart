import 'package:contact/model/my_contacts.dart';
import 'package:contact/providers/contact_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../model/contact.dart';

class AddContact extends StatefulWidget {
  const AddContact({Key? key}) : super(key: key);

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  late TextEditingController nameCtrlr;

  late TextEditingController phoneCtrlr;

  late TextEditingController mailCtrlr;

  @override
  void dispose() {
    nameCtrlr.dispose();
    mailCtrlr.dispose();
    phoneCtrlr.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    nameCtrlr = TextEditingController();
    phoneCtrlr = TextEditingController();
    mailCtrlr = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text('Add Contact'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextField(
            decoration: const InputDecoration(
                fillColor: Colors.lightBlue, hintText: 'Name', filled: true),
            controller: nameCtrlr,
          ),
          TextField(
            decoration: const InputDecoration(
                fillColor: Colors.lightBlue, hintText: 'mail', filled: true),
            controller: mailCtrlr,
          ),
          TextField(
            decoration: const InputDecoration(
                fillColor: Colors.lightBlue, hintText: 'phone', filled: true),
            controller: phoneCtrlr,
          ),
          MaterialButton(
            onPressed: () {
              Contact newContact = Contact(
                  nameCtrlr.value.text,
                  mailCtrlr.value.text,
                  phoneCtrlr.value.text
              );
              Provider.of<ContactProvider>(context,listen: false).createNewContact(newContact: newContact);
              Navigator.pop(context);
            },
            child: Container(
              width: 300,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(child: Text('Add Contact'),),
            ),
          )
        ],
      ),
    );
  }
}
