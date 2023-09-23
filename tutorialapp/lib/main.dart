import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Flutter is widget of widget of widget ... 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // widgets start with a capital letter and the componenents start with lowercase letter
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("App Title"),
        ),
        body: const Center(child: Text("Body"),),
        bottomNavigationBar: BottomNavigationBar(items: const [BottomNavigationBarItem(label:'Home',icon: Icon(Icons.home)),BottomNavigationBarItem(label:'Settings',icon: Icon(Icons.settings))]),
      )
    );
  }
}