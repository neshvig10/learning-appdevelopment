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


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String text = "";

  void changeText(String text){
    setState(() {
      this.text = text;
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Message Panungo'),),
      body: Column(children: <Widget> [ TextInputWidget(),Text(text)],) ,
    );
  }
}

class TextInputWidget extends StatefulWidget {
  final Function (String) callback;

  TextInputWidget({this.callback});

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final _controller = TextEditingController();

  @override
  void dispose(){
    super.dispose();
    _controller.dispose();
  }

  void click(){

  }


  @override
  Widget build(BuildContext context) {
    return TextField(
        controller : _controller,
        decoration: InputDecoration(  
          prefixIcon: const Icon(Icons.message),labelText: "Type a message !",
          suffixIcon: IconButton(icon : const Icon(Icons.send),splashColor: Colors.blue,tooltip: "Post Message",onPressed: () => {},
           ),
        )
      );
  }
}