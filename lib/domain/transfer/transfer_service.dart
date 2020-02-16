import 'package:bestbank/domain/transfer/entities/transfer.dart';
import 'package:bestbank/domain/transfer/transfer_repository.dart';
import 'package:bestbank/shared/entity_crud_service.dart';
import 'package:bestbank/shared/entity_listing_service.dart';

class TransferService
    implements EntityListingService<Transfer>, EntityCrudService<Transfer> {
  
  final TransferRepository _repository;

  TransferService(this._repository);

  Future<int> create(Transfer transfer) {
    return _repository.create(transfer);
  }

  Future<List<Transfer>> findAll() {
    return _repository.findAll();
  }
}
