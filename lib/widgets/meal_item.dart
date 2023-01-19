import 'package:flutter/material.dart';
import 'package:meal_apps/models/meal.dart';

class MealItem extends StatelessWidget {
  final String title, imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({required this.title,
    required this.imageUrl,
    required this.affordability,
    required this.complexity,
    required this.duration});

  void selectMeal() {}

  String get complexityTxt {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get affordabilityTxt {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Luxurious:
        return 'Expensive';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectMeal,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 4.0,
        margin: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16.0),
                      topLeft: Radius.circular(16.0)),
                  child: Image.network(
                    imageUrl,
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 24.0,
                  right: 8.0,
                  child: Container(
                    padding:
                    EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
                    width: 220.0,
                    color: Colors.black54,
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text('${duration} Minutes')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text(complexityTxt)
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 9.0,
                      ),
                      Text(affordabilityTxt)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
