import 'package:flutter/material.dart';

import 'package:hello_flutter/container.dart';

void main() {
  runApp(MyApp());
}

//Custom Widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Poppins"),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Hello Flutter", style: TextStyle(fontFamily: "Poppins")),
          backgroundColor: Colors.blue[900],
          foregroundColor: Colors.white,
        ),
        body: ContainerWidget(),
      ),
    );
  }
}
