import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Flutter is widget of widget of widget ... 

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String buttonName = 'Click Me';
  int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    // widgets start with a capital letter and the componenents start with lowercase letter
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("App Title"),
        ),
        // Center widget for alignment in center
        body: Center(
          child: currentIndex==0 ? Container(
              color: Colors.red,
              width: double.infinity,
              height: double.infinity,
              // width = double.infinity is the maximum width for any screen
            child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          ElevatedButton(
              child : Text(buttonName),onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                    return const NextPage();
                  }));
                },
              ),
          const SizedBox(height: 10,width: 10,),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.red,
                backgroundColor: Colors.amber,
                // onPrimary: Colors.red,
                // primary: Colors.yellow

              ),
              child : const Text('Next Page'),onPressed: () {
                setState(() {
                   buttonName='Clicked';
                 });
                },
              ),
             ]
            )
          )
          : Image.asset(
            'images/image1.jpeg'
          )
          ),
        bottomNavigationBar: BottomNavigationBar(items: const [BottomNavigationBarItem(label:'Home',icon: Icon(Icons.home)),BottomNavigationBarItem(label:'Settings',icon: Icon(Icons.settings))],
        currentIndex: currentIndex,
        onTap: (int index){
          setState(() {
            currentIndex=index;
          });
        },

      ),
     )
    );
  }
}



class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next Page'),
      ),
    );
  }
}