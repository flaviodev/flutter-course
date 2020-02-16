import 'package:bestbank/domain/transfer/entities/transfer.dart';

abstract class TransferRepository {
  Future<int> create(Transfer tranfer);
  Future<List<Transfer>> findAll();
}
