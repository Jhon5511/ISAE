class TablePojo {

  String fecha;
  String descripcion;
  String autorizacion;
  String estatus;
  String importe;
  String vip;
  String puesto;


  String get get_fecha{
    return fecha;
  }

  void set set_fecha(String fecha) {
    this.fecha = fecha;
  }

  String get get_descripcion{
    return descripcion;
  }

  void set set_descripcion(String descripcion) {
    this.descripcion = descripcion;
  }

  String get get_autorizacion{
    return autorizacion;
  }

  void set set_autorizacion(String autorizacion) {
    this.autorizacion = autorizacion;
  }

  String get get_estatus{
    return estatus;
  }

  void set set_estatus(String estatus) {
    this.estatus = estatus;
  }

  String get get_importe{
    return importe;
  }

  void set set_importe(String importe) {
    this.importe = importe;
  }
  String get get_vip{
    return vip;
  }

  void set set_vip(String vip) {
    this.importe = vip;
  }
  String get get_puesto{
    return puesto;
  }

  void set set_puesto(String puesto) {
    this.importe = puesto;
  }


  TablePojo(this.fecha, this.descripcion, this.estatus,
      this.importe,this.vip,this.puesto);

  @override
  String toString() {
    return 'TablePojo{fecha: $fecha, descripcion: $descripcion, autorizacion: $autorizacion, estatus: $estatus, importe: $importe, vip: $vip, puesto: $puesto}';
  }


}