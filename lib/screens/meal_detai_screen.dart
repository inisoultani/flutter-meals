import 'package:flutter/material.dart';
import 'package:flutter_meals/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const ROUTE_NAME = '/meal-detail';

  const MealDetailScreen({Key? key}) : super(key: key);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
        height: 200,
        width: 300,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 20),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final meal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(meal.imageUrl, fit: BoxFit.cover),
          ),
          this.buildSectionTitle(context, 'Ingridients'),
          this.buildContainer(ListView.builder(
            itemBuilder: (context, idx) {
              return Card(
                color: Theme.of(context).accentColor,
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(meal.ingredients[idx])),
              );
            },
            itemCount: meal.ingredients.length,
          )),
          this.buildSectionTitle(context, 'Steps'),
          this.buildContainer(ListView.builder(
            itemBuilder: (context, idx) {
              // return Card(
              //   color: Theme.of(context).accentColor,
              //   child: Padding(
              //       padding:
              //           EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              //       child: Text(meal.ingredients[idx])),
              // );
              return Column(
                children : [
                  ListTile(
                    leading: CircleAvatar(child: Text('#${idx}'),),
                    title: Text(meal.steps[idx]),
                  ),
                  Divider()
                ],
              );
            },
            itemCount: meal.steps.length,
          )),
        ]),
      ),
    );
  }
}
