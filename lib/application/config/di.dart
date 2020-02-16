import 'package:bestbank/application/config/database/db_provider.dart';
import 'package:bestbank/application/mobile/screens/contact/contact_form.dart';
import 'package:bestbank/application/mobile/screens/contact/contact_list.dart';
import 'package:bestbank/application/mobile/screens/transfer/transfer_form.dart';
import 'package:bestbank/application/mobile/screens/transfer/transfer_list.dart';
import 'package:bestbank/domain/contact/contact_repository.dart';
import 'package:bestbank/domain/contact/contact_service.dart';
import 'package:bestbank/domain/transfer/transfer_repository.dart';
import 'package:bestbank/domain/transfer/transfer_service.dart';
import 'package:bestbank/resources/repositories/contact_repository_db.dart';
import 'package:bestbank/resources/repositories/transfer_repository_db.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:sqflite/sqlite_api.dart';

class DependencyInjection {
  Injector initialise(Injector injector) {
    // database
    injector.map<Future<Database>>((i) => DBProvider().database(),
        isSingleton: true);

    // Contact
    injector.map<ContactRepository>(
        (i) => ContactRepositoryDb(i.get<Future<Database>>()),
        isSingleton: true);
    injector.map<ContactService>(
        (i) => ContactService(i.get<ContactRepository>()),
        isSingleton: true);
    injector.map<ContactListState>((i) => ContactListState(i.get<ContactService>()));
    injector.map<ContactFormState>((i) => ContactFormState(i.get<ContactService>()));

    // Transfer
    injector.map<TransferRepository>(
        (i) => TransferRepositoryDb(i.get<Future<Database>>()),
        isSingleton: true);
    injector.map<TransferService>(
        (i) => TransferService(i.get<TransferRepository>()),
        isSingleton: true);
    injector.map<TransferListState>((i) => TransferListState(i.get<TransferService>()));
    injector.map<TransferFormState>((i) => TransferFormState(i.get<TransferService>()));

    return injector;
  }
}
