//import 'package:http/http.dart' as http;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';


/*
Future<bool> loginUser(String email, String password) async {
  final response = await http.post('http://10.0.2.2:8080/login/', headers: {"Content-Type": "application/json"}, body: jsonEncode({'email': email, 'password': password}));
  if (response.statusCode == 200) {
    LocalStorage.setItem('token', response.body);
    return true;
  }
  return false;
}
*/



Future<bool> createUser(
    String email, String login, String password) async {
  final response = await http.post(
    Uri.parse('http://10.0.2.2:8081/register'),
    //Uri.parse('http://localhost:8081/register'),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({
      'Login': login,
      'Email': email,
      'Password': password,
    }),
  );
  print(email);
  print(login);
  print(password);
  print("Print de debug end");
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}