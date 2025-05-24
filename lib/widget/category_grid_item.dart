import 'package:flutter/material.dart';
import 'package:meal_app/models/Category.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meal_screen.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem(
      {super.key,
      required this.category,
      required this.addFavorite,
      required this.availableMeals});

  final List<Meal> availableMeals;

  final Category category;
  final Function(Meal meal) addFavorite;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      onTap: () {
        final mealList = availableMeals
            .where((meal) => meal.categories.contains(category.id))
            .toList();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MealScreen(
              title: category.title,
              meals: mealList,
              addFavorite: addFavorite,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                category.color.withOpacity(.5),
                category.color,
              ],
            ),
            borderRadius: BorderRadius.circular(16)),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
