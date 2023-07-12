import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favouritedMeals;
  const FavoritesScreen( this.favouritedMeals);

  @override
  Widget build(BuildContext context) {
    if(favouritedMeals.isEmpty)
    {return Center(child: Text('Favourites'),);}
    else {
      return ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: favouritedMeals[index].id,
              title: favouritedMeals[index].title,
              imageUrl: favouritedMeals[index].imageUrl,
              duration: favouritedMeals[index].duration,
              complexity: favouritedMeals[index].complexity,
              affordability: favouritedMeals[index].affordability,
         
            );
          },
          itemCount: favouritedMeals.length,
        );
    }
  }
}