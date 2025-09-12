import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

// This part links the tables and the generated code.
part 'database.g.dart';

// --- Define Tables ---

// A table to store the results of our expensive loadout calculations
class CachedLoadouts extends Table {
  IntColumn get algorithmVersion => integer()();
  TextColumn get cacheKey => text()();
  TextColumn get loadout => text()();

  @override
  Set<Column> get primaryKey => {algorithmVersion, cacheKey};
}

// --- The Database Class ---

@DriftDatabase(tables: [CachedLoadouts])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

// This is the platform-specific code for opening the database file.
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'artifacts_mmo_db.sqlite'));
    print('Opening database file: ${file.path}');
    return NativeDatabase.createInBackground(file);
  });
}