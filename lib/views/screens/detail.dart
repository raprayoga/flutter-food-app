import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_food_app/models/product-detail.dart';
import 'package:flutter_food_app/service/product-detail.dart';
import 'package:http/http.dart' as http;

class DetailProduct extends StatefulWidget {
  const DetailProduct({super.key, required this.idMeal});
  final String idMeal;

  @override
  State<DetailProduct> createState() => _DetailProduct();
}

class _DetailProduct extends State<DetailProduct> {
  final bool isFavorite = false;
  late ProductDetail? _product = null;

  @override
  void initState() {
    super.initState();
    _loadProduct();
  }

  _loadProduct() async {
    print('LOAD PRODUCT');
    final service = ProductDetailServices(idMeal: widget.idMeal);
    final product = await service.loadProduct();
    setState(() {
      _product = product;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Food',
          overflow: TextOverflow.ellipsis,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (_product == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Content(product: _product!);
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Icon(isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.red),
        ),
      ),
    );
  }
}

class Content extends StatelessWidget {
  const Content({super.key, required this.product});
  final ProductDetail product;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 350,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Center(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(product.strMealThumb,
                            width: 200, height: 200),
                      ),
                      const SizedBox(height: 32),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          product.strMeal,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: const Text(
                      'Ingredients :',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Column(
                  children: List.generate(
                    product.strIngredients.length,
                    (index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product.strIngredients[index],
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            product.strMeasures[index],
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      );
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: double.infinity,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: const Text(
                      'Instruction :',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Text(
                  product.strInstructions,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
