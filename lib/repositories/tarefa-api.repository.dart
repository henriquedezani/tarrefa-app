import 'dart:convert';
import 'dart:async';

import 'package:tarefas_app/entities/tarefa.dart';
import 'package:http/http.dart' as http;

class TarefaApiRepository {
  // final String url = 'https://localhost:5001/tarefa';
  final Uri uri = Uri.https('localhost:5001', '/tarefa');

  Future<List<Tarefa>> read() async {
    var response = await http.get(uri);
    var dados = jsonDecode(response.body) as List;

    List<Tarefa> lista = [];

    for (var json in dados) {
      Tarefa t = Tarefa.fromJson(json);
      lista.add(t);
    }

    return lista;
  }

  void create(Tarefa entity) {}

  void update(String id, bool value) {}

  void delete(Tarefa entity) {}
}
