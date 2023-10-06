import 'dart:convert';

import 'package:flutter_food_app/models/categories.dart';
import 'package:http/http.dart' as http;

class CategoriesServices {
  Future<List<Categories>> loadCategories() async {
    final url = Uri.https('themealdb.com', 'api/json/v1/1/categories.php');
    final response = await http.get(url);
    if (response.statusCode >= 400) {
      throw Exception('Failed to fetch grocery items. Please try again later.');
    }

    if (response.body == 'null') {
      return [];
    }

    final Map<String, dynamic> listData = json.decode(response.body);
    final List<Categories> loadedItems = [];
    for (final item in listData['categories']!) {
      loadedItems.add(
        Categories(
          idCategory: item["idCategory"],
          strCategory: item["strCategory"],
          strCategoryThumb: item["strCategoryThumb"],
          strCategoryDescription: item["strCategoryDescription"],
        ),
      );
    }

    return loadedItems;
  }
}
