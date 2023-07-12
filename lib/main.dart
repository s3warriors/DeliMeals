// ignore_for_file: prefer_const_constructors

import './dummy_data.dart';
import './models/meal.dart';
import './screens/filters_screen.dart';

import './screens/category_meals_screen.dart';
import './screens/meal_details_screen.dart';
import './screens/tabs_screen.dart';

import './screens/categories_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'vegan': false,
    'vegetarian': false,
    'gluten': false,
    'lactose': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  final List<Meal> _favouritedMeals = [];
  void _setFilters(Map<String, bool> filtersData) {
    _filters = filtersData;
    _availableMeals = DUMMY_MEALS.where((meal) {
      if (_filters['gluten'] == true && !meal.isGlutenFree) return false;
      if (_filters['lactose'] == true && !meal.isLactoseFree) return false;
      if (_filters['vegan'] == true && !meal.isVegan) return false;
      if (_filters['vegetarian'] == true && !meal.isVegetarian) return false;
      return true;
    }).toList();
  }

  void _toggleFavorite(String mealid) {
    var existingindex =
        _favouritedMeals.indexWhere((meal) => meal.id == mealid);
    if (existingindex >= 0) {
      setState(() {
        _favouritedMeals.removeAt(existingindex);
      });
    } else {
      setState(() {
        _favouritedMeals.add(
          DUMMY_MEALS.firstWhere((element) => element.id == mealid),
        );
      });
    }
  }
  bool _isFavorite(String id){
   return   _favouritedMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Delimeals',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 45, 26, 33),
        primarySwatch: Colors.brown,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.amber),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodySmall: TextStyle(color: Color.fromRGBO(21, 51, 51, 1)),
            bodyLarge: TextStyle(color: Color.fromRGBO(21, 51, 51, 1)),
            titleMedium: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold),
            titleSmall: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold)),
        // useMaterial3: true,
      ),
      // home: const TabScreen(),
      routes: {
        '/': (ctx) => TabScreen(_favouritedMeals), //->>>> one way
        CategoryMealsScreen.routename: (ctx) =>
            CategoryMealsScreen(_availableMeals), // second approach for routes
        MealDetailsScreen.routename: (ctx) => MealDetailsScreen(_toggleFavorite,_isFavorite),
        FiltersScreen.routename: (ctx) =>
            FiltersScreen(_setFilters, _filters), // second approach for routes
      },

      //for any strange navigation,This is used if [routes] does not contain the requested route.
      onGenerateRoute: (settings) {
        print(settings.arguments);
        // return MaterialPageRoute(builder: (ctx) => CategoryScreen());
      },

      //Called when [onGenerateRoute] fails to generate a route, except for the [initialRoute].This callback is typically used for error handling. For example, this callback might always generate a "not found" page that describes the route that wasn't found.
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoryScreen());
      },
    );
  }
}
