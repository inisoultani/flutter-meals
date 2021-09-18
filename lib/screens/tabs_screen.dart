import 'package:flutter/material.dart';
import 'package:flutter_meals/screens/category_screen.dart';
import 'package:flutter_meals/screens/favorite_screen.dart';
import 'package:flutter_meals/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages = [
    {'page' : CategoryScreen(), 'title' : "Category"}, 
    {'page' : FavoriteScreen(), 'title' : "Favorite"}
  ];

  int _selectedIndexPage = 0;

  void _selectPage(int idx) {
    setState(() {
      this._selectedIndexPage = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(this._pages[this._selectedIndexPage]['title'] as String),
      ),
      body: this._pages[this._selectedIndexPage]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: this._selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: this._selectedIndexPage,
        type : BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category), title: Text('Categories')
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.favorite), title: Text('Favorites')
          ),
        ],
      ),
    );
  }
}
