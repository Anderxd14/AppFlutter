// ignore_for_file: unused_import

import 'package:flutter/material.dart';

class Usuarios {
  final int id;
  final String email;
  final String password;
  final String createdAT;

  Usuarios({
    required this.id,
    required this.email,
    required this.password,
    required this.createdAT,
  });

  factory Usuarios.fromJson(Map<String, dynamic> json) {
    return Usuarios(
      id: json['id'],
      email: json['email'],
      // ignore: unnecessary_null_in_if_null_operators
      password: json['password'] ?? "contraseña",
      createdAT: json['created_at'] ?? "fecha",
    );
  }
}
