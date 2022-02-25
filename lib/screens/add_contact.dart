import 'package:contact/model/my_contacts.dart';
import 'package:flutter/material.dart';

import '../model/contact.dart';

class AddContact extends StatefulWidget {
  int x = 0 ;
  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  late TextEditingController nameCtrlr;

  late TextEditingController phoneCtrlr;

  late TextEditingController mailCtrlr;

  @override
  void dispose() {
    print('hello from dispose');
    nameCtrlr.dispose();
    mailCtrlr.dispose();
    phoneCtrlr.dispose();
    print(widget.x)
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    print('hello from init');
    nameCtrlr = TextEditingController();
    phoneCtrlr = TextEditingController();
    mailCtrlr = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('Add Contact'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextField(
            decoration: InputDecoration(
                fillColor: Colors.lightBlue, hintText: 'Name', filled: true),
            controller: nameCtrlr,
          ),
          TextField(
            decoration: InputDecoration(
                fillColor: Colors.lightBlue, hintText: 'mail', filled: true),
            controller: mailCtrlr,
          ),
          TextField(
            decoration: InputDecoration(
                fillColor: Colors.lightBlue, hintText: 'phone', filled: true),
            controller: phoneCtrlr,
          ),
          MaterialButton(
            onPressed: () {
              MyContacts.contacts.add(Contact(
                nameCtrlr.value.text,
                mailCtrlr.value.text,
                phoneCtrlr.value.text
              ));
              Navigator.pop(context);
            },
            child: Container(
              width: 300,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(child: Text('Add Contact'),),
            ),
          )
        ],
      ),
    );
  }
}
