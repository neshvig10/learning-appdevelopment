import 'package:flutter/material.dart';
import 'package:shoppinglist/widgets/grocery.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Grocery'),),
      body: const Column(
        children: [
          GroceryItem(groceryName: 'Milk',),
          GroceryItem(groceryName: 'Bananas',),
          GroceryItem(groceryName: 'Beaf Steak',)
        ],
      ),
    );
  }
}