import 'package:bestbank/domain/contact/contact_repository.dart';
import 'package:bestbank/domain/contact/entities/contact.dart';
import 'package:bestbank/shared/entity_crud_service.dart';
import 'package:bestbank/shared/entity_listing_service.dart';

class ContactService
    implements EntityListingService<Contact>, EntityCrudService<Contact> {
      
  final ContactRepository _repository;

  ContactService(this._repository);

  Future<int> create(Contact contact) {
    return _repository.create(contact);
  }

  Future<List<Contact>> findAll() {
    return _repository.findAll();
  }
}
