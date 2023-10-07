import 'package:flutter/material.dart';
import 'package:flutter_food_app/models/products-filter-category.dart';
import 'package:flutter_food_app/provider/favorite.dart';
import 'package:flutter_food_app/views/screens/detail.dart';
import 'package:flutter_food_app/views/widgets/product-recomended-card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_food_app/views/widgets/navbar.dart';

class Favorite extends ConsumerStatefulWidget {
  const Favorite({super.key});

  @override
  ConsumerState<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends ConsumerState<Favorite> {
  @override
  void initState() {
    super.initState();
    ref.read(favoriteProvider.notifier).loadFavorite();
  }

  List<ProductsFilterCategory> get _products {
    final favorites = ref.watch(favoriteProvider);
    return favorites;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: GridView.count(
        childAspectRatio: 0.7,
        padding: EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: _products.map(
          (product) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DetailProduct(idMeal: product.idMeal),
                  ),
                );
              },
              child: ProductReceomendedCard(product: product),
            );
          },
        ).toList(),
      ),
    );
  }
}
