import 'package:bestbank/application/mobile/components/item_form.dart';
import 'package:bestbank/application/mobile/components/items_list.dart';
import 'package:bestbank/application/mobile/components/list_item.dart';
import 'package:bestbank/application/mobile/screens/contact/contact_form.dart';
import 'package:bestbank/domain/contact/contact_service.dart';
import 'package:bestbank/domain/contact/entities/contact.dart';
import 'package:bestbank/main.dart';
import 'package:flutter/material.dart';

class ContactList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BestbankApp.injector.get<ContactListState>();
  }
}

class ContactListState extends ItemsListState<Contact, ContactService> {
  ContactListState(ContactService service)
      : super(service, 'Contacts', 
            ItemForm(BestbankApp.injector.get<ContactFormState>()));

  @override
  StatelessWidget toItem(Contact contact) {
    return ListItem(contact.name,
        contact.accountNumber.toString(), Icons.monetization_on);
  }
}
