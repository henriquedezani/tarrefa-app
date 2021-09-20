import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarefas_app/entities/tarefa.dart';
import 'package:tarefas_app/services/tarefa.service.dart';

class ListaView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tarefas"),
      ),
      body: Consumer<TarefaService>(
        builder: (context, service, child) {
          var lista = service.tarefas;
          return ListView.builder(
            itemCount: lista.length,
            itemBuilder: (_, index) {
              Tarefa tarefa = lista[index];
              return TarefaItem(tarefa, service);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed('/create');
        },
      ),
    );
  }
}

class TarefaItem extends StatelessWidget {
  const TarefaItem(
    this.tarefa,
    this.service,
  );

  final Tarefa tarefa;
  final TarefaService service;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(tarefa.id!),
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (_) {
        service.delete(tarefa);
      },
      child: CheckboxListTile(
        value: tarefa.finalizada,
        title: Text(tarefa.texto),
        onChanged: (value) {
          service.update(tarefa.id!, value!);
        },
      ),
    );
  }
}
