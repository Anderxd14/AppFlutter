// ignore_for_file: file_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/tokenManager.dart';
import 'package:flutter_application_1/models/jardineros.dart';
import 'package:http/http.dart' as http;

class PagesUsuarios extends StatefulWidget {
  final int? userid;
  const PagesUsuarios({Key? key, this.userid}) : super(key: key);

  @override
  State<PagesUsuarios> createState() => _PagesUsuariosState();
}

class _PagesUsuariosState extends State<PagesUsuarios> {
  int? userid;
  final tokenManager = TokenManager();
  late Future<List<Jardineros>> usuarios;

  @override
  void initState() {
    super.initState();
    userid = widget.userid;
    usuarios = getUsuarios();
  }

  Future<List<Jardineros>> getUsuarios() async {
    final url = Uri.parse(
        "https://proyectoapi-production-1b8e.up.railway.app/API/v1/Jardineros/$userid");
    final response = await http.get(
      url,
      headers: {
        "Authorization": "Bearer ${tokenManager.token}",
        "content-type": "application/json;charset=utf-8"
      },
    );

    final jsonData = jsonDecode(response.body);

    if (jsonData is Map<String, dynamic>) {
      final jardinero = Jardineros.fromJson(jsonData);
      return [jardinero];
    } else if (jsonData is List) {
      List<Jardineros> usuarios = [];
      for (var item in jsonData) {
        final jardinero = Jardineros.fromJson(item);
        usuarios.add(jardinero);
      }
      return usuarios;
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EcoRoot'),
      ),
      body: FutureBuilder<List<Jardineros>>(
        future: usuarios,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final jardinero = snapshot.data!.first;
            return ListTile(
                title: const Text(
                  "Datos Usuario",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nombre: ${jardinero.name}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Apellido: ${jardinero.lastName}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Teléfono: ${jardinero.phone}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Email: ${jardinero.user.email}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                trailing: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Actualizar'),
                ));
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text("Se presentó un error"),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
