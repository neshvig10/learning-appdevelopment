import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/providers/favoritesprovider.dart';

// change stateless widget to a consumer widget 
//  whenever riverpod is used we have to change like this

class MealDetailed extends ConsumerWidget {
  const MealDetailed({super.key,required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(meal.title),actions: [
        // we should use read instead of watch
        IconButton(onPressed: (){
          ScaffoldMessenger.of(context).clearSnackBars();
          if (ref.read(favoriteMealsProvider.notifier).toggleMealFavoriteStatus(meal)){
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Added to Favorites'),
            ),);
          }
          else{
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Removed from Favorites')
            ),
            );
          }
        }, icon: const Icon(Icons.star))
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