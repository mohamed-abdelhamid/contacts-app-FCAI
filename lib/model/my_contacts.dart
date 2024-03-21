import 'package:contact/model/contact.dart';

class MyContacts{

  static List<Contact> myContactList = [
    Contact('Muhamed','mo@gmail.com','0146513555'),
    Contact('ahmed','ahm@gmail.com','5453453531'),
  ];

  Future<List<Contact>> getContacts()async{
    await Future.delayed(const Duration(seconds: 5),(){});
    return myContactList;
  }
}