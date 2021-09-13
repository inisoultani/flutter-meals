import 'package:flutter/material.dart';
import 'package:flutter_meals/models/category.dart';

class CategoryMealScreen extends StatelessWidget {
  const CategoryMealScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final route = ModalRoute.of(context);
    if (route == null) return SizedBox.shrink();
    final routeArgs = route.settings.arguments as Map<String, String>;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(routeArgs['title']!),
      ),
      body: Container(
        child: Text('The Recipes for category ${routeArgs['title']!}'),
      ),
    );
  }
}
