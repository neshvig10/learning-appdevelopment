import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/screens/filters.dart';


enum Filter1{
  glutenFree,
  lactoseFree,
  vegeterian,
  vegan
}

class FiltersNotifier extends StateNotifier<Map<Filter1,bool>> {
  FiltersNotifier() 
  : super({
    Filter1.glutenFree :false,
    Filter1.lactoseFree : false,
    Filter1.vegeterian : false,
    Filter1.vegan : false 
  });

  // constructor 

  void setFilter(Filter1 filter,bool isActive){
    state = {
      ...state,
      filter : isActive,
    };
  }

  void setFilters(Map<Filter1,bool> chosenFilters){
    state = chosenFilters;
  }
}

final filtersProvider = StateNotifierProvider((ref) => FiltersNotifier());