import 'package:flutter/material.dart';
import 'pages/loginPage.dart';

void main() {
  runApp(const CarharttApp());
}

class CarharttApp extends StatelessWidget {
  const CarharttApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Carhartt Shop',

      home: const LoginPage(),
    );
  }
}