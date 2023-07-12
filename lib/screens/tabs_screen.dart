// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:delimeals/models/meal.dart';
import 'package:delimeals/widgets/main_drawer.dart';

import '/screens/categories_screen.dart';
import '/screens/favourites_screen.dart';
import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favouritedMeals;
   TabScreen(this.favouritedMeals);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
 late List<Map<String, Object>> _pages ;
  @override
  void initState() {
 _pages = [
    {
      'page': CategoryScreen(),
      'title': 'Categories',
    },
    {
      'page': FavoritesScreen(widget.favouritedMeals),
      'title': 'Favourites',
    },
  ];
    super.initState();
  }
  int _selected_index = 0;
  void _selectTab(int index) {
    setState(() {
      _selected_index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return
        /*   //1st method-> tabs will be seen below the appbar
    DefaultTabController(
      initialIndex: 0,
        length: 2,
        child: Scaffold(
            appBar: AppBar(
               backgroundColor: Theme.of(context).primaryColor,
              title: Text('Meals'),
              bottom: TabBar(
                tabs: [
                Tab(
                  icon: Icon(Icons.category),
                  text: 'Categories',
                ),
                Tab(
                  icon: Icon(Icons.star),
                  text: 'Favourites',
                )
              ]),
            ),
            body: TabBarView(
              children: [
                CategoryScreen(),
                FavoritesScreen(),
              ],
            ))); */

        Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(_pages[_selected_index]['title'] as String),
      ),
      drawer: MainDrawer(),
      body: _pages[_selected_index]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectTab,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.white,
          currentIndex: _selected_index,
          type: BottomNavigationBarType
              .shifting, //if we r doing this so we need to define background color for every item
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              label: 'Favourites',
            ),
          ]),
    );
  }
}
