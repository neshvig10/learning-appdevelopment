import 'package:flutter/material.dart';
import 'package:mealsapp/data/dummydata.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/screens/categories.dart';
import 'package:mealsapp/screens/filters.dart';
import 'package:mealsapp/screens/maindrawer.dart';
import 'package:mealsapp/screens/meals.dart';


const Map<Filter,bool> kInitialFilters ={
    Filter.glutenfree: false,
    Filter.lactosefree: false,
    Filter.vegan: false,
    Filter.vegetarian: false,
};

// why stateful ? because on clicking on a button in tabs we should be able to change the screen

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  int _selectedPageIndex = 0;

  List <Meal> favoriteMeals = [];

  Map <Filter,bool> _SelectedFilters = {
    Filter.glutenfree: false,
    Filter.lactosefree: false,
    Filter.vegan: false,
    Filter.vegetarian: false,
  };

  void _selectPage(index){
    setState(() {
      _selectedPageIndex=index;
      });
  }

  void _selectScreen(String identifier) async {
    Navigator.pop(context);
    if (identifier=='filter'){
      final result = await Navigator.push<Map<Filter,bool>>(context, MaterialPageRoute(builder: (ctx) => FiltersScreen(currentFilters: _SelectedFilters,)),);
      // print(result);
      setState(() {
        // ?? makes sure that if the result is null then k initial filters is assigned
        _SelectedFilters=result ?? kInitialFilters; 
      });
    
    }

  }

//  this is used to show pop ups from the bottom of the screen , very nice feature of flutter imo
  void _showInfo(String message){
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)
      ),
    );
  }



  void _toggleFavorites(Meal meal){
    final containsOrNot = favoriteMeals.contains(meal);
    setState(() {
      if (containsOrNot==true){
        favoriteMeals.remove(meal);
        _showInfo('Removed from favorites');
      }
      else{
        favoriteMeals.add(meal);
        _showInfo('Added to favorites');
      }
    });

  }


  @override
  Widget build(BuildContext context) {

    final availableMeals = dummyMeals.where((meal) {
        if (_SelectedFilters[Filter.glutenfree]! && !meal.isGlutenFree){
          return false;
        } 
        if (_SelectedFilters[Filter.lactosefree]! && !meal.isLactoseFree){
          return false;
        }
        if (_SelectedFilters[Filter.vegan]! && !meal.isVegan){
          return false;
        }
        if (_SelectedFilters[Filter.vegetarian]! && !meal.isVegetarian){
          return false;
        }
        return true;
      }).toList();

    Widget activePage = CategoriesScreen(addToFavorites: _toggleFavorites,availableMeals: availableMeals,);
    var activePageTitle = 'Categories';

    if (_selectedPageIndex==1){
      activePageTitle='Favorites';
      activePage= MealsScreen(title: 'Favorites', meals: favoriteMeals, addToFavorites: _toggleFavorites,);
    }

    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle),),
      drawer: MainDrawer(onSelectScreen: _selectScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){_selectPage(index);},
        //  this is for highlighting the icon
        currentIndex: _selectedPageIndex,
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.set_meal),label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star),label: 'Favorites')
        ]
        ),
    );
  }
}