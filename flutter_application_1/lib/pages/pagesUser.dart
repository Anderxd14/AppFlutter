// ignore_for_file: file_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/jardineros.dart';
// ignore: unused_import
import 'package:flutter_application_1/models/tokenManager.dart';
// ignore: unused_import
import 'package:flutter_application_1/models/usuarios.dart';
import 'package:http/http.dart' as http;

class PagesJardineros extends StatefulWidget {
  const PagesJardineros({super.key});

  @override
  State<PagesJardineros> createState() => _PagesJardinerosState();
}

class _PagesJardinerosState extends State<PagesJardineros> {
  final url = Uri.parse("http://10.0.2.2:3000/Api/v1/Jardineros");
  late Future<List<Jardineros>> jardineros;

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final tokenManager = TokenManager();
    return Scaffold(
      appBar: AppBar(
        title: const Text('EcoRoot'),
      ),
      body: FutureBuilder<List<Jardineros>>(
        future: jardineros,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final jardinero = snapshot.data![index];
                return ListTile(
                  title: Text("Email: ${jardinero.user.email}"),
                  subtitle: Text("token: ${tokenManager.token}"),
                );
              },
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text("Se Presento un error"),
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    jardineros = getJardineros();
  }

  Future<List<Jardineros>> getJardineros() async {
    final response = await http.get(url);
    final jsonData = jsonDecode(response.body);

    List<Jardineros> jardineros = [];
    for (var item in jsonData) {
      final jardinero = Jardineros.fromJson(item);
      jardineros.add(jardinero);
    }

    return jardineros;
  }
}
