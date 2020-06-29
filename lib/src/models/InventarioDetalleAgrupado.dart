class InventarioDetalleAgrupado {

  int _enapp;
  String _campo;
  String _valor;
  String _tipoCampo;
  String _CampoDes;

  InventarioDetalleAgrupado(
      this._enapp,
      this._campo,
      this._valor,
      this._tipoCampo,
      this._CampoDes);

  String get valor => _valor;

  set valor(String value) {
    _valor = value;
  }

  String get campo => _campo;

  set campo(String value) {
    _campo = value;
  }

  int get enapp => _enapp;

  set enapp(int value) {
    _enapp = value;
  }


  String get tipoCampo => _tipoCampo;

  set tipoCampo(String value) {
    _tipoCampo = value;
  }

  String get CampoDes => _CampoDes;

  set CampoDes(String value) {
    _CampoDes = value;
  }

  @override
  String toString() {
    return 'InventarioDetalleAgrupado{_enapp: $_enapp, _campo: $_campo, _valor: $_valor, _tipoCampo: $_tipoCampo, _CampoDes: $_CampoDes}';
  }
}