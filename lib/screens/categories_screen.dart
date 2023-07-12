// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../widgets/category_items.dart';
import '../dummy_data.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).primaryColor,
      //   title: Text(
      //     'Delimeal',
      //     style: TextStyle(
      //       fontSize: 24,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      // ),
      body: Container(
        color: Theme.of(context).canvasColor,
        child: GridView(
          
          padding: const EdgeInsets.all(9),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              crossAxisSpacing: 20,
              childAspectRatio: 1.2,
              mainAxisSpacing: 20),
          children: DUMMY_CATEGORIES
              .map((catdata) => CategoryItem(
                catdata.id,
                    catdata.title,
                    catdata.color,
                    catdata.imageUrl,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
