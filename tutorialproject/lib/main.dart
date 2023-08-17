import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Svigns App',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: const MyHomePage(),
    );
  }
}


class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Message Panungo'),),
      body: const TextInputWidget(),
    );
  }
}




class TextInputWidget extends StatefulWidget {
  const TextInputWidget({super.key});

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final _controller = TextEditingController();
  String text = "";

  @override
  void dispose(){
    super.dispose();
    _controller.dispose();
  }

  void changeText(text){
    setState(() {
    this.text=text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children : <Widget>[
      TextField(
        controller : _controller,
        decoration: const InputDecoration(  
          prefixIcon: Icon(Icons.message),labelText: "Type a message !" ,
        ),
        onChanged: (text)=> changeText(text),
      ),
      Text(text)
    ]);
  }
}