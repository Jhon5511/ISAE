class InventarioAgrupado {

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


  InventarioAgrupado(this.id, this.descripcion);

  @override
  String toString() {
    return 'InventarioAgrupado{id: $id, descripcion: $descripcion}';
  }
}