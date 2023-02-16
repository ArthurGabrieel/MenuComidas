import 'package:comidas/components/meal_item.dart';
import 'package:flutter/material.dart';

import '../models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    return favoriteMeals.isEmpty ?
    const Center(
      child: Text('Nenhuma refeição foi marcada como favorita!'),
    )
        :
    ListView.builder(
      itemCount: favoriteMeals.length,
      itemBuilder: (ctx, index) {
        return MealItem(favoriteMeals[index]);
      },
    );
  }
}
