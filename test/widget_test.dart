import 'package:flutter/material.dart';

void main() async{
  await MyApp();
}

class MyApp extends StatelessWidget {
  const MyApp() : super();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterApp',
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stateless'),
          backgroundColor: Colors.black,
        ),
      ),);
  }
}
