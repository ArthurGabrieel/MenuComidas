enum Complexity {
  Simple,
  Challenging,
  Hard,
  Difficult,
}

enum Cost {
  Cheap,
  Affordable,
  Pricey,
  Luxurious, Expensive,
}

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final int duration;
  final List<String> ingredients;
  final List<String> steps;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  final Cost cost;
  final Complexity complexity;

  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.ingredients,
    required this.steps,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.cost,
    required this.complexity,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      case Complexity.Difficult:
        return 'Difficult';
      default:
        return 'Unknown';
    }
  }

  String get costText {
    switch (cost) {
      case Cost.Cheap:
        return 'Cheap';
      case Cost.Affordable:
        return 'Affordable';
      case Cost.Pricey:
        return 'Pricey';
      case Cost.Luxurious:
        return 'Luxurious';
      case Cost.Expensive:
        return 'Expensive';
      default:
        return 'Unknown';
    }
  }
}
