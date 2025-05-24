import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/Details_screen.dart';
import 'package:meal_app/widget/meal_item.dart';

class MealScreen extends StatelessWidget {
  const MealScreen(
      {super.key,
      required this.title,
      required this.meals,
      required this.addFavorite});

  final String title;
  final List<Meal> meals;
  final Function(Meal meal) addFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: meals
              .map((meaL) => MealItem(
                    meal: meaL,
                    toDetail: (meaL) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsMealScreen(
                            meal: meaL,
                            onToggleFavorite: addFavorite,
                          ),
                        ),
                      );
                    },
                  ))
              .toList(),
        ),
      ),
    );
  }
}
