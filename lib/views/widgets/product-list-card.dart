import 'package:flutter/material.dart';
import 'package:flutter_food_app/models/product-detail.dart';

class ProductListCard extends StatelessWidget {
  const ProductListCard({super.key, required this.product});
  final ProductDetail product;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.white70,
      child: Padding(
        padding: EdgeInsets.all(7),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(product.strMealThumb),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        product.strMeal,
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Text(
                      product.strInstructions,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 10),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
