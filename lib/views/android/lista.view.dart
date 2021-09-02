import 'package:flutter/material.dart';
import 'package:tarefas_app/entities/tarefa.dart';
import 'package:tarefas_app/services/tarefa.service.dart';

class ListaView extends StatefulWidget {
  @override
  _ListaViewState createState() => _ListaViewState();
}

class _ListaViewState extends State<ListaView> {
  final List<Tarefa> lista = [];

  @override
  initState() {
    super.initState();
    var service = TarefaService();
    lista.addAll(service.read());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tarefas"),
      ),
      body: RefreshIndicator(
        child: ListView.builder(
          itemCount: lista.length,
          itemBuilder: (_, index) {
            return CheckboxListTile(
              value: lista[index].finalizada,
              title: Text(lista[index].texto),
              onChanged: (value) {
                setState(() {
                  lista[index].finalizada = value ?? true;
                });
              },
            );
          },
        ),
        onRefresh: () => Future.value(true),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
