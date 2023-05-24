// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/formJardinero.dart';
import 'package:flutter_application_1/pages/pagesLogin.dart';
// ignore: unused_import
import 'package:flutter_application_1/pages/pagesUser.dart';

class PagesPortada extends StatefulWidget {
  const PagesPortada({Key? key});

  @override
  State<PagesPortada> createState() => _PagesPortadaState();
}

class _PagesPortadaState extends State<PagesPortada> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EcoRoot'),
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/PlantaF.png',
            width: 500,
            height: 740,
            fit: BoxFit.cover,
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset(
            'assets/logo.png',
            width: 150,
            height: 150,
            fit: BoxFit.cover,
          ),
          Container(
            height: 150,
          ),
          Container(
            alignment: Alignment.center,
            child: Container(
              width: 200,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyFormPage(),
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: const Color(0xFF04D0D9),
                  side: const BorderSide(color: Color(0xFF04D0D9)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.all(1),
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Color(0xFFFBF8EF),
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 50),
          Container(
            alignment: Alignment.center,
            child: Container(
              width: 200,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FormJardineros(),
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: const Color(0xFF04D0D9),
                  side: const BorderSide(color: Color(0xFF04D0D9)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.all(1),
                ),
                child: const Text(
                  "Registrarse",
                  style: TextStyle(
                    color: Color(0xFFFBF8EF),
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 100,
          ),
        ],
      ),
    );
  }
}
