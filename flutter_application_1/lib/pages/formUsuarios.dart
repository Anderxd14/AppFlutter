// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_application_1/models/usuarios.dart';

class FormUsuarios extends StatefulWidget {
  const FormUsuarios({super.key});

  @override
  State<FormUsuarios> createState() => _FormUsuariosState();
}

class _FormUsuariosState extends State<FormUsuarios> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo usuario'),
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
                      decoration: const InputDecoration(
                        icon: Icon(Icons.email),
                        hintText: 'Ejemplo@gmail.com',
                        labelText: 'Email',
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'Nombre',
                        labelText: 'Nombre',
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'Apellido',
                        labelText: 'Apellido',
                      ),
                      // ignore: body_might_complete_normally_nullable
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.phone),
                        hintText: 'Ejemplo@gmail.com',
                        labelText: 'Telefono',
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.password),
                        labelText: 'Contraseña',
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: const ButtonStyle(),
                            child: const Text('Registrate'),
                          ),
                        )),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
