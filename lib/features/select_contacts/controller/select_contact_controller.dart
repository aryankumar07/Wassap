

import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasap/features/select_contacts/repository/select_contact_repo.dart';

final getContactProvider = FutureProvider((ref) {
  final selectContactRepo = ref.watch(SelectContactRepoProvider);
  return selectContactRepo.getContacts();
});

final SelectContactControllerProvider = Provider((ref) {
  final  selectContactRepo = ref.watch(SelectContactRepoProvider);
  return selectContactController(ref: ref, selectContactRepo: selectContactRepo);
}
);

class selectContactController {
  final ProviderRef ref;
  final SelectContactRepo selectContactRepo;
  selectContactController({
    required this.ref,
    required this.selectContactRepo,
  });

  void selectContact(Contact selectedContact,BuildContext context){
    selectContactRepo.selectContact(selectedContact, context);
  }

}