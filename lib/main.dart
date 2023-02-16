import 'package:comidas/components/meal_detail_screen.dart';
import 'package:comidas/models/settings.dart';
import 'package:comidas/screens/categories_meals_screen.dart';
import 'package:comidas/screens/settings_screen.dart';
import 'package:comidas/screens/tabs_screen.dart';
import 'package:comidas/utils/app_routes.dart';
import 'package:flutter/material.dart';

import 'data/dummy_data.dart';
import 'models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _availableMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
        return !(filterGluten || filterLactose || filterVegan || filterVegetarian);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _theme(),
      routes: {
        AppRoutes.HOME : (_) =>  TabsScreen(),
        AppRoutes.CATEGORIES_MEALS: (_) => CategoriesMealsScreen(_availableMeals),
        AppRoutes.MEAL_DETAIL: (_) => MealDetailScreen(),
        AppRoutes.SETTINGS: (_) => SettingsScreen(settings, _filterMeals),
      },
    );
  }
}

ThemeData _theme() {
  return ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.pink,
      foregroundColor: Colors.white,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: 'RobotoCondensed',
        fontSize: 20,
      ),
    ),
    canvasColor: const Color.fromRGBO(255, 254, 229, 1),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
        .copyWith(secondary: Colors.amber),
    fontFamily: 'Raleway',
    textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          bodyText2: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          headline6: const TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
          ),
        ),
  );
}
