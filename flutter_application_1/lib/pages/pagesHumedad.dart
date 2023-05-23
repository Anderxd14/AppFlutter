// ignore: file_names
// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/models/regHumedad.dart';

class PagesHumedad extends StatefulWidget {
  final int? selectedPlantId;

  const PagesHumedad({Key? key, this.selectedPlantId}) : super(key: key);

  @override
  State<PagesHumedad> createState() => _PagesHumedadState();
}

class _PagesHumedadState extends State<PagesHumedad> {
  int? selectedPlantId;
  final headers = {
    "Authorization":
        "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjU2LCJyb2xlIjoiSmFyZGluZXJvIiwiaWF0IjoxNjgwMjQ3NzY0fQ.gn3_JcU8xnlBZQrqlIix4FCV5e7cvrEy-cpkK3iUnIE",
    "content-type": "application/json;charset=utf-8"
  };
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
                    const DataColumn(label: Text('RegHumedad')),
                    const DataColumn(label: Text('ValorHumedad')),
                    const DataColumn(label: Text('FechaReg')),
                  ],
                  rows: humedadDataList.map((humedadData) {
                    return DataRow(cells: [
                      DataCell(Text('${humedadData.id}')),
                      DataCell(Text('${humedadData.reghumedad}')),
                      DataCell(Text('${humedadData.plantaId}')),
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
    //TODO: implement initState
    super.initState();
    selectedPlantId = widget.selectedPlantId;
    humedad = getHumedad();
  }

  Future<List<HumedadData>> getHumedad() async {
    final url = Uri.parse(
        "http://10.0.2.2:3000/Api/v1/Perfil/HumedadMisPlantas/$selectedPlantId");
    final res = await http.get(url, headers: headers);
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
