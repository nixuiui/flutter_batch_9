import 'package:flutter_batch_9/pages/day_7/data/database/app_database.dart';

class ProductDb {

  final AppDatabase db;
  
  ProductDb(this.db);

  Future<List<Product>> getAllProducts() async {
    return await db.select(db.products).get();
  }

  Future<Product> getProductById(int id) async {
    return await (db.select(db.products)..where((tbl) => tbl.id.equals(id))).getSingle();
  }

  Future<void> insertProduct(ProductsCompanion product) async {
    await db.into(db.products).insert(product);
  }

  Future<void> updateProduct(ProductsCompanion product) async {
    await db.update(db.products).replace(product);
  }

  Future<void> deleteProduct(int id) async {
    await (db.delete(db.products)..where((tbl) => tbl.id.equals(id))).go();
  }

}