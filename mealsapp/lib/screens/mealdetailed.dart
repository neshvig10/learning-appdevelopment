import 'package:flutter/material.dart';
import 'package:mealsapp/models/meal.dart';

class MealDetailed extends StatelessWidget {
  const MealDetailed({super.key,required this.meal,required this.addToFavorites});

  final Meal meal;

  final void Function(Meal meal) addToFavorites;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(meal.title),actions: [
        IconButton(onPressed: (){addToFavorites(meal);}, icon: const Icon(Icons.star))
      ],),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20,),
            Text('Ingredients',style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            for (final ingredient in meal.ingredients)
              Text(ingredient.toString(),style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Theme.of(context).colorScheme.onBackground
              ),
            ),
              Text('Steps',style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
              ),
             ),
            for (final step in meal.steps)           
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: Text(step.toString(), style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground
                ),),
              )
          ],
        ),
      ),
    );
  }
}