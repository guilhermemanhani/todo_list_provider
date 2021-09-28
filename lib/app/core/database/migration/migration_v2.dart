import 'package:flutter_todolist_provider/app/core/database/migration/migration.dart';
import 'package:sqflite_common/sqlite_api.dart';

class MigrationV2 implements Migration {
  @override
  void create(Batch batch) {
    batch.execute('''
    create table teste(id integer)
    ''');
  }

  @override
  void update(Batch batch) {
    batch.execute('''
    create table teste(id integer)
    ''');
  }
}
