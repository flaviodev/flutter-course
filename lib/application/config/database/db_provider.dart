import 'package:flutter/rendering.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

const _contacts = 'CREATE TABLE contacts ('
    'id VARCHAR(36) PRIMARY KEY, '
    'name TEXT, '
    'account_number INTEGER)';
const _transfers = 'CREATE TABLE transfers ('
    'id VARCHAR(36) PRIMARY KEY, '
    'amount REAL, '
    'account_number INTEGER)';

class DBProvider {
  Future<Database> database() {
    return getDatabasesPath().then((dbPath) {
      final String path = join(dbPath, 'best_bank.db');

      return openDatabase(path, onCreate: (db, version) async {
        debugPrint("create contacts: $_contacts");
        await db.execute(_contacts);

        debugPrint("create transfers: $_transfers");
        await db.execute(_transfers);
      }, version: 1);
    });
  }
}
