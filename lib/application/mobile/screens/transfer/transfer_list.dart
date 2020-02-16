import 'package:bestbank/application/mobile/components/item_form.dart';
import 'package:bestbank/application/mobile/components/items_list.dart';
import 'package:bestbank/application/mobile/components/list_item.dart';
import 'package:bestbank/application/mobile/screens/transfer/transfer_form.dart';
import 'package:bestbank/domain/transfer/entities/transfer.dart';
import 'package:bestbank/domain/transfer/transfer_service.dart';
import 'package:bestbank/main.dart';
import 'package:flutter/material.dart';

class TransferList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BestbankApp.injector.get<TransferListState>();
  }
}

class TransferListState extends ItemsListState<Transfer, TransferService> {
  TransferListState(TransferService service)
      : super(service, 'Tansfers',
            ItemForm(BestbankApp.injector.get<TransferFormState>()));

  @override
  StatelessWidget toItem(Transfer transfer) {
    return ListItem(transfer.amount.toString(),
        transfer.accountNumber.toString(), Icons.monetization_on);
  }
}
