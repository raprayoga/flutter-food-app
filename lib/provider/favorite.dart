import 'package:flutter_food_app/models/products-filter-category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart' as path;

Future<Database> _getDatabase() async {
  final dbPath = await sql.getDatabasesPath();
  final db = await sql.openDatabase(
    path.join(dbPath, 'favorites.db'),
    onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE favorites(id TEXT PRIMARY KEY, strMeal TEXT, strMealThumb TEXT)');
    },
    version: 1,
  );
  return db;
}

class FavoriteNotifier extends StateNotifier<List<ProductsFilterCategory>> {
  FavoriteNotifier() : super(const []);

  Future<void> loadFavorite() async {
    final db = await _getDatabase();
    final data = await db.query('favorites');
    final favorites = data
        .map(
          (row) => ProductsFilterCategory(
            idMeal: row['id'] as String,
            strMeal: row['strMeal'] as String,
            strMealThumb: row['strMealThumb'] as String,
          ),
        )
        .toList();

    state = favorites;
  }

  void addFavorite(String idMeal, String strMeal, String strMealThumb) async {
    final newFavorite = ProductsFilterCategory(
        idMeal: idMeal, strMeal: strMeal, strMealThumb: strMealThumb);

    final db = await _getDatabase();
    db.insert('favorites', {
      'id': newFavorite.idMeal,
      'strMeal': newFavorite.strMeal,
      'strMealThumb': newFavorite.strMealThumb,
    });
  }

  void deleteFavorite(String idMeal) async {
    final db = await _getDatabase();
    db.delete('favorites', where: 'id = ?', whereArgs: [idMeal]);
  }
}

final favoriteProvider =
    StateNotifierProvider<FavoriteNotifier, List<ProductsFilterCategory>>(
  (ref) => FavoriteNotifier(),
);
