import 'package:bestbank/domain/contact/entities/contact.dart';

abstract class ContactRepository {
  Future<int> create(Contact contact);
  Future<List<Contact>> findAll();
}
