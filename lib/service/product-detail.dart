import 'dart:convert';

import 'package:flutter_food_app/models/product-detail.dart';
import 'package:http/http.dart' as http;

class ProductDetailServices {
  const ProductDetailServices({required this.idMeal});
  final String idMeal;

  Future<ProductDetail> loadProduct() async {
    final url =
        Uri.https('themealdb.com', 'api/json/v1/1/lookup.php', {'i': idMeal});
    final response = await http.get(url);
    if (response.statusCode >= 400) {
      throw Exception('Failed to fetch grocery items. Please try again later.');
    }
    final Map<String, dynamic> listData = json.decode(response.body);
    final List<String> strIngredients = [];
    final List<String> strMeasures = [];
    final item = listData['meals'][0];

    for (var i = 1; i <= 20; i++) {
      if (item['strIngredient$i'] != '') {
        strIngredients.add(item['strIngredient$i']);
      }
      if (item['strMeasure$i'] != '') {
        strMeasures.add(item['strMeasure$i']);
      }
    }
    final ProductDetail loadedItems = ProductDetail(
      idMeal: item["idMeal"],
      strMeal: item["strMeal"],
      strMealThumb: item["strMealThumb"],
      strDrinkAlternate: item["strDrinkAlternate"],
      strCategory: item["strCategory"],
      strArea: item["strArea"],
      strInstructions: item["strInstructions"],
      strIngredients: strIngredients,
      strMeasures: strMeasures,
    );

    return loadedItems;
  }
}
