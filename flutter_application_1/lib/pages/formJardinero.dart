// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_application_1/models/Jardineros.dart';
import 'package:http/http.dart' as http;

class FormJardineros extends StatefulWidget {
  const FormJardineros({super.key});

  @override
  State<FormJardineros> createState() => _FormJardinerosState();
}

class _FormJardinerosState extends State<FormJardineros> {
  final url = Uri.parse(
      "https://proyectoapi-production-1b8e.up.railway.app/API/v1/Jardineros");
  final headers = {"content-type": "application/json;charset=utf-8"};

  final _formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario Flutter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingresa tu Email';
                      }
                      return null;
                    },
                    onSaved: (value) {},
                  ),
                  TextFormField(
                    controller: name,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Nombre',
                      labelText: 'Nombre',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingresa tu nombre';
                      }
                      return null;
                    },
                    onSaved: (value) {},
                  ),
                  TextFormField(
                    controller: lastName,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Apellido',
                      labelText: 'Apellido',
                    ),
                  ),
                  TextFormField(
                    controller: phone,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.phone),
                      hintText: 'Ejemplo@gmail.com',
                      labelText: 'Telefono',
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
                          saveJardinero();
                        },
                        style: const ButtonStyle(),
                        child: const Text('Registrate'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void saveJardinero() async {
    final jardinero = {
      "name": name.text,
      "lastName": lastName.text,
      "phone": phone.text,
      "user": {
        "email": email.text,
        "password": password.text,
      }
    };
    await http.post(url, headers: headers, body: jsonEncode(jardinero));
    name.clear();
    lastName.clear();
    phone.clear();
    email.clear();
    password.clear();
  }
}
