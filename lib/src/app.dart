import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {

  final items = ['Primero', 'Segundo'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista')
      ),
      body: ListView(
        children: _crearAlumnos(),
      ),
      fetchPost(),
    );
  }

  List<Widget> _crearAlumnos() {
    List<Widget> lista = new List<Widget>();

    for (var item in items) {
      final widget = ListTile(
        title: Text(item)
      );

      lista.add(widget);
      lista.add(Divider());
    }

    return lista;
  }

  Future<http.Response> fetchPost() {
    return http.get('https://spreadsheets.google.com/feeds/cells/1Qcnlny4FWwp2e9xC91NhLJAvDB8OnHbQLpRjIxjNs_Q/1/public/full?alt=json');
  }
}
