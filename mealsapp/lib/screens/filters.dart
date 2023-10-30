import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/providers/filtersprovider.dart';


enum Filter {
  glutenfree,
  lactosefree,
  vegan,
  vegetarian,
}


class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key});
  

  @override
  ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {

  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var veganFilterSet = false;
  var vegetarianFilterSet = false;

  @override
  void initState() {
    super.initState();
    final activeFilters = ref.read(filtersProvider);
    _glutenFreeFilterSet = activeFilters[Filter.glutenfree]!;
    _lactoseFreeFilterSet = activeFilters[Filter.lactosefree]!;
    veganFilterSet = activeFilters[Filter.vegan]!;
    vegetarianFilterSet = activeFilters[Filter.vegetarian]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: const Text('Your Filters'),
      ),
    body: WillPopScope(
      // understand the use of async
      onWillPop: () async{ 
        ref.read(filtersProvider.notifier).setFilters({
          Filter.glutenfree :_glutenFreeFilterSet,
          Filter.lactosefree :_lactoseFreeFilterSet,
          Filter.vegan : veganFilterSet,
          Filter.vegetarian : vegetarianFilterSet
      });
        Navigator.of(context).pop();
      return false;
      },
      child: Column(
        children: [
          SwitchListTile(
            value: _glutenFreeFilterSet, 
            onChanged: (newValue){
              setState(() {
                _glutenFreeFilterSet=newValue;
              });
            },
            title: Text('Gluten-free',style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground
              ),
            ),
            subtitle: const Text('Only includes gluten-free meals'),
            activeColor: Colors.orange,
            contentPadding: const EdgeInsets.all(14),
            ),
            SwitchListTile(
            value: veganFilterSet, 
            onChanged: (newValue){
              setState(() {
                veganFilterSet=newValue;
              });
            },
            title: Text('Vegan',style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground
              ),
            ),
            subtitle: const Text('Only includes vegan meals'),
            activeColor: Colors.orange,
            contentPadding: const EdgeInsets.all(14),
            ),
            SwitchListTile(
            value: vegetarianFilterSet, 
            onChanged: (newValue){
              setState(() {
                vegetarianFilterSet=newValue;
              });
            },
            title: Text('Vegetarian',style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground
              ),
            ),
            subtitle: const Text('Only includes vegetarian meals'),
            activeColor: Colors.orange,
            contentPadding: const EdgeInsets.all(14),
            ),
             SwitchListTile(
            value: _lactoseFreeFilterSet, 
            onChanged: (newValue){
              setState(() {
                _lactoseFreeFilterSet=newValue;
              });
            },
            title: Text('Lactose-free',style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground
              ),
            ),
            subtitle: const Text('Only includes lactose free meals'),
            activeColor: Colors.orange,
            contentPadding: const EdgeInsets.all(14),
            )
        ],
      ),
    ),
    );
  }
}