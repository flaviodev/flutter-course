import 'package:bestbank/application/mobile/components/editor.dart';
import 'package:bestbank/application/mobile/components/item_form.dart';
import 'package:bestbank/domain/contact/contact_service.dart';
import 'package:bestbank/domain/contact/entities/contact.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ContactFormState extends State<ItemForm> {
  final ContactService _service;

  ContactFormState(this._service);

  final TextEditingController _accountNumberController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adding Contact'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
                _nameController, 'Name', '', Icons.people, TextInputType.text),
            Editor(
                _accountNumberController, 'Account number', '0000', null, null),
            RaisedButton(
              child: Text('Submit'),
              onPressed: () => _createContact(context),
            ),
          ],
        ),
      ),
    );
  }

  void _createContact(BuildContext context) {
    final int accountNumber = int.tryParse(_accountNumberController.text);
    final String name =  _nameController.text;
    if (accountNumber != null && name != null) {
      _service
          .create(Contact(Uuid().v1(), name, accountNumber))
          .then((id) => Navigator.pop(context));
    }
  }
}
