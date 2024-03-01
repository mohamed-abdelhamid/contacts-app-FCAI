import 'package:contact/model/my_contacts.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../model/contact.dart';

class ContactProvider extends ChangeNotifier {
  MyContacts myContacts = MyContacts();

  void createNewContact({required Contact newContact}) {
    if (newContact.name != 'mohamed') {
      myContacts.contacts.add(newContact);
    }
    notifyListeners();
  }

  Future<void> loadContacts() async {
    await Future.delayed(const Duration(seconds: 3), () {
      // myContacts.contacts[5]; // to cause an error
      myContacts.contacts.addAll([
        Contact('Muhamed', 'mo@gmail.com', '0146513555'),
        Contact('ahmed', 'ahm@gmail.com', '5453453531'),
      ]);
    });
  }
}
