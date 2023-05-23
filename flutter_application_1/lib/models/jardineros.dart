// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/usuarios.dart';

class Jardineros {
  final int id;
  final String name;
  final String lastName;
  final String phone;
  final String createdAT;
  final Usuarios user;

  Jardineros({
    required this.id,
    required this.name,
    required this.lastName,
    required this.phone,
    required this.createdAT,
    required this.user,
  });

  factory Jardineros.fromJson(Map<String, dynamic> json) {
    return Jardineros(
      id: json['id'],
      name: json['name'],
      lastName: json['lastName'],
      phone: json['phone'],
      createdAT: json['createdAt'],
      user: Usuarios.fromJson(json['user']),
    );
  }
}
