import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/pagesLogin.dart';

class PagesPortada extends StatefulWidget {
  const PagesPortada({super.key});

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
      body: const Center(child: Text("Bienvenidos Empecemos")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PagesLogin()),
          );
        },
        backgroundColor: const Color.fromARGB(250, 175, 167, 76),
        child: const Text('Inicia Sesion'),
      ),
    );
  }
}
