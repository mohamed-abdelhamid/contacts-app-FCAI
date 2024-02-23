import 'package:contact/model/my_contacts.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../model/contact.dart';

class ContactProvider extends ChangeNotifier{
  MyContacts myContacts = MyContacts();

  void createNewContact({required Contact newContact}){
    myContacts.contacts.add(newContact);
    notifyListeners();
  }

}