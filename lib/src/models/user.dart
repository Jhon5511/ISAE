
class User {

  int _id;
  String _nombreCompleto;
  String _correo;
  String _telefono;
  String _cp;
  String _ubicacion;
  String _perfilId;
  String _jefeId;
  String _userInfo;
  String _passInfo;




  User (this._id,
      this._nombreCompleto,
      this._correo,
      this._telefono,
      this._cp,
      this._ubicacion,
      this._perfilId,
      this._jefeId,
      this._userInfo,
      this._passInfo);

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get nombreCompleto => _nombreCompleto;

  String get passInfo => _passInfo;

  set passInfo(String value) {
    _passInfo = value;
  }

  String get userInfo => _userInfo;

  set userInfo(String value) {
    _userInfo = value;
  }

  String get jefeId => _jefeId;

  set jefeId(String value) {
    _jefeId = value;
  }

  String get perfilId => _perfilId;

  set perfilId(String value) {
    _perfilId = value;
  }

  String get ubicacion => _ubicacion;

  set ubicacion(String value) {
    _ubicacion = value;
  }

  String get cp => _cp;

  set cp(String value) {
    _cp = value;
  }

  String get telefono => _telefono;

  set telefono(String value) {
    _telefono = value;
  }

  String get correo => _correo;

  set correo(String value) {
    _correo = value;
  }

  set nombreCompleto(String value) {
    _nombreCompleto = value;
  }

  @override
  String toString() {
    return 'UserDataModel{_id: $_id, _nombreCompleto: $_nombreCompleto, _correo: $_correo, _telefono: $_telefono, _cp: $_cp, _ubicacion: $_ubicacion, _perfilId: $_perfilId, _jefeId: $_jefeId, _userInfo: $_userInfo, _passInfo: $_passInfo}';
  }
}