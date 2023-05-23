// ignore_for_file: file_names, unused_import

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/usuarios.dart';
import 'package:http/http.dart' as http;

class PagesRcontra extends StatefulWidget {
  const PagesRcontra({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyPagesRcontra createState() => _MyPagesRcontra();
}

class _MyPagesRcontra extends State<PagesRcontra> {
  final _formKey = GlobalKey<FormState>();
  final url = Uri.parse("http://10.0.2.2:3000/Api/v1/auth/recovery");
  final headers = {"content-type": "application/json;charset=utf-8"};
  final email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recuperar contraseña'),
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
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () {
                              sndEmail();
                            },
                            style: const ButtonStyle(),
                            child: const Text('Enviar link'),
                          ),
                        )),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  void sndEmail() async {
    final emailDestino = {
      'email': email.text,
    };
    await http.post(url, headers: headers, body: jsonEncode(emailDestino));
    email.clear();
  }
}
