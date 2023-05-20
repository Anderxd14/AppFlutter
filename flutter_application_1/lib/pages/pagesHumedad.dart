// ignore: file_names
// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/models/regHumedad.dart';

class PagesHumedad extends StatefulWidget {
  const PagesHumedad({super.key});

  @override
  State<PagesHumedad> createState() => _PagesHumedadState();
}

class _PagesHumedadState extends State<PagesHumedad> {
  final url = Uri.parse("http://10.0.2.2:3000/Api/v1/Humedad");
  late Future<List<HumedadData>> humedad;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('EcoRoot'),
        ),
        body: FutureBuilder<List<HumedadData>>(
          future: humedad,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final humedadDataList = snapshot.data!;
              return SingleChildScrollView(
                child: DataTable(
                  columns: [
                    const DataColumn(label: Text('Registro Humedad')),
                    const DataColumn(label: Text('Valor Humedad')),
                  ],
                  rows: humedadDataList.map((humedadData) {
                    return DataRow(cells: [
                      DataCell(Text('Registro Humedad # ${humedadData.id}')),
                      DataCell(
                          Text('Valor Humedad: ${humedadData.reghumedad}')),
                    ]);
                  }).toList(),
                ),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ));
  }

  @override
  void initState() {
    //TODO: implement initState
    super.initState();
    humedad = getHumedad();
  }

  Future<List<HumedadData>> getHumedad() async {
    final res = await http.get(url);
    final lista = List.from(jsonDecode(res.body));

    List<HumedadData> humedad = [];
    lista.forEach((element) {
      final HumedadData hum = HumedadData.fromJson(element);
      humedad.add(hum);
    });

    // ignore: avoid_print

    return humedad;
  }
}
