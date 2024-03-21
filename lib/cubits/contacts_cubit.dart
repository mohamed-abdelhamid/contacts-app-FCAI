import 'package:contact/model/my_contacts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/contact.dart';
import 'contacts_states_cubit.dart';

class ContactsCubit extends Cubit<CubitContactsStates> {
  final MyContacts myContacts = MyContacts();

  ContactsCubit() : super(CubitContactsLoading()) {
    getData();
  }

  getData() async {
    List<Contact> contacts = await myContacts.getContacts();
    emit(CubitContactsLoaded(contactList: contacts));
  }

  addContact({required Contact contact}){
    List<Contact> contacts= MyContacts.myContactList;
    contacts.add(contact);
    emit(CubitContactsLoaded(contactList: contacts));
  }
}