import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_batch_9/pages/day_7/data/database/product.table.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

// run in terminal: flutter pub run build_runner build --delete-conflicting-outputs
part 'app_database.g.dart';

@DriftDatabase(tables: [Products])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app_database.sqlite'));
    return NativeDatabase(file);
  });
}