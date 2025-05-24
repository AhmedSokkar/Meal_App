import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.toDetail});

  final Meal meal;

  final Function(Meal meal) toDetail;

  String get complexityText {
    switch (meal.complexity) {
      case Complexity.simple:
        return 'simple';
      case Complexity.challenging:
        return 'challenging';
      case Complexity.hard:
        return 'hard';
      default:
        return 'unkown';
    }
  }

  String get affordabilityText {
    switch (meal.affordability) {
      case Affordability.pricey:
        return 'pricey';
      case Affordability.affordable:
        return 'affordable';
      case Affordability.luxurious:
        return 'luxurious';
      default:
        return 'unkown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: Theme.of(context).colorScheme.onPrimary,
        onTap: () {
          toDetail(meal);
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              right: 0,
              child: Container(
                color: Colors.black45,
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        //duration
                        Row(
                          children: [
                            const Icon(Icons.schedule_rounded),
                            const SizedBox(width: 5),
                            Text(
                              "${meal.duration.toString()} min",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        //complexity
                        Row(
                          children: [
                            const Icon(Icons.work),
                            const SizedBox(width: 5),
                            Text(
                              complexityText,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        //Affordability
                        Row(
                          children: [
                            const Icon(Icons.attach_money),
                            const SizedBox(width: 5),
                            Text(
                              affordabilityText,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
