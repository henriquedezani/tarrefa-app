import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarefas_app/entities/tarefa.dart';
import 'package:tarefas_app/services/tarefa.service.dart';

class CreateView extends StatelessWidget {
  // atributos da classe:
  var _formKey = GlobalKey<FormState>();
  String? descricao;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nova Tarefa"),
        actions: [
          TextButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState?.save();
                var tarefa = Tarefa(texto: descricao!);
                var service =
                    Provider.of<TarefaService>(context, listen: false);
                service.create(tarefa);
                Navigator.of(context).pop();
              }
            },
            child: Text(
              "SALVAR",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Descrição",
                ),
                onSaved: (value) => this.descricao = value,
                validator: (value) {
                  if (value!.length == 0) {
                    return "Campo obrigatório";
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
              )
            ],
          ),
        ),
      ),
    );
  }
}
