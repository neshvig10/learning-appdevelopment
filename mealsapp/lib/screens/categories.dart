import 'package:flutter/material.dart';
import 'package:mealsapp/data/dummydata.dart';
import 'package:mealsapp/models/category.dart';
import 'package:mealsapp/models/meal.dart';
// import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/screens/meals.dart';
import 'package:mealsapp/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key,required this.availableMeals});


  final List<Meal> availableMeals;

  void _selectCategory(BuildContext context,Category category){
    // this function pushes the widget meals screen on top of this categories 
    // I should understand the part (ctx) => i feel that this returns mealsscreen function 

    final filteredMeals = availableMeals.where((element) => element.categories.contains(category.id)).toList();
    
    // where is a function which is applied to all the elements of the list and returns a modified list
    Navigator.push(context, MaterialPageRoute(
      builder: (ctx) => MealsScreen(title:'Meals' ,meals: filteredMeals),
          ),
      );
    // Navigator.of(context).push(route)
  }

  @override
  Widget build(BuildContext context) {
    return  GridView(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 20,mainAxisSpacing: 20,childAspectRatio: 3/2),
        children: [
          // using a for loop inside a list 
          // for loop is an alternate for a map
          for (final category in availableCategories)
            CategoryGridItem(category: category,onSelectCategory: (){_selectCategory(context,category);},)
        ],
      );
  }
}