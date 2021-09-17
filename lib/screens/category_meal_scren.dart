import 'package:flutter/material.dart';
import 'package:flutter_meals/models/meal.dart';
import 'package:flutter_meals/widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealScreen extends StatelessWidget {
  static const ROUTE_NAME = '/category-meals';

  const CategoryMealScreen({Key? key}) : super(key: key);

  ListTile renderListTileMeal(Meal meal) {
    return ListTile(
      leading: FittedBox(
        child: Container(
          child: Image(image: NetworkImage(meal.imageUrl, scale: 1.0)),
          height: 100,
          width: 200,
        ),
        fit: BoxFit.contain,
        alignment: Alignment.center,
      ),
    );
  }

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
          print('render meal : $idx');
          return MealItem(
            id: categoryMeals[idx].id,
            title: categoryMeals[idx].title, 
            imageUrl: categoryMeals[idx].imageUrl, 
            duration: categoryMeals[idx].duration, 
            complexity: categoryMeals[idx].complexity, 
            affordability: categoryMeals[idx].affordability
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
