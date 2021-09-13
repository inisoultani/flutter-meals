import 'package:flutter/material.dart';
import 'package:flutter_meals/models/category.dart';

class CategoryMealScreen extends StatelessWidget {
  final Category category;
  const CategoryMealScreen({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.category.title),
      ),
      body: Container(
        child: Text('The Recipes for category ${this.category.title}'),
      ),
    );
  }
}
