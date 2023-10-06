import 'package:flutter/material.dart';
import 'package:flutter_food_app/models/categories.dart';

class ProductCategory extends StatelessWidget {
  const ProductCategory({super.key, required this.category});

  final Categories category;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              category.strCategoryThumb,
              width: 50,
            ),
          ),
          SizedBox(
            width: 60,
            child: Text(
              category.strCategory,
              style: const TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
