import 'dart:convert';
import 'dart:async';

import 'package:tarefas_app/entities/tarefa.dart';
import 'package:http/http.dart' as http;

class TarefaApiRepository {
  final String url = 'https://fatec-tarefa-api.herokuapp.com/tarefa';
  // final Uri uri = Uri.https('localhost:5001', '/tarefa');

  Future<List<Tarefa>> read() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var dados = jsonDecode(response.body) as List;

      List<Tarefa> lista = [];

      for (var json in dados) {
        Tarefa t = Tarefa.fromJson(json);
        lista.add(t);
      }

      return lista;
    }
    return [];
  }

  Future<void> create(Tarefa entity) async {
    await http.post(Uri.parse(url),
        headers: {"content-type": "application/json"},
        body: jsonEncode(entity.toJson()));
  }

  Future<void> update(String id, Tarefa entity) async {
    await http.put(Uri.parse("$url/$id"),
        headers: {"content-type": "application/json"},
        body: jsonEncode(entity.toJson()));
  }

  Future<void> delete(Tarefa entity) async {
    await http.delete(Uri.parse("$url/${entity.id}"));
  }
}
