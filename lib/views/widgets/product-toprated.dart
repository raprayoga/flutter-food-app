import 'package:flutter/material.dart';
import 'package:flutter_food_app/models/products-filter-category.dart';
import 'package:flutter_food_app/utlis/manipulate.dart';

class ProductTopRated extends StatelessWidget {
  const ProductTopRated({super.key, required this.product});
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
      child: SizedBox(
        width: 196,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
              child: Image.network(
                product.strMealThumb,
                width: double.maxFinite,
                height: double.maxFinite,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 70,
                  child: Card(
                    color: Theme.of(context).colorScheme.primary,
                    child: Padding(
                      padding: EdgeInsets.all(3),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(
                            Icons.star,
                            size: 22,
                            color: Colors.white,
                          ),
                          Text(
                            '$star',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5, bottom: 5),
                  child: Text(
                    product.strMeal,
                    style: const TextStyle(
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          offset: Offset(1, 1),
                          blurRadius: 5,
                        ),
                      ],
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
