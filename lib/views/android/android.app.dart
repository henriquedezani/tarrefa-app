import 'package:flutter/material.dart';
import 'package:tarefas_app/views/android/lista.view.dart';

class AndroidApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListaView(),
    );
  }
}
