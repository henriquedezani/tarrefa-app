import 'package:flutter/material.dart';
import 'package:tarefas_app/entities/tarefa.dart';
import 'package:tarefas_app/repositories/tarefa-memory.repository.dart';
import 'package:uuid/uuid.dart';

// lógica do negócio ~ BLOC
class TarefaService extends ChangeNotifier {
  TarefaMemoryRepository? _repository;

  TarefaService() {
    _repository = new TarefaMemoryRepository();
  }

  List<Tarefa> get tarefas => _repository!.read();

  void create(Tarefa entity) {
    var uuid = Uuid();
    entity.id = uuid.v4(); // Exemplo: 110ec58a-a0f2-4ac4-8393-c866d813b8d1
    _repository!.create(entity);
    notifyListeners();
  }

  void update(String id, bool value) {
    _repository!.update(id, value);
    notifyListeners();
  }

  void delete(Tarefa entity) {
    _repository!.delete(entity);
    notifyListeners();
  }
}
