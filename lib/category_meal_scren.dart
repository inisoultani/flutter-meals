import 'package:flutter/material.dart';
import './dummy_data.dart';

class CategoryMealScreen extends StatelessWidget {
  static const ROUTE_NAME = '/category-meals';

  const CategoryMealScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final route = ModalRoute.of(context);
    if (route == null) return SizedBox.shrink();
    final routeArgs = route.settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(routeArgs['title']!),
      ),
      body: ListView.builder(
        itemBuilder: (context, idx) {
          return Text(categoryMeals[idx].title);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
