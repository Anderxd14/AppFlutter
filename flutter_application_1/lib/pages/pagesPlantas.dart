// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/Plantas.dart';
import 'package:flutter_application_1/pages/pagesMisPlantas.dart';
// ignore: unused_import
import 'package:flutter_application_1/models/tokenManager.dart';
import 'package:http/http.dart' as http;

class PagesPlantas extends StatefulWidget {
  const PagesPlantas({super.key});

  @override
  State<PagesPlantas> createState() => _PagesPlantasState();
}

// ignore: duplicate_ignore
class _PagesPlantasState extends State<PagesPlantas> {
  final url = Uri.parse(
      "https://proyectoapi-production-1b8e.up.railway.app/API/v1/Plantas");
  final _formKey = GlobalKey<FormState>();
  late Future<List<Plantas>> plantas;
  final nameP = TextEditingController();
  final jardineroId = TextEditingController();
  final DescriP = TextEditingController();
  final tokenManager = TokenManager();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nueva planta'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
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
                          TextField(
                            controller: nameP,
                            decoration: const InputDecoration(
                              hintText: 'Planta1',
                              labelText: 'Nombre Planta',
                            ),
                            //validator: (value) {},
                          ),
                          TextField(
                            controller: DescriP,
                            decoration: const InputDecoration(
                              hintText: 'descripción',
                              labelText: 'Ingres una descripción',
                            ),
                          ),
                          TextField(
                            controller: jardineroId,
                            decoration: const InputDecoration(
                              hintText: 'jardinero',
                              labelText: 'jardinero',
                            ),
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: Center(
                                child: TextButton(
                                  onPressed: () {
                                    savePlanta();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const MisPlantas()));
                                  },
                                  style: const ButtonStyle(),
                                  child: const Text('Registrate'),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  void savePlanta() async {
    final planta = {
      "nameP": nameP.text,
      "Descrip": DescriP.text,
      "jardineroId": jardineroId.text
    };
    final res = await http.post(url,
        headers: {
          "Authorization": "Bearer ${tokenManager.token}",
          "content-type": "application/json;charset=utf-8"
        },
        body: jsonEncode(planta));
    if (res.statusCode == 201) {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Planta Creada'),
          content: const Text('Se ingresar nueva planta correctamente'),
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
    } else {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('datos incorrectos'),
          content: const Text('los datos ingresados son incorrectos'),
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

    nameP.clear();
    DescriP.clear();
    jardineroId.clear();
  }
}
