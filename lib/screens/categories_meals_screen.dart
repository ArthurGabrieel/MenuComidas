import 'package:comidas/components/meal_item.dart';
import 'package:comidas/data/dummy_data.dart';
import 'package:flutter/material.dart';

import '../models/category.dart';

class CategoriesMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;

    final categoryMeal = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
          itemCount: categoryMeal.length,
          itemBuilder: (ctx, index) {
            return MealItem(categoryMeal[index]);
          }),
    );
  }
}
