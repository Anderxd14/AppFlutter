// ignore: duplicate_ignore
// ignore: duplicate_ignore
// ignore_for_file: file_names, unused_import, duplicate_ignore

import 'dart:convert';

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_application_1/pages/PagesRcontra.dart';
import 'package:flutter_application_1/pages/menu.dart';
import 'package:flutter_application_1/models/usuarios.dart';
import 'package:flutter_application_1/models/tokenManager.dart';
import 'package:http/http.dart ' as http;

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyFormPageState createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  final url = Uri.parse("http://10.0.2.2:3000/Api/v1/auth/login");
  final email = TextEditingController();
  final headers = {"content-type": "application/json;charset=utf-8"};
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iniciar sesion'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              /*Image.asset(
                'logo.png',
                width: 100,
                height: 100,
              ),*/
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: email,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.email),
                        hintText: 'Ejemplo@gmail.com',
                        labelText: 'Email',
                      ),
                    ),
                    TextFormField(
                      controller: password,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.password),
                        labelText: 'Contraseña',
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () {
                              funcionlogin();
                            },
                            style: const ButtonStyle(),
                            child: const Text('Iniciar Sesion'),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PagesRcontra(),
                            ),
                          );
                        },
                        style: const ButtonStyle(),
                        child: const Text('Olvide mi contraseña'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  void funcionlogin() async {
    final usuarios = {
      "email": email.text,
      "password": password.text,
    };

    final response =
        await http.post(url, headers: headers, body: jsonEncode(usuarios));

    if (response.statusCode == 200) {
      // Las credenciales son correctas
      final responseBody = jsonDecode(response.body);
      final token = responseBody['token'];

      TokenManager().setToken(token);
      // Imprime el token en la consola
      // ignore: avoid_print
      print('Token: $token');

      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PagesMenu(),
        ),
      );
    } else {
      // Las credenciales son incorrectas
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Credenciales incorrectas'),
          content: const Text(
              'El email o la contraseña son incorrectos. Por favor, inténtalo nuevamente.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }

    email.clear();
    password.clear();
  }
}
