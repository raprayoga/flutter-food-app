import 'package:flutter/material.dart';
import 'package:flutter_food_app/models/products-filter-category.dart';
import 'package:flutter_food_app/service/products-filter-category.dart';
import 'package:flutter_food_app/views/screens/detail.dart';
import 'package:flutter_food_app/views/widgets/product-recomended-card.dart';

class ProductsCategory extends StatefulWidget {
  const ProductsCategory({super.key, required this.category});
  final String category;

  @override
  State<ProductsCategory> createState() => _ProductsCategoryState();
}

class _ProductsCategoryState extends State<ProductsCategory> {
  late List<ProductsFilterCategory> _products = [];

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  _loadProducts() async {
    final service = ProductsFilterCategoryServices(category: widget.category);
    final productsCatResponse = await service.loadProducts();
    setState(() {
      _products = productsCatResponse;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.category,
          overflow: TextOverflow.ellipsis,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: GridView.count(
          childAspectRatio: 0.7,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: _products.map(
            (product) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailProduct(idMeal: product.idMeal),
                    ),
                  );
                },
                child: ProductReceomendedCard(product: product),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
