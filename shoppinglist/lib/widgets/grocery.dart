import 'package:flutter/material.dart';

class GroceryItem extends StatefulWidget {
  const GroceryItem({super.key,required this.groceryName});

  final String groceryName;

  @override
  State<GroceryItem> createState() => _GroceryItemState();
}

class _GroceryItemState extends State<GroceryItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(  
              leading: const Icon(Icons.add_box_sharp),  
              title: Text(groceryName),  
    );
  }
}