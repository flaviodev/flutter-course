import 'package:bestbank/application/mobile/components/editor.dart';
import 'package:bestbank/application/mobile/components/item_form.dart';
import 'package:bestbank/domain/transfer/entities/transfer.dart';
import 'package:bestbank/domain/transfer/transfer_service.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class TransferFormState extends State<ItemForm> {
  final TransferService _service;

  TransferFormState(this._service);

  final TextEditingController _accountNumberController =
      TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adding Transfer'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
                _amountController, 'Amount', '', Icons.monetization_on, null),
            Editor(
                _accountNumberController, 'Account number', '0000', null, null),
            RaisedButton(
              child: Text('Submit'),
              onPressed: () => _createTransfer(context),
            ),
          ],
        ),
      ),
    );
  }

  void _createTransfer(BuildContext context) {
    final int accountNumber = int.tryParse(_accountNumberController.text);
    final double amount =  double.tryParse(_amountController.text);
    if (accountNumber != null && amount != null) {
      _service
          .create(Transfer(Uuid().v1(), amount, accountNumber))
          .then((id) => Navigator.pop(context));
    }
  }
}
