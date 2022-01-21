import 'package:flutter/material.dart';
import './my_home_page.dart';
import './NotesState.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notes Safe',
      theme: ThemeData(
        //scaffoldBackgroundColor: Colors.grey,
        primaryColor: Colors.blue,
      ),
      home: ChangeNotifierProvider<NotesState>(
        create: (context) => NotesState(),
      	child: MyHomePage()),
    );
  }
}
