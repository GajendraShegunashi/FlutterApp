// Importing necessary packages
import 'package:b1_gajendra/home_page/home.dart';
import 'package:b1_gajendra/login_page/login.dart';
import 'package:flutter/material.dart';

// Defining the main function
void main() {
  // Run the Flutter app
  runApp(const MyApp());
}

// Define the MyApp class
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Overriding the build method to create the app's UI
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const FormScreen(), // Defining the login route
        '/home': (context) => const HomeScreen(), // Defining the home route
      },
    );
  }
}
