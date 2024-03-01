import 'package:contact/providers/contact_provider.dart';
import 'package:contact/screens/add_contact.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/contact_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Future? _loadContact;

  @override
  void initState() {
    super.initState();
    // do this instead of calling the future directly in the build method as this will lead to calling the future more than one time
    _loadContact = Provider.of<ContactProvider>(context,listen: false).loadContacts();
  }


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
      body: FutureBuilder(
        future: _loadContact,
        builder:(context,snapshot) {
          if (snapshot.connectionState == ConnectionState.done){
            if (snapshot.hasError){
              return const Center(
                child: Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                ),
              );
            }
            return ListView.builder(
              itemCount: Provider.of<ContactProvider>(context).myContacts.contacts.length,
              itemBuilder: (context, index) => ContactCard(
                  Provider.of<ContactProvider>(context).myContacts.contacts[index].name,
                  Provider.of<ContactProvider>(context).myContacts.contacts[index].mail,
                  Provider.of<ContactProvider>(context).myContacts.contacts[index].phone),
            );
          }else{
            return const Center(child: CircularProgressIndicator());
          }
  }
      ),
    );
  }
}
