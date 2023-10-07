import 'package:flutter/material.dart';
import 'package:flutter_food_app/models/categories.dart';
import 'package:flutter_food_app/models/product-detail.dart';
import 'package:flutter_food_app/models/products-filter-category.dart';
import 'package:flutter_food_app/service/categories.dart';
import 'package:flutter_food_app/service/product-search.dart';
import 'package:flutter_food_app/service/products-filter-category.dart';
import 'package:flutter_food_app/views/screens/detail.dart';
import 'package:flutter_food_app/views/screens/products-category.dart';
import 'package:flutter_food_app/views/widgets/product-category.dart';
import 'package:flutter_food_app/views/widgets/product-list-card.dart';
import 'package:flutter_food_app/views/widgets/product-recomended-card.dart';
import 'package:flutter_food_app/views/widgets/product-toprated.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Categories> _categories = [];
  List<ProductsFilterCategory> _productsCat = [];
  List<ProductsFilterCategory> _topRated = [];
  List<ProductDetail> _products = [];

  @override
  void initState() {
    super.initState();
    _loadCategories();
    _loadProductsCat();
    _loadTopRated();
    _loadProducts();
  }

  _loadCategories() async {
    final service = CategoriesServices();
    final categoriesResponse = await service.loadCategories();
    setState(() {
      _categories = categoriesResponse;
    });
  }

  _loadProductsCat() async {
    const service = ProductsFilterCategoryServices(category: 'Seafood');
    final productsCatResponse = await service.loadProducts();
    setState(() {
      _productsCat = productsCatResponse;
    });
  }

  _loadTopRated() async {
    const service = ProductsFilterCategoryServices(category: 'Chicken');
    final productsCatResponse = await service.loadProducts();
    setState(() {
      _topRated = productsCatResponse;
    });
  }

  _loadProducts() async {
    const service = ProductSearchServices(keyword: 'breakfast');
    final products = await service.loadProducts();
    setState(() {
      _products = products;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                filled: true,
                hintText: "Search food",
              ),
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: SizedBox(
              width: double.infinity,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: const Text(
                  'Explore Categories',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10, left: 10),
            height: 65,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: _categories.map(
                (category) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProductsCategory(
                            category: category.strCategory,
                          ),
                        ),
                      );
                    },
                    child: ProductCategory(category: category),
                  );
                },
              ).toList(),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10, top: 10, left: 10),
            height: 280,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: _productsCat.map(
                (product) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetailProduct(
                            idMeal: product.idMeal,
                          ),
                        ),
                      );
                    },
                    child: ProductReceomendedCard(product: product),
                  );
                },
              ).toList(),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.red.withOpacity(0.4),
                  Colors.red.withOpacity(0.8),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            margin: EdgeInsets.symmetric(vertical: 20),
            height: 300,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: SizedBox(
                    width: double.infinity,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: const Text(
                        'Top-rated food',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10, left: 10),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: _topRated.map(
                        (product) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => DetailProduct(
                                    idMeal: product.idMeal,
                                  ),
                                ),
                              );
                            },
                            child: ProductTopRated(product: product),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Column(
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
                    child: ProductListCard(product: product),
                  );
                },
              ).toList(),
            ),
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
