import 'package:comidas/screens/categories_meals_screen.dart';
import 'package:comidas/screens/categories_screen.dart';
import 'package:comidas/utils/app_routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _theme(),
      routes: {
        AppRoutes.HOME : (_) =>  const CategoriesScreen(),
        AppRoutes.CATEGORIES_MEALS: (_) => CategoriesMealsScreen(),
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
