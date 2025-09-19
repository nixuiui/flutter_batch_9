import 'package:drift/drift.dart';

class Products extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 2, max: 100)();
  RealColumn get price => real()();
  TextColumn get description => text().nullable()();
}