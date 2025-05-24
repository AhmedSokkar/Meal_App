import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';

class DetailsMealScreen extends StatelessWidget {
  const DetailsMealScreen(
      {super.key, required this.meal, required this.onToggleFavorite});

  final Meal meal;

  final void Function(Meal meal) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () => onToggleFavorite(meal),
            icon: const Icon(Icons.favorite),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 15),
            Text(
              "Ingradients",
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(height: 5),
            for (final ingr in meal.ingredients)
              Padding(
                padding: const EdgeInsets.all(3),
                child: Text(
                  ingr,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ),
            const SizedBox(height: 15),
            Text(
              "Steps",
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(height: 5),
            for (final ingr in meal.steps)
              Padding(
                padding: const EdgeInsets.all(7),
                child: Text(
                  ingr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
