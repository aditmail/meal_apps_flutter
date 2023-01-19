import 'package:flutter/material.dart';

import 'package:meal_apps/src/dummy_data.dart';
import 'package:meal_apps/widgets/meal_item.dart';

import '../models/meal.dart';

class CategoryMealScreen extends StatelessWidget {
  static const String routeName = '/category-meals';

  /*final String categoryId;
  final String categoryTitle;

  CategoryMealScreen(this.categoryId, this.categoryTitle);*/

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              id: categoryMeals[index].id,
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              affordability: categoryMeals[index].affordability,
              complexity: categoryMeals[index].complexity,
              duration: categoryMeals[index].duration);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
