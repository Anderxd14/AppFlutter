// ignore_for_file: file_names, unused_import

import 'package:flutter/material.dart';

class Plantas {
  final int id;
  final String nameP;
  // ignore: non_constant_identifier_names
  final String DescriP;
  final String createdAt;
  final int jardineroId;

  Plantas({
    required this.id,
    required this.nameP,
    // ignore: non_constant_identifier_names
    required this.DescriP,
    required this.createdAt,
    required this.jardineroId,
  });

  factory Plantas.fromJson(Map<String, dynamic> json) {
    return Plantas(
      id: json['id'],
      nameP: json['nameP'],
      DescriP: json['Descrip'].toString(),
      createdAt: json['createdAt'],
      jardineroId: json['jardineroId'],
    );
  }
}
