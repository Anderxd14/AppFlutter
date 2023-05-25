// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/jardineros.dart';

class Usuarios {
  final int id;
  final String email;
  final String password;
  final String token;
  final String createdAT;
  //final Jardineros jardinero;

  Usuarios({
    required this.id,
    required this.email,
    required this.password,
    required this.token,
    required this.createdAT,
    //required this.jardinero,
  });

  factory Usuarios.fromJson(Map<String, dynamic> json) {
    return Usuarios(
      id: json['id'],
      email: json['email'],
      // ignore: unnecessary_null_in_if_null_operators
      password: json['password'] ?? "contraseña",
      token: json['token'].toString(),
      createdAT: json['created_at'] ?? "fecha",
      //jardinero: json['jardinero'] != null ? Jardineros.fromJson(json['jardinero']) : null,
    );
  }
}
