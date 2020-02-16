import 'package:bestbank/domain/contact/contact_repository.dart';
import 'package:bestbank/domain/contact/entities/contact.dart';
import 'package:sqflite/sqlite_api.dart';

class ContactRepositoryDb implements ContactRepository {
  final Future<Database> _database;

  ContactRepositoryDb(this._database);

  @override
  Future<int> create(Contact contact) async {
    final db = await _database;
    return await db.insert(_tableName, contact.toMap());
  }

  @override
  Future<List<Contact>> findAll() async {
    final db = await _database;
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    return result.map((row) => row.toObject()).toList();
  }
}

final String _tableName = 'contacts';
final String _id = 'id';
final String _name = 'name';
final String _accountNumber = 'account_number';

extension on Contact {
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> row = Map();
    row[_id] = this.id;
    row[_name] = this.name;
    row[_accountNumber] = this.accountNumber;
    return row;
  }
}

extension on Map<String, dynamic> {
  Contact toObject() {
    return Contact(
      this[_id],
      this[_name],
      this[_accountNumber],
    );
  }
}
