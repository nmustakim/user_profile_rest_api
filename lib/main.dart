


import 'package:flutter/material.dart';
import 'package:users_profile_rest_api/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(primarySwatch: Colors.lightGreen),
      debugShowCheckedModeBanner: false,
      home: const Home()

    );
  }
}

