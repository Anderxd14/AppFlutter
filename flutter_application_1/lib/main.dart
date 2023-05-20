import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/pagesHumedad.dart';
import 'package:flutter_application_1/pages/pagesUser.dart';
import 'package:flutter_application_1/pages/pagesLogin.dart';
import 'package:flutter_application_1/pages/pagesPortal.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EcoRoot',
      home: const PagesPortada(),
    );
  }
}
