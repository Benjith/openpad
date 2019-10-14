import 'package:flutter/material.dart';
import 'package:openpad/about_page.dart';

import 'home_page.dart';
import 'newpad_page.dart';
import 'notes_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OpenPad',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: HomePage(title: 'Openpad'),
      initialRoute: '/',
      routes: {
        '/': (context) => NewPad(isUpdate: true,),
        // '/new': (context) => HomePage(title: 'All files',),
        // '/notes': (context) => NotesPage(),
        '/about': (context) => AboutPage(),
      },
    );
  }
}
