import 'package:flutter/material.dart';
import 'package:flutter_meals/screens/category_meal_scren.dart';
import 'package:flutter_meals/screens/category_screen.dart';
import 'package:flutter_meals/screens/meal_detai_screen.dart';
import 'package:flutter_meals/screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.lightGreen,
          accentColor: Colors.orangeAccent,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ))),
      // home: TabsScreen(),
      routes: {
        '/' : (context) => TabsScreen(),
        CategoryMealScreen.ROUTE_NAME: (context) => CategoryMealScreen(),
        MealDetailScreen.ROUTE_NAME: (context) => MealDetailScreen(),
      },
      // onGenerateRoute: (settings) {
      //   print(settings.arguments);
      //   return MaterialPageRoute(builder: (BuildContext context) => CategoryScreen());
      // },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => CategoryScreen());
      },
    );
  }
}
