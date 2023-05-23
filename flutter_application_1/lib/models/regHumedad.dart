// ignore_for_file: file_names, unused_import

import "package:flutter/material.dart";

class HumedadData {
  final int id;
  final int reghumedad;
  final String createdAt;
  //final int sensorId;
  final int plantaId;

  HumedadData({
    required this.id,
    required this.reghumedad,
    required this.createdAt,
    //required this.sensorId,
    required this.plantaId,
  });

  factory HumedadData.fromJson(Map<String, dynamic> json) {
    return HumedadData(
      id: json['id'],
      reghumedad: int.parse(json['reghumedad']),
      createdAt: json['createdAt'],
      plantaId: json['PlantaId'] is int
          ? json['PlantaId']
          : int.tryParse(json['PlantaId'].toString()) ?? 0,
    );
  }
}
