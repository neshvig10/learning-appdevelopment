import 'package:flutter/material.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/screens/mealdetailed.dart';
import 'package:mealsapp/widgets/mealitemtrait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal});

  final Meal meal;

  void _openMealDetailed(BuildContext context,Meal meal){
    Navigator.push(context, MaterialPageRoute(builder: (ctx)=> 
      MealDetailed(meal: meal)
      ),
    );
  }


  String get complexityText {
    return meal.complexity.name[0].toUpperCase()+meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase()+meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      
      child: InkWell(
        onTap: (){_openMealDetailed(context,meal);},
        child: Stack(
          children: [
            // network image is used to load a image whose url is available
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage), image: NetworkImage(meal.imageUrl),width: double.infinity,),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
                child: Column(
                  children: [
                    Text(meal.title,style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24
                     ),
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(icon: Icons.schedule, label: meal.duration.toString()),
                        const SizedBox(width: 20,),
                        MealItemTrait(icon: Icons.work, label: complexityText),
                        const SizedBox(width: 20,),
                        MealItemTrait(icon: Icons.attach_money, label: affordabilityText),
                      ],
                    )
                  ],
                ),
                
              ),
             )
          ],
        ),
      ),
    );

  }
}