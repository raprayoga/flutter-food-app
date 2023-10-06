import 'dart:convert';

import 'package:flutter_food_app/models/product-detail.dart';
import 'package:http/http.dart' as http;

class ProductSearchServices {
  const ProductSearchServices({required this.keyword});
  final String keyword;

  Future<List<ProductDetail>> loadProducts() async {
    final url =
        Uri.https('themealdb.com', 'api/json/v1/1/search.php', {'s': keyword});
    final response = await http.get(url);
    if (response.statusCode >= 400) {
      throw Exception('Failed to fetch grocery items. Please try again later.');
    }

    if (response.body == 'null') {
      return [];
    }

    final Map<String, dynamic> listData = json.decode(response.body);
    final List<ProductDetail> loadedItems = [];
    for (final item in listData['meals']!) {
      final List<String> strIngredients = [];
      final List<String> strMeasures = [];

      for (var i = 1; i <= 20; i++) {
        if (item['strIngredient$i'] != '') {
          print(item['strMeasure$i']);
          strIngredients.add(item['strIngredient$i']);
        }
        if (item['strMeasure$i'] != '') {
          strMeasures.add(item['strMeasure$i']);
        }
      }

      loadedItems.add(
        ProductDetail(
          idMeal: item["idMeal"],
          strMeal: item["strMeal"],
          strMealThumb: item["strMealThumb"],
          strDrinkAlternate: item["strDrinkAlternate"],
          strCategory: item["strCategory"],
          strArea: item["strArea"],
          strInstructions: item["strInstructions"],
          strIngredients: strIngredients,
          strMeasures: strMeasures,
        ),
      );
    }

    return loadedItems;
  }
}
