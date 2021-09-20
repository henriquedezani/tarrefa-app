import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarefas_app/entities/tarefa.dart';
import 'package:tarefas_app/services/tarefa.service.dart';

class ListaView extends StatefulWidget {
  @override
  _ListaViewState createState() => _ListaViewState();
}

class _ListaViewState extends State<ListaView> {
  // atributo da classe.
  // List<Tarefa> lista = [];

  @override
  initState() {
    super.initState();
    // var service = TarefaService();
    // lista.addAll(service.read());
  }

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
              return Dismissible(
                key: Key(lista[index].id!),
                background: Container(
                  color: Colors.red,
                ),
                onDismissed: (_) {
                  var service =
                      Provider.of<TarefaService>(context, listen: false);
                  service.delete(lista[index]);
                },
                child: CheckboxListTile(
                  value: lista[index].finalizada,
                  title: Text(lista[index].texto),
                  onChanged: (value) {
                    var service =
                        Provider.of<TarefaService>(context, listen: false);
                    service.update(lista[index].id!, value!);
                  },
                ),
              );
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
