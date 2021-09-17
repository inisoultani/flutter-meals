import 'package:flutter/material.dart';
import 'package:flutter_meals/screens/category_screen.dart';
import 'package:flutter_meals/screens/favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2, 
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meals'),
          bottom: TabBar(
            tabs: [
              Tab(icon : Icon(Icons.category), text: 'Categories',),
              Tab(icon : Icon(Icons.favorite), text: 'Favorites',),
            ],
          ),
        ),
        body: TabBarView(children: [
          CategoryScreen(),
          FavoriteScreen()
        ],),
      )
    );
  }
}
