// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/formJardinero.dart';
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
        title: const Text(''),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('PlantaF.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset(
            alignment: Alignment.center,
            'logo.png',
          ),
          OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyFormPage()),
                );
              },
              child: Container(
                // Ancho deseado
                height: 50, // Alto deseado
                margin: const EdgeInsets.fromLTRB(
                    10, 50, 10, 50), //izq,arriba,derecha,abajo
                //margin: const EdgeInsets.all(150),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFF04D0D9),
                  border: Border.all(
                    color: const Color(0xFF04D0D9),
                    width: 0,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.all(1),
                child: const Text("Login",
                    style: TextStyle(color: Color(0xFFFBF8EF), fontSize: 20)),
              )),
          const SizedBox(height: 16),
          OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FormJardineros()),
                );
              },
              child: Container(
                // Ancho deseado
                height: 50, // Alto deseado
                margin: const EdgeInsets.fromLTRB(
                    10, 50, 10, 50), //izq,arriba,derecha,abajo
                //margin: const EdgeInsets.all(150),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFF04D0D9),
                  border: Border.all(
                    color: const Color(0xFF04D0D9),
                    width: 0,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.all(1),
                child: const Text("registrarse",
                    style: TextStyle(color: Color(0xFFFBF8EF), fontSize: 20)),
              ))
        ],
      ),
    );
  }
}
