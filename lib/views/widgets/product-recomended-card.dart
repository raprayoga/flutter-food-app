import 'package:flutter/material.dart';
import 'package:flutter_food_app/models/products-filter-category.dart';

class ProductReceomendedCard extends StatelessWidget {
  const ProductReceomendedCard({super.key, required this.product});
  final ProductsFilterCategory product;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(5),
        width: 180,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  size: 15.0,
                  color: Colors.yellow[700],
                ),
                const Text(
                  '(4.6)',
                  style: TextStyle(fontSize: 10),
                )
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.all(
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
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Rp 45k',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
