import 'package:flutter/material.dart';
import 'package:meal_app/Data/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widget/category_grid_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen(
      {super.key, required this.addFavorite, required this.availableMeals});

  final List<Meal> availableMeals;

  final Function(Meal meal) addFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 3 / 2.5,
          ),
          children: [
            //i do for loop to have each item specific in availableCategories List in dummy_data
            for (final cate in availableCategories)
              CategoryGridItem(
                category: cate,
                addFavorite: addFavorite,
                availableMeals: availableMeals,
              ),
          ],
        ),
      ),
    );
  }
}
