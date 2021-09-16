import 'package:flutter/material.dart';
import 'package:tarefas_app/entities/tarefa.dart';
import 'package:tarefas_app/repositories/tarefa-memory.repository.dart';

// lógica do negócio ~ BLOC
class TarefaService extends ChangeNotifier {
  TarefaMemoryRepository? _repository;

  TarefaService() {
    _repository = new TarefaMemoryRepository();
  }

  List<Tarefa> get tarefas => _repository!.read();

  void create(Tarefa entity) {
    _repository!.create(entity);
    notifyListeners();
  }

  void delete(Tarefa entity) {
    _repository!.delete(entity);
    notifyListeners();
  }
}
