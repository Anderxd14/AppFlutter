import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/pagesHumedad.dart';
import 'package:flutter_application_1/pages/pagesPlantas.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/models/Plantas.dart';

class MisPlantas extends StatefulWidget {
  const MisPlantas({Key? key}) : super(key: key);

  @override
  State<MisPlantas> createState() => _MisPlantasState();
}

class _MisPlantasState extends State<MisPlantas> {
  final url = Uri.parse("http://10.0.2.2:3000/Api/v1/Perfil/MisPlantas");
  late Future<List<Plantas>> misPlantas;
  int? selectedPlantId;
  // ignore: non_constant_identifier_names
  //final DescriP = TextEditingController();
  final nameP = TextEditingController();
  final headers = {
    "Authorization":
        "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjU2LCJyb2xlIjoiSmFyZGluZXJvIiwiaWF0IjoxNjgwMjQ3NzY0fQ.gn3_JcU8xnlBZQrqlIix4FCV5e7cvrEy-cpkK3iUnIE",
    "content-type": "application/json;charset=utf-8"
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Plantas'),
      ),
      body: FutureBuilder<List<Plantas>>(
          future: misPlantas,
          builder: (context, snap) {
            if (snap.hasData) {
              return ListView.builder(
                  itemCount: snap.data!.length,
                  itemBuilder: (context, i) {
                    return Card(
                      child: ListTile(
                        title: Text(snap.data![i].nameP),
                        subtitle: Text(snap.data![i].DescriP),
                        trailing: PopupMenuButton<String>(
                            itemBuilder: (BuildContext context) {
                          return [
                            const PopupMenuItem(
                              value: 'Editar',
                              child: Text("Editar"),
                            ),
                            const PopupMenuItem(
                              value: 'Eliminar',
                              child: Text("Eliminar"),
                            ),
                            const PopupMenuItem(
                              value: 'Detalles',
                              child: Text("Detalles Humedad"),
                            )
                          ];
                        }, onSelected: (String value) {
                          if (value == "Editar") {
                            showEditarPlantaDialog(snap.data![i].id);
                          } else if (value == 'Eliminar') {
                            deletePlanta(snap.data![i].id);
                          } else if (value == 'Detalles') {
                            selectedPlantId = snap.data![i].id;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PagesHumedad(
                                        selectedPlantId: selectedPlantId)));
                          }
                        }),
                      ),
                    );
                    // ignore: dead_code
                  });
            }
            if (snap.hasError) {
              return const Center(
                child: Text("Se presento un errror"),
              );
            }
            return const CircularProgressIndicator();
          }),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PagesPlantas()),
            ).then((value) {
              if (value != null && value) {
                refreshPlantas();
              }
            });
          }),
    );
  }

  @override
  void initState() {
    super.initState();
    misPlantas = getplantas();
  }

  void showEditarPlantaDialog(int id) {
    setState(() {
      selectedPlantId = id;
    });
    nameP.text = "";
    // DescriP.text = "";
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Actualizar Planta"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameP,
                decoration: const InputDecoration(
                  hintText: "Nombre de la Planta",
                ),
              ),
              /*TextField(
                controller: DescriP,
                decoration: const InputDecoration(
                  hintText: "Descripción",
                ),
              ),*/
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Aquí puedes agregar la lógica para actualizar la planta
                Navigator.of(context).pop(); // Cerrar el diálogo
              },
              child: const Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {
                // Aquí puedes agregar la lógica para actualizar la planta
                updatePlanta();
                Navigator.of(context).pop();
                // Cerrar el diálogo
              },
              child: const Text("Actulizar"),
            ),
          ],
        );
      },
    );
  }

  Future<List<Plantas>> getplantas() async {
    final res = await http.get(url, headers: headers);
    final lista = List.from(jsonDecode(res.body));

    List<Plantas> misPlantas = [];
    for (var element in lista) {
      final Plantas mplanta = Plantas.fromJson(element);
      misPlantas.add(mplanta);
    }

    return misPlantas;
  }

  void deletePlanta(int id) async {
    final url = Uri.parse("http://10.0.2.2:3000/Api/v1/Plantas/$id");
    await http.delete(
      url,
      headers: headers,
    );
    setState(() {
      misPlantas = getplantas();
    });
  }

  void updatePlanta() async {
    final plantaAct = {"nameP": nameP.text};
    final url =
        Uri.parse("http://10.0.2.2:3000/Api/v1/Plantas/$selectedPlantId");
    await http.patch(url, headers: headers, body: jsonEncode(plantaAct));
    setState(() {
      misPlantas = getplantas();
    });
  }

  void refreshPlantas() {
    setState(() {
      misPlantas = getplantas();
    });
  }
}
