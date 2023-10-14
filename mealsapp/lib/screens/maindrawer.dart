import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key,required this.onSelectScreen});

  final void Function (String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
     child: Column(
      children: [
        const DrawerHeader(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red,Colors.black],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
            ),
          ),
          child: Row(
            children: [
              Icon(Icons.fastfood,size: 30,),
              SizedBox(width: 20,),
              Text('Cooking up',style: TextStyle(color: Colors.white, fontSize: 30),),
            ],
          ),
          ),
          ListTile(
            leading: const Icon(Icons.restaurant),
            title: Text('Meals',style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Theme.of(context).colorScheme.onBackground),),
            onTap: (){
              onSelectScreen('meals');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text('Filters',style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Theme.of(context).colorScheme.onBackground),),
            onTap: (){
              onSelectScreen('filter');
            },
          )
      ],
      
     ), 
    );
  }
}