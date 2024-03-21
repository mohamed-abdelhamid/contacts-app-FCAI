import 'package:contact/model/my_contacts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:contact/screens/add_contact.dart';
import 'package:flutter/material.dart';
import '../cubits/contacts_cubit.dart';
import '../cubits/contacts_states_cubit.dart';
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
      body: BlocBuilder<ContactsCubit, CubitContactsStates>(
        builder: (context,state) {
          if (state is CubitContactsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CubitContactsLoaded) {
            return Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: ListView.builder(
                  itemCount:state.contactList.length,
                  itemBuilder: (context, index) => ContactCard(
                      state.contactList[index].name,
                      state.contactList[index].mail,
                      state.contactList[index].phone),
                ));
          } else {
            return const Center(
              child: Text('Something went wrong'),
            );
          }
        },

      ),
    );
  }
}
