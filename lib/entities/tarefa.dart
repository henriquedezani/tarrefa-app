class Tarefa {
  String? id;
  String texto;
  bool finalizada;

  Tarefa({this.id, this.texto = '', this.finalizada = false});

  factory Tarefa.fromJson(Map<String, dynamic> json) {
    return Tarefa(
      id: json['id'],
      texto: json['texto'],
      finalizada: json['finalizada'],
    );
  }

  Map<String, dynamic> toJson() {
    return {"id": id!, "texto": texto, "finalizada": finalizada};
  }
}
