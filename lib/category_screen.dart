import 'package:flutter/material.dart';
import 'package:flutter_meals/category_item.dart';
import './dummy_data.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  List<CategoryItem> renderCategoryItems() {
    return DUMMY_CATEGORIES.map((category) =>
        CategoryItem(category: category)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DailyMeal'),),
      body: GridView(
        padding: const EdgeInsets.all(20.0),
        children: [...this.renderCategoryItems()],
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2, // for 200 widht, we had 300 height
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
