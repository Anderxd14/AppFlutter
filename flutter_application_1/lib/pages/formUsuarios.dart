import 'package:flutter/material.dart';
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
        title: const Text('Formulario Flutter'),
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, ingresa tu Email';
                        }
                        return null;
                      },
                      onSaved: (value) {},
                    ),
                    TextFormField(
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
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'Apellido',
                        labelText: 'Apellido',
                      ),
                      validator: (value) {},
                      onSaved: (value) {},
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.phone),
                        hintText: 'Ejemplo@gmail.com',
                        labelText: 'Telefono',
                      ),
                      validator: (value) {},
                      onSaved: (value) {},
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.password),
                        labelText: 'Contraseña',
                      ),
                      validator: (value) {},
                      onSaved: (value) {},
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
