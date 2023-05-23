import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_application_1/pages/formJardinero.dart';
// ignore: unused_import
import 'package:flutter_application_1/pages/pagesHumedad.dart';
// ignore: unused_import
import 'package:flutter_application_1/pages/pagesMisPlantas.dart';
// ignore: unused_import
import 'package:flutter_application_1/pages/pagesUser.dart';
// ignore: unused_import
import 'package:flutter_application_1/pages/pagesLogin.dart';
// ignore: unused_import
import 'package:flutter_application_1/pages/pagesPortal.dart';
// ignore: unused_import
import 'package:flutter_application_1/pages/pagesPlantas.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EcoRoot',
      home: PagesPortada(),
    );
  }
}
