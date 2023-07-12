// ignore_for_file: prefer_const_constructors

import 'package:delimeals/widgets/meal_item.dart';
import '../models/meal.dart';

import '/dummy_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routename = '/category-meals';
  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String categorytitle;
  late List<Meal> displayedMeals;
  bool _loadedinitData = false;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (!_loadedinitData) {
      final routeargs = ModalRoute.of(context)?.settings.arguments as Map;
      categorytitle = routeargs['title'];
      final categoryid = routeargs['id'];
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryid);
      }).toList();
      _loadedinitData = true;
    }
    super.didChangeDependencies();
  }

  // void _removeItem(String mealId) {
  //   setState(() {
  //     displayedMeals.removeWhere((element) => element.id == mealId);
  //   });
  // }

  //for second approach of routes
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(categorytitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: displayedMeals[index].id,
              title: displayedMeals[index].title,
              imageUrl: displayedMeals[index].imageUrl,
              duration: displayedMeals[index].duration,
              complexity: displayedMeals[index].complexity,
              affordability: displayedMeals[index].affordability,
              // removeItem: _removeItem,
            );
          },
          itemCount: displayedMeals.length,
        ));
  }
}
