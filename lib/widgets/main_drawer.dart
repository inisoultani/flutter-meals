import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(String text, IconData iconData) {
    return ListTile(
      leading: Icon(iconData, size: 25,),
      title: Text(
        text,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: selectDrawerMenu,
    );
  }

  void selectDrawerMenu() {}

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).primaryColorLight,
            child: Text(
              'Cooking up !',
              style:
                  TextStyle(
                    fontWeight: FontWeight.w900, 
                    fontFamily: 'Raleway', 
                    color: Theme.of(context).primaryColor,
                    fontSize: 25,
                  ),
            ),
          ),
          SizedBox(height: 20),
          this.buildListTile('Meals', Icons.restaurant),
          this.buildListTile('Settings', Icons.settings),
        ],
      ),
    );
  }
}
