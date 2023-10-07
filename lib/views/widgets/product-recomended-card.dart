import 'package:flutter/material.dart';
import 'package:flutter_food_app/models/products-filter-category.dart';
import 'package:flutter_food_app/utlis/manipulate.dart';

class ProductReceomendedCard extends StatelessWidget {
  const ProductReceomendedCard({super.key, required this.product});
  final ProductsFilterCategory product;

  double get star {
    final manipulate = Manipulate();
    return manipulate.generateDouble(3, 5, 1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(5),
        width: 180,
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  child: Image.network(
                    product.strMealThumb,
                    width: 180,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  product.strMeal,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                )
              ],
            ),
            SizedBox(
              height: 30,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      size: 18,
                      color: Colors.yellow[700],
                    ),
                    Text(
                      '$star',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )
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
