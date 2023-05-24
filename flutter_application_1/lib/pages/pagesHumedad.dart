// ignore_for_file: non_constant_identifier_names, file_names

import 'dart:convert';

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/models/regHumedad.dart';
// ignore: unused_import
import 'package:flutter_application_1/models/tokenManager.dart';

class PagesHumedad extends StatefulWidget {
  final int? selectedPlantId;

  const PagesHumedad({Key? key, this.selectedPlantId}) : super(key: key);

  @override
  State<PagesHumedad> createState() => _PagesHumedadState();
}

class _PagesHumedadState extends State<PagesHumedad> {
  int? selectedPlantId;
  final tokenManager = TokenManager();

  late Future<List<HumedadData>> humedad;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Humedad'),
        ),
        body: FutureBuilder<List<HumedadData>>(
          future: humedad,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final humedadDataList = snapshot.data!;
              return SingleChildScrollView(
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('RegHumedad')),
                    DataColumn(label: Text('ValorHumedad')),
                    DataColumn(label: Text('FechaReg')),
                  ],
                  rows: humedadDataList.map((humedadData) {
                    return DataRow(cells: [
                      DataCell(Text('${humedadData.id}')),
                      DataCell(Text('${humedadData.reghumedad}')),
                      // ignore: unnecessary_string_interpolations
                      DataCell(Text('${humedadData.createdAt}')),
                    ]);
                  }).toList(),
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ));
  }

  @override
  void initState() {
    super.initState();
    selectedPlantId = widget.selectedPlantId;
    humedad = getHumedad();
  }

  Future<List<HumedadData>> getHumedad() async {
    final url = Uri.parse(
        "http://10.0.2.2:3000/Api/v1/Perfil/HumedadMisPlantas/$selectedPlantId");
    final res = await http.get(
      url,
      headers: {
        "Authorization": "Bearer ${tokenManager.token}",
        "content-type": "application/json;charset=utf-8"
      },
    );
    final lista = List.from(jsonDecode(res.body));

    List<HumedadData> humedad = [];
    for (var element in lista) {
      final HumedadData hum = HumedadData.fromJson(element);
      humedad.add(hum);
    }

    // ignore: avoid_print

    return humedad;
  }
}
