import 'package:flutter/material.dart';
import 'package:navegacao/models/category.dart';
import '../components/meal_item.dart';
import '../models/meal.dart';

class CategoriesMealsScreen extends StatelessWidget {
  final List<Meal> meals;
  const CategoriesMealsScreen(this.meals, {super.key});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;
    final categoryMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: Theme.of(context).textTheme.headline1,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(category.title),
      ),
      body: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: ((ctx, index) {
            return MealItem(categoryMeals[index]);
          })),
    );
  }
}
