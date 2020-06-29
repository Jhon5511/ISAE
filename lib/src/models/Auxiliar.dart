class Auxiliar{

  int id;
  String descripcion;



  int get get_id{
    return id;
  }

  void set set_id(int id) {
    this.id = id;
  }

  String get get_descripcion{
    return descripcion;
  }

  void set set_descripcion(String descripcion) {
    this.descripcion = descripcion;
  }


  Auxiliar(this.id, this.descripcion);

  @override
  String toString() {
    return 'Auxiliar{id: $id, descripcion: $descripcion}';
  }
}