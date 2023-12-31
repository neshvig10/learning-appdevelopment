import 'package:flutter/material.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/widgets/mealitem.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key, 
    required this.title,
    required this.meals,
    });

  final String title;
  final List<Meal> meals;



  @override
  Widget build(BuildContext context) {

    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context,index)=> 
          MealItem(meal: meals[index],),  
      );

      if (meals.isEmpty){
        content = const Center(
          child: Column(
            children: [
              Text('Uh oh ... no food found,'),
              SizedBox(height: 20),
              Text(' Try another variety'),
            ],
          ),
        );
      }



    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content
    );
  }
}