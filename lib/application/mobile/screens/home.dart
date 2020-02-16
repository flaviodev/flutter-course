import 'package:bestbank/application/mobile/screens/contact/contact_list.dart';
import 'package:bestbank/application/mobile/screens/transfer/transfer_list.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bestbank'),
      ),
      body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/images/best_bank_logo.png'),
            ),
            Row(
              children: <Widget>[
                MenuItem(
                  "Contacts",
                  Icons.people,
                  ContactList(),
                ),
                MenuItem(
                  "Transfers",
                  Icons.monetization_on,
                  TransferList(),
                ),
              ],
            ),
          ])),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String _description;
  final IconData _icon;
  final _targetScreen;

  MenuItem(this._description, this._icon, this._targetScreen);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          color: Theme.of(context).accentColor,
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return _targetScreen;
              }));
            },
            child: Container(
                padding: EdgeInsets.all(8.0),
                height: 70,
                width: 110,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(this._icon, color: Theme.of(context).primaryColor),
                    Text(this._description,
                        style: TextStyle(color: Theme.of(context).primaryColor)),
                  ],
                )),
          ),
        ));
  }
}
