import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasap/common/error.dart';
import 'package:wasap/common/loader.dart';
import 'package:wasap/features/select_contacts/controller/select_contact_controller.dart';

class SelectContactScreen extends ConsumerWidget{
  static const String routeName = '/select-contact';
  SelectContactScreen({super.key});

  void selectContact(WidgetRef ref,BuildContext context,Contact selectedContact){
    ref.read(SelectContactControllerProvider).selectContact(selectedContact, context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Contacts"),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search)),
          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert)),
        ],
      ),
      body: ref
      .watch(getContactProvider)
      .when(
        data: (contactsList) => 
        ListView.builder(
          itemCount: contactsList.length,
          itemBuilder: (context,index) {
            final contact = contactsList[index];
            return InkWell(
              onTap: () => selectContact(ref, context, contact),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: ListTile(
                  title: Text(contact.displayName,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  ),
                  leading: contact.photo == null ? null : CircleAvatar(
                    radius: 30,
                    backgroundImage: MemoryImage(contact.photo!),
                  ) ,
                ),
              ),
            );
          }), 
        error: (err,trce) {
          return ErrorScreen(error: err.toString());
        }, 
        loading: (){
          return loader();
        }),
    );
  }
}