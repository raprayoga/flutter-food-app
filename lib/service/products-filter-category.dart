import 'dart:convert';

import 'package:flutter_food_app/models/products-filter-category.dart';
import 'package:http/http.dart' as http;

class ProductsFilterCategoryServices {
  const ProductsFilterCategoryServices({required this.category});
  final String category;

  Future<List<ProductsFilterCategory>> loadProducts() async {
    final url =
        Uri.https('themealdb.com', 'api/json/v1/1/filter.php', {'c': category});
    final response = await http.get(url);
    if (response.statusCode >= 400) {
      throw Exception('Failed to fetch grocery items. Please try again later.');
    }

    if (response.body == 'null') {
      return [];
    }

    final Map<String, dynamic> listData = json.decode(response.body);
    final List<ProductsFilterCategory> loadedItems = [];
    for (final item in listData['meals']!) {
      loadedItems.add(
        ProductsFilterCategory(
          idMeal: item["idMeal"],
          strMeal: item["strMeal"],
          strMealThumb: item["strMealThumb"],
        ),
      );
    }

    return loadedItems;
  }
}
