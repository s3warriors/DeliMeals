// ignore_for_file: prefer_const_constructors

import 'package:delimeals/models/category.dart';

import '/dummy_data.dart';
import 'package:flutter/material.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routename = '/meal-details';
  final toggleFavorites;
  final isFavorite;
  const MealDetailsScreen(this.toggleFavorites, this.isFavorite);

  @override
  Widget build(BuildContext context) {
    // final selectedCategory = DUMMY_CATEGORIES
    //     .firstWhere((cat) => cat.id == selectedMeal.categories[0]);
    // print(selectedCategory.title);
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    Widget buildsectionTitle(BuildContext context, String text) {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      );
    }

    Widget buildcontainer(String text, double ht) {
      return Container(
          decoration: BoxDecoration(
              color: Color.fromRGBO(253, 253, 241, 1),
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          height: ht,
          width: 350,
          child: Stack(
            children: [
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          '#${(index + 1)}',
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                      ),
                      title: Text(
                        (text == 'ingredients')
                            ? selectedMeal.ingredients[index]
                            : selectedMeal.steps[index],
                        style: TextStyle(fontSize: 19),
                      ),
                    ),
                    Divider(color: Colors.black45, height: 6),
                  ],
                ),
                itemCount: (text == 'ingredients')
                    ? selectedMeal.ingredients.length
                    : selectedMeal.steps.length,
              ),
              Positioned(
                  bottom: 0,
                  right: 5,
                  child: Icon(
                    Icons.keyboard_double_arrow_down_rounded,
                    size: 33,
                    color: Theme.of(context).primaryColor,
                  ))
            ],
          ));
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            selectedMeal.title,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, left: 7, right: 7),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.elliptical(15, 16),
                      topRight: Radius.elliptical(15, 16),
                    ),
                    child: Image.network(
                      selectedMeal.imageUrl,
                      height: 300,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                buildsectionTitle(context, 'Ingredients'),
                buildcontainer('ingredients', 170),
                buildsectionTitle(context, 'steps'),
                buildcontainer('steps', 250),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () => toggleFavorites(mealId),
          child: Icon(
            (isFavorite(mealId)) ? Icons.star : Icons.star_border,
          ),
        ));
  }
}
