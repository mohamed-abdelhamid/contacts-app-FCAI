import 'package:contact/model/contact.dart';
import 'package:contact/model/my_contacts.dart';

abstract class CubitContactsStates {}

class CubitContactsLoading extends CubitContactsStates {}

class CubitContactsLoaded extends CubitContactsStates {
  List<Contact> contactList;
  CubitContactsLoaded({required this.contactList});
}