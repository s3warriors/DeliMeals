// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final Color color;


  const CategoryItem(this.id, this.title, this.color, this.imageUrl);
  void selectCategory(BuildContext ctx) {
/*    /* this is one way for navigation */

  Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return CategoryMealsScreen(id,title);
    })); */

    Navigator.of(ctx).pushNamed(
        // '/category-meals', arguments: {'id': id, 'title': title}    first approACH
        CategoryMealsScreen.routename,
        arguments: {'id': id, 'title': title} //second approach for route
        );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
  child: Stack(
      children: [
             ClipRRect(
                  borderRadius: BorderRadius.all(
                   Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    bottom: 9,
                    right: 10,
                  child: Container(padding: EdgeInsets.symmetric(vertical:6,horizontal:15),
                     decoration: BoxDecoration(
                        color: Color.fromARGB(221, 29, 28, 28),
                        borderRadius: BorderRadius.all(Radius.circular(9))),
                    child: Text(
                            title,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                  ),
                ),
      ],
    ));
    
    
    
    
    // return InkWell(
    //   onTap: () => selectCategory(context),
    //   splashColor: Theme.of(context).primaryColor,
    //   borderRadius: BorderRadius.circular(15),
    //   child: Container(
    //     padding: const EdgeInsets.all(15),
    //     decoration: BoxDecoration(
    //       gradient: LinearGradient(
    //         colors: [ color,color.withOpacity(0.77),],
    //         begin: Alignment.topLeft,
    //         end: Alignment.bottomRight,
    //       ),
    //       borderRadius: BorderRadius.circular(15),
    //     ),
    //     child: Text(
    //       title,
    //       style: Theme.of(context).textTheme.titleSmall,
    //     ),
    //   ),
    // );
  }
}
