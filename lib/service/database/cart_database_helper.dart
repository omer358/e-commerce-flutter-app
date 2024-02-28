import 'dart:developer';

import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/model/cart_product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartDatabaseHelper {
  CartDatabaseHelper._();

  static final CartDatabaseHelper db = CartDatabaseHelper._();

  late Database _database;

  Future<Database> get database async {
    _database = await initBb();
    return _database;
  }

  initBb() async {
    String path = join(await getDatabasesPath(), dbName);
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute("""
      CREATE TABLE $tableCartProduct (
      $columnName TEXT NOT NULL,
      $columnImage TEXT NOT NULL,
      $columnPrice TEXT NOT NULL,
      $columnQuantity INTEGER NOT NULL
      );
      """);
    });
  }

  Future<void> insert(CartProductModel model) async {
    var dbClient = await database;
    await dbClient.insert(tableCartProduct, model.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<CartProductModel>> fetchProducts() async {
    var dbClient = await database;
    List<Map<String, dynamic>> maps = await dbClient.query(tableCartProduct);
    log(maps.length.toString());
    return maps.isNotEmpty
        ? List.generate(
                maps.length, (index) => CartProductModel.fromJson(maps[index]))
            .toList()
        : [];
  }
}
