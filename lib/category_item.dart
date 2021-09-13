import 'package:flutter/material.dart';
import 'package:flutter_meals/category_meal_scren.dart';
import 'package:flutter_meals/models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({Key? key, required this.category}) : super(key: key);

  void onTap(BuildContext context) {
    print('category ${this.category.title} tapped');
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return CategoryMealScreen(category: this.category);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => this.onTap(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          this.category.title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [this.category.color.withOpacity(0.6), this.category.color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
