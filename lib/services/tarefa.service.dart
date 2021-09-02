import 'package:tarefas_app/entities/tarefa.dart';
import 'package:tarefas_app/repositories/tarefa-memory.repository.dart';

// lógica do negócio.
class TarefaService {
  var repository = new TarefaMemoryRepository();

  void create(Tarefa entity) {
    repository.create(entity);
  }

  List<Tarefa> read() {
    return repository.tarefas;
  }

  void delete(Tarefa entity) {
    repository.delete(entity);
  }
}
