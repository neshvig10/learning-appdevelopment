import 'package:flutter/material.dart';

class Category{

  // constructor
  // this called when we try to declare an object of this class 
  const Category({
    required this.id,
    required this.title,
    this.color=Colors.orange,
  });
  
  final String id;
  final String title;
  final Color color;

}