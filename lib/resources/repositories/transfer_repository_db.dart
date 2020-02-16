import 'package:bestbank/domain/transfer/entities/transfer.dart';
import 'package:bestbank/domain/transfer/transfer_repository.dart';
import 'package:sqflite/sqlite_api.dart';

class TransferRepositoryDb implements TransferRepository {
  final Future<Database> _database;

  TransferRepositoryDb(this._database);

  @override
  Future<int> create(Transfer transfer) async {
    final db = await _database;
    return await db.insert(_tableName, transfer.toMap());
  }

  @override
  Future<List<Transfer>> findAll() async {
    final db = await _database;
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    return result.map((row) => row.toObject()).toList();
  }
}

final String _tableName = 'transfers';
final String _id = 'id';
final String _amount = 'amount';
final String _accountNumber = 'account_number';

extension on Transfer {
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> row = Map();
    row[_id] = this.id;
    row[_amount] = this.amount;
    row[_accountNumber] = this.accountNumber;
    return row;
  }
}

extension on Map<String, dynamic> {
  Transfer toObject() {
    return Transfer(
      this[_id],
      this[_amount],
      this[_accountNumber],
    );
  }
}
