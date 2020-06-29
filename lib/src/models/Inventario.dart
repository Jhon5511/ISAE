class Inventario {

  int _inventarioid;
  String _proyectoid;
  String _proyecto;
  String _proyectodescripcion;
  String _fcreacon;
  String _fcreaconfiles;
  String _fmodificafiles;
  String _folio;
  String _id;
  String _apellidos;
  String _nombres;
  String _nombrecompleto;
  String _numempleado;
  String _vip;
  String _puesto;
  String _direccion;
  String _subdireccion;
  String _clavesubdireccion;
  String _gerencia;
  String _clavegerencia;
  String _depto;
  String _clavecentrotrabajo;
  String _correo;
  String _telefono;
  String _ext;
  String _ubicacion;
  String _colonia;
  String _cp;
  String _estado;
  String _ubicacioncompleta;
  String _zona;
  String _localidad;
  String _edificio;
  String _piso;
  String _area;
  String _adscripcion;
  String _apellidosjefe;
  String _nombresjefe;
  String _nombrecompletojefe;
  String _fichajefe;
  String _extjefe;
  String _ubicacionjefe;
  String _nombrejefeinmediato;
  String _apellidosresguardo;
  String _nombresresguardo;
  String _nombrecompletoresguardo;
  String _adscripcionresguardo;
  String _extresguardo;
  String _apellidosresponsable;
  String _nombresresponsable;
  String _nombrecompletoresponsable;
  String _apellidospemex;
  String _nombrespemex;
  String _nombrecompletopemex;
  String _tipoequipo;
  String _equipo;
  String _marcaequipo;
  String _modeloequipo;
  String _numserieequipo;
  String _equipocompleto;
  String _monitor;
  String _marcamonitor;
  String _modelomonitor;
  String _numseriemonitor;
  String _monitorcompleto;
  String _teclado;
  String _marcateclado;
  String _modeloteclado;
  String _numserieteclado;
  String _tecladocompleto;
  String _mouse;
  String _marcamouse;
  String _modelomause;
  String _numseriemouse;
  String _mousecompleto;
  String _ups;
  String _marcaups;
  String _modeloups;
  String _numserieups;
  String _upscompleto;
  String _maletin;
  String _marcamaletin;
  String _modelomaletin;
  String _numseriemaletin;
  String _maletincomleto;
  String _candado;
  String _marcacandado;
  String _modelocandado;
  String _numseriecandado;
  String _candadocompleto;
  String _bocinas;
  String _marcabocinas;
  String _modelobocinas;
  String _numseriebocinas;
  String _bocinascompleto;
  String _camara;
  String _marcacamara;
  String _modelocamara;
  String _numseriecmara;
  String _camaracompleto;
  String _monitor2;
  String _marcamonitor2;
  String _modelomonitor2;
  String _numseriemonitor2;
  String _monitor2completo;
  String _accesorio;
  String _marcaaccesorio;
  String _modeloaccesorio;
  String _numserieaccesorio;
  String _accesoriocompleto;
  String _ram;
  String _discoduro;
  String _procesador;
  String _tipoequipocomp1;
  String _modelocomp1;
  String _numseriecomp1;
  String _cruceclientecomp1;
  String _tipoequipocomp2;
  String _modelocomp2;
  String _numseriecomp2;
  String _cruceclientecomp2;
  String _tipoequipocomp3;
  String _modelocomp3;
  String _numseriecomp3;
  String _cruceclientecomp3;
  String _tipoequipocomp4;
  String _modelocomp4;
  String _numseriecomp4;
  String _cruceclientecomp4;
  String _tipoequipocomp5;
  String _modelocomp5;
  String _numseriecomp5;
  String _cruceclientecomp5;
  String _tipoequipocomp6;
  String _modelocomp6;
  String _numseriecomp6;
  String _cruceclientecomp6;
  String _tipoequipocomp7;
  String _modelocomp7;
  String _numseriecomp7;
  String _cruceclientecomp7;
  String _validacioncomp1;
  String _validacioncomp2;
  String _validacioncomp3;
  String _validacioncomp4;
  String _validacioncomp5;
  String _validacioncomp6;
  String _validacioncomp7;
  String _validadoscomp;
  String _tecniconombre;
  String _dia;
  String _mes;
  String _anio;
  String _reqespecial1;
  String _reqespecial2;
  String _obsinv;
  String _obsresguardo;
  String _obsextras1;
  String _obsextras2;
  String _estatus;
  String _fescalacion;
  String _comentariosescalacion;
  String _estatusfiles;

Inventario(this._inventarioid, this._folio);

  /*Inventario(
      this._inventarioid,
      this._proyectoid,
      this._proyecto,
      this._proyectodescripcion,
      this._fcreacon,
      this._fcreaconfiles,
      this._fmodificafiles,
      this._folio,
      this._id,
      this._apellidos,
      this._nombres,
      this._nombrecompleto,
      this._numempleado,
      this._vip,
      this._puesto,
      this._direccion,
      this._subdireccion,
      this._clavesubdireccion,
      this._gerencia,
      this._clavegerencia,
      this._depto,
      this._clavecentrotrabajo,
      this._correo,
      this._telefono,
      this._ext,
      this._ubicacion,
      this._colonia,
      this._cp,
      this._estado,
      this._ubicacioncompleta,
      this._zona,
      this._localidad,
      this._edificio,
      this._piso,
      this._area,
      this._adscripcion,
      this._apellidosjefe,
      this._nombresjefe,
      this._nombrecompletojefe,
      this._fichajefe,
      this._extjefe,
      this._ubicacionjefe,
      this._nombrejefeinmediato,
      this._apellidosresguardo,
      this._nombresresguardo,
      this._nombrecompletoresguardo,
      this._adscripcionresguardo,
      this._extresguardo,
      this._apellidosresponsable,
      this._nombresresponsable,
      this._nombrecompletoresponsable,
      this._apellidospemex,
      this._nombrespemex,
      this._nombrecompletopemex,
      this._tipoequipo,
      this._equipo,
      this._marcaequipo,
      this._modeloequipo,
      this._numserieequipo,
      this._equipocompleto,
      this._monitor,
      this._marcamonitor,
      this._modelomonitor,
      this._numseriemonitor,
      this._monitorcompleto,
      this._teclado,
      this._marcateclado,
      this._modeloteclado,
      this._numserieteclado,
      this._tecladocompleto,
      this._mouse,
      this._marcamouse,
      this._modelomause,
      this._numseriemouse,
      this._mousecompleto,
      this._ups,
      this._marcaups,
      this._modeloups,
      this._numserieups,
      this._upscompleto,
      this._maletin,
      this._marcamaletin,
      this._modelomaletin,
      this._numseriemaletin,
      this._maletincomleto,
      this._candado,
      this._marcacandado,
      this._modelocandado,
      this._numseriecandado,
      this._candadocompleto,
      this._bocinas,
      this._marcabocinas,
      this._modelobocinas,
      this._numseriebocinas,
      this._bocinascompleto,
      this._camara,
      this._marcacamara,
      this._modelocamara,
      this._numseriecmara,
      this._camaracompleto,
      this._monitor2,
      this._marcamonitor2,
      this._modelomonitor2,
      this._numseriemonitor2,
      this._monitor2completo,
      this._accesorio,
      this._marcaaccesorio,
      this._modeloaccesorio,
      this._numserieaccesorio,
      this._accesoriocompleto,
      this._ram,
      this._discoduro,
      this._procesador,
      this._tipoequipocomp1,
      this._modelocomp1,
      this._numseriecomp1,
      this._cruceclientecomp1,
      this._tipoequipocomp2,
      this._modelocomp2,
      this._numseriecomp2,
      this._cruceclientecomp2,
      this._tipoequipocomp3,
      this._modelocomp3,
      this._numseriecomp3,
      this._cruceclientecomp3,
      this._tipoequipocomp4,
      this._modelocomp4,
      this._numseriecomp4,
      this._cruceclientecomp4,
      this._tipoequipocomp5,
      this._modelocomp5,
      this._numseriecomp5,
      this._cruceclientecomp5,
      this._tipoequipocomp6,
      this._modelocomp6,
      this._numseriecomp6,
      this._cruceclientecomp6,
      this._tipoequipocomp7,
      this._modelocomp7,
      this._numseriecomp7,
      this._cruceclientecomp7,
      this._validacioncomp1,
      this._validacioncomp2,
      this._validacioncomp3,
      this._validacioncomp4,
      this._validacioncomp5,
      this._validacioncomp6,
      this._validacioncomp7,
      this._validadoscomp,
      this._tecniconombre,
      this._dia,
      this._mes,
      this._anio,
      this._reqespecial1,
      this._reqespecial2,
      this._obsinv,
      this._obsresguardo,
      this._obsextras1,
      this._obsextras2,
      this._estatus,
      this._fescalacion,
      this._comentariosescalacion,
      this._estatusfiles);
*/
  String get estatusfiles => _estatusfiles;

  set estatusfiles(String value) {
    _estatusfiles = value;
  }

  String get comentariosescalacion => _comentariosescalacion;

  set comentariosescalacion(String value) {
    _comentariosescalacion = value;
  }

  String get fescalacion => _fescalacion;

  set fescalacion(String value) {
    _fescalacion = value;
  }

  String get estatus => _estatus;

  set estatus(String value) {
    _estatus = value;
  }

  String get obsextras2 => _obsextras2;

  set obsextras2(String value) {
    _obsextras2 = value;
  }

  String get obsextras1 => _obsextras1;

  set obsextras1(String value) {
    _obsextras1 = value;
  }

  String get obsresguardo => _obsresguardo;

  set obsresguardo(String value) {
    _obsresguardo = value;
  }

  String get obsinv => _obsinv;

  set obsinv(String value) {
    _obsinv = value;
  }

  String get reqespecial2 => _reqespecial2;

  set reqespecial2(String value) {
    _reqespecial2 = value;
  }

  String get reqespecial1 => _reqespecial1;

  set reqespecial1(String value) {
    _reqespecial1 = value;
  }

  String get anio => _anio;

  set anio(String value) {
    _anio = value;
  }

  String get mes => _mes;

  set mes(String value) {
    _mes = value;
  }

  String get dia => _dia;

  set dia(String value) {
    _dia = value;
  }

  String get tecniconombre => _tecniconombre;

  set tecniconombre(String value) {
    _tecniconombre = value;
  }

  String get validadoscomp => _validadoscomp;

  set validadoscomp(String value) {
    _validadoscomp = value;
  }

  String get validacioncomp7 => _validacioncomp7;

  set validacioncomp7(String value) {
    _validacioncomp7 = value;
  }

  String get validacioncomp6 => _validacioncomp6;

  set validacioncomp6(String value) {
    _validacioncomp6 = value;
  }

  String get validacioncomp5 => _validacioncomp5;

  set validacioncomp5(String value) {
    _validacioncomp5 = value;
  }

  String get validacioncomp4 => _validacioncomp4;

  set validacioncomp4(String value) {
    _validacioncomp4 = value;
  }

  String get validacioncomp3 => _validacioncomp3;

  set validacioncomp3(String value) {
    _validacioncomp3 = value;
  }

  String get validacioncomp2 => _validacioncomp2;

  set validacioncomp2(String value) {
    _validacioncomp2 = value;
  }

  String get validacioncomp1 => _validacioncomp1;

  set validacioncomp1(String value) {
    _validacioncomp1 = value;
  }

  String get cruceclientecomp7 => _cruceclientecomp7;

  set cruceclientecomp7(String value) {
    _cruceclientecomp7 = value;
  }

  String get numseriecomp7 => _numseriecomp7;

  set numseriecomp7(String value) {
    _numseriecomp7 = value;
  }

  String get modelocomp7 => _modelocomp7;

  set modelocomp7(String value) {
    _modelocomp7 = value;
  }

  String get tipoequipocomp7 => _tipoequipocomp7;

  set tipoequipocomp7(String value) {
    _tipoequipocomp7 = value;
  }

  String get cruceclientecomp6 => _cruceclientecomp6;

  set cruceclientecomp6(String value) {
    _cruceclientecomp6 = value;
  }

  String get numseriecomp6 => _numseriecomp6;

  set numseriecomp6(String value) {
    _numseriecomp6 = value;
  }

  String get modelocomp6 => _modelocomp6;

  set modelocomp6(String value) {
    _modelocomp6 = value;
  }

  String get tipoequipocomp6 => _tipoequipocomp6;

  set tipoequipocomp6(String value) {
    _tipoequipocomp6 = value;
  }

  String get cruceclientecomp5 => _cruceclientecomp5;

  set cruceclientecomp5(String value) {
    _cruceclientecomp5 = value;
  }

  String get numseriecomp5 => _numseriecomp5;

  set numseriecomp5(String value) {
    _numseriecomp5 = value;
  }

  String get modelocomp5 => _modelocomp5;

  set modelocomp5(String value) {
    _modelocomp5 = value;
  }

  String get tipoequipocomp5 => _tipoequipocomp5;

  set tipoequipocomp5(String value) {
    _tipoequipocomp5 = value;
  }

  String get cruceclientecomp4 => _cruceclientecomp4;

  set cruceclientecomp4(String value) {
    _cruceclientecomp4 = value;
  }

  String get numseriecomp4 => _numseriecomp4;

  set numseriecomp4(String value) {
    _numseriecomp4 = value;
  }

  String get modelocomp4 => _modelocomp4;

  set modelocomp4(String value) {
    _modelocomp4 = value;
  }

  String get tipoequipocomp4 => _tipoequipocomp4;

  set tipoequipocomp4(String value) {
    _tipoequipocomp4 = value;
  }

  String get cruceclientecomp3 => _cruceclientecomp3;

  set cruceclientecomp3(String value) {
    _cruceclientecomp3 = value;
  }

  String get numseriecomp3 => _numseriecomp3;

  set numseriecomp3(String value) {
    _numseriecomp3 = value;
  }

  String get modelocomp3 => _modelocomp3;

  set modelocomp3(String value) {
    _modelocomp3 = value;
  }

  String get tipoequipocomp3 => _tipoequipocomp3;

  set tipoequipocomp3(String value) {
    _tipoequipocomp3 = value;
  }

  String get cruceclientecomp2 => _cruceclientecomp2;

  set cruceclientecomp2(String value) {
    _cruceclientecomp2 = value;
  }

  String get numseriecomp2 => _numseriecomp2;

  set numseriecomp2(String value) {
    _numseriecomp2 = value;
  }

  String get modelocomp2 => _modelocomp2;

  set modelocomp2(String value) {
    _modelocomp2 = value;
  }

  String get tipoequipocomp2 => _tipoequipocomp2;

  set tipoequipocomp2(String value) {
    _tipoequipocomp2 = value;
  }

  String get cruceclientecomp1 => _cruceclientecomp1;

  set cruceclientecomp1(String value) {
    _cruceclientecomp1 = value;
  }

  String get numseriecomp1 => _numseriecomp1;

  set numseriecomp1(String value) {
    _numseriecomp1 = value;
  }

  String get modelocomp1 => _modelocomp1;

  set modelocomp1(String value) {
    _modelocomp1 = value;
  }

  String get tipoequipocomp1 => _tipoequipocomp1;

  set tipoequipocomp1(String value) {
    _tipoequipocomp1 = value;
  }

  String get procesador => _procesador;

  set procesador(String value) {
    _procesador = value;
  }

  String get discoduro => _discoduro;

  set discoduro(String value) {
    _discoduro = value;
  }

  String get ram => _ram;

  set ram(String value) {
    _ram = value;
  }

  String get accesoriocompleto => _accesoriocompleto;

  set accesoriocompleto(String value) {
    _accesoriocompleto = value;
  }

  String get numserieaccesorio => _numserieaccesorio;

  set numserieaccesorio(String value) {
    _numserieaccesorio = value;
  }

  String get modeloaccesorio => _modeloaccesorio;

  set modeloaccesorio(String value) {
    _modeloaccesorio = value;
  }

  String get marcaaccesorio => _marcaaccesorio;

  set marcaaccesorio(String value) {
    _marcaaccesorio = value;
  }

  String get accesorio => _accesorio;

  set accesorio(String value) {
    _accesorio = value;
  }

  String get monitor2completo => _monitor2completo;

  set monitor2completo(String value) {
    _monitor2completo = value;
  }

  String get numseriemonitor2 => _numseriemonitor2;

  set numseriemonitor2(String value) {
    _numseriemonitor2 = value;
  }

  String get modelomonitor2 => _modelomonitor2;

  set modelomonitor2(String value) {
    _modelomonitor2 = value;
  }

  String get marcamonitor2 => _marcamonitor2;

  set marcamonitor2(String value) {
    _marcamonitor2 = value;
  }

  String get monitor2 => _monitor2;

  set monitor2(String value) {
    _monitor2 = value;
  }

  String get camaracompleto => _camaracompleto;

  set camaracompleto(String value) {
    _camaracompleto = value;
  }

  String get numseriecmara => _numseriecmara;

  set numseriecmara(String value) {
    _numseriecmara = value;
  }

  String get modelocamara => _modelocamara;

  set modelocamara(String value) {
    _modelocamara = value;
  }

  String get marcacamara => _marcacamara;

  set marcacamara(String value) {
    _marcacamara = value;
  }

  String get camara => _camara;

  set camara(String value) {
    _camara = value;
  }

  String get bocinascompleto => _bocinascompleto;

  set bocinascompleto(String value) {
    _bocinascompleto = value;
  }

  String get numseriebocinas => _numseriebocinas;

  set numseriebocinas(String value) {
    _numseriebocinas = value;
  }

  String get modelobocinas => _modelobocinas;

  set modelobocinas(String value) {
    _modelobocinas = value;
  }

  String get marcabocinas => _marcabocinas;

  set marcabocinas(String value) {
    _marcabocinas = value;
  }

  String get bocinas => _bocinas;

  set bocinas(String value) {
    _bocinas = value;
  }

  String get candadocompleto => _candadocompleto;

  set candadocompleto(String value) {
    _candadocompleto = value;
  }

  String get numseriecandado => _numseriecandado;

  set numseriecandado(String value) {
    _numseriecandado = value;
  }

  String get modelocandado => _modelocandado;

  set modelocandado(String value) {
    _modelocandado = value;
  }

  String get marcacandado => _marcacandado;

  set marcacandado(String value) {
    _marcacandado = value;
  }

  String get candado => _candado;

  set candado(String value) {
    _candado = value;
  }

  String get maletincomleto => _maletincomleto;

  set maletincomleto(String value) {
    _maletincomleto = value;
  }

  String get numseriemaletin => _numseriemaletin;

  set numseriemaletin(String value) {
    _numseriemaletin = value;
  }

  String get modelomaletin => _modelomaletin;

  set modelomaletin(String value) {
    _modelomaletin = value;
  }

  String get marcamaletin => _marcamaletin;

  set marcamaletin(String value) {
    _marcamaletin = value;
  }

  String get maletin => _maletin;

  set maletin(String value) {
    _maletin = value;
  }

  String get upscompleto => _upscompleto;

  set upscompleto(String value) {
    _upscompleto = value;
  }

  String get numserieups => _numserieups;

  set numserieups(String value) {
    _numserieups = value;
  }

  String get modeloups => _modeloups;

  set modeloups(String value) {
    _modeloups = value;
  }

  String get marcaups => _marcaups;

  set marcaups(String value) {
    _marcaups = value;
  }

  String get ups => _ups;

  set ups(String value) {
    _ups = value;
  }

  String get mousecompleto => _mousecompleto;

  set mousecompleto(String value) {
    _mousecompleto = value;
  }

  String get numseriemouse => _numseriemouse;

  set numseriemouse(String value) {
    _numseriemouse = value;
  }

  String get modelomause => _modelomause;

  set modelomause(String value) {
    _modelomause = value;
  }

  String get marcamouse => _marcamouse;

  set marcamouse(String value) {
    _marcamouse = value;
  }

  String get mouse => _mouse;

  set mouse(String value) {
    _mouse = value;
  }

  String get tecladocompleto => _tecladocompleto;

  set tecladocompleto(String value) {
    _tecladocompleto = value;
  }

  String get numserieteclado => _numserieteclado;

  set numserieteclado(String value) {
    _numserieteclado = value;
  }

  String get modeloteclado => _modeloteclado;

  set modeloteclado(String value) {
    _modeloteclado = value;
  }

  String get marcateclado => _marcateclado;

  set marcateclado(String value) {
    _marcateclado = value;
  }

  String get teclado => _teclado;

  set teclado(String value) {
    _teclado = value;
  }

  String get monitorcompleto => _monitorcompleto;

  set monitorcompleto(String value) {
    _monitorcompleto = value;
  }

  String get numseriemonitor => _numseriemonitor;

  set numseriemonitor(String value) {
    _numseriemonitor = value;
  }

  String get modelomonitor => _modelomonitor;

  set modelomonitor(String value) {
    _modelomonitor = value;
  }

  String get marcamonitor => _marcamonitor;

  set marcamonitor(String value) {
    _marcamonitor = value;
  }

  String get monitor => _monitor;

  set monitor(String value) {
    _monitor = value;
  }

  String get equipocompleto => _equipocompleto;

  set equipocompleto(String value) {
    _equipocompleto = value;
  }

  String get numserieequipo => _numserieequipo;

  set numserieequipo(String value) {
    _numserieequipo = value;
  }

  String get modeloequipo => _modeloequipo;

  set modeloequipo(String value) {
    _modeloequipo = value;
  }

  String get marcaequipo => _marcaequipo;

  set marcaequipo(String value) {
    _marcaequipo = value;
  }

  String get equipo => _equipo;

  set equipo(String value) {
    _equipo = value;
  }

  String get tipoequipo => _tipoequipo;

  set tipoequipo(String value) {
    _tipoequipo = value;
  }

  String get nombrecompletopemex => _nombrecompletopemex;

  set nombrecompletopemex(String value) {
    _nombrecompletopemex = value;
  }

  String get nombrespemex => _nombrespemex;

  set nombrespemex(String value) {
    _nombrespemex = value;
  }

  String get apellidospemex => _apellidospemex;

  set apellidospemex(String value) {
    _apellidospemex = value;
  }

  String get nombrecompletoresponsable => _nombrecompletoresponsable;

  set nombrecompletoresponsable(String value) {
    _nombrecompletoresponsable = value;
  }

  String get nombresresponsable => _nombresresponsable;

  set nombresresponsable(String value) {
    _nombresresponsable = value;
  }

  String get apellidosresponsable => _apellidosresponsable;

  set apellidosresponsable(String value) {
    _apellidosresponsable = value;
  }

  String get extresguardo => _extresguardo;

  set extresguardo(String value) {
    _extresguardo = value;
  }

  String get adscripcionresguardo => _adscripcionresguardo;

  set adscripcionresguardo(String value) {
    _adscripcionresguardo = value;
  }

  String get nombrecompletoresguardo => _nombrecompletoresguardo;

  set nombrecompletoresguardo(String value) {
    _nombrecompletoresguardo = value;
  }

  String get nombresresguardo => _nombresresguardo;

  set nombresresguardo(String value) {
    _nombresresguardo = value;
  }

  String get apellidosresguardo => _apellidosresguardo;

  set apellidosresguardo(String value) {
    _apellidosresguardo = value;
  }

  String get nombrejefeinmediato => _nombrejefeinmediato;

  set nombrejefeinmediato(String value) {
    _nombrejefeinmediato = value;
  }

  String get ubicacionjefe => _ubicacionjefe;

  set ubicacionjefe(String value) {
    _ubicacionjefe = value;
  }

  String get extjefe => _extjefe;

  set extjefe(String value) {
    _extjefe = value;
  }

  String get fichajefe => _fichajefe;

  set fichajefe(String value) {
    _fichajefe = value;
  }

  String get nombrecompletojefe => _nombrecompletojefe;

  set nombrecompletojefe(String value) {
    _nombrecompletojefe = value;
  }

  String get nombresjefe => _nombresjefe;

  set nombresjefe(String value) {
    _nombresjefe = value;
  }

  String get apellidosjefe => _apellidosjefe;

  set apellidosjefe(String value) {
    _apellidosjefe = value;
  }

  String get adscripcion => _adscripcion;

  set adscripcion(String value) {
    _adscripcion = value;
  }

  String get area => _area;

  set area(String value) {
    _area = value;
  }

  String get piso => _piso;

  set piso(String value) {
    _piso = value;
  }

  String get edificio => _edificio;

  set edificio(String value) {
    _edificio = value;
  }

  String get localidad => _localidad;

  set localidad(String value) {
    _localidad = value;
  }

  String get zona => _zona;

  set zona(String value) {
    _zona = value;
  }

  String get ubicacioncompleta => _ubicacioncompleta;

  set ubicacioncompleta(String value) {
    _ubicacioncompleta = value;
  }

  String get estado => _estado;

  set estado(String value) {
    _estado = value;
  }

  String get cp => _cp;

  set cp(String value) {
    _cp = value;
  }

  String get colonia => _colonia;

  set colonia(String value) {
    _colonia = value;
  }

  String get ubicacion => _ubicacion;

  set ubicacion(String value) {
    _ubicacion = value;
  }

  String get ext => _ext;

  set ext(String value) {
    _ext = value;
  }

  String get telefono => _telefono;

  set telefono(String value) {
    _telefono = value;
  }

  String get correo => _correo;

  set correo(String value) {
    _correo = value;
  }

  String get clavecentrotrabajo => _clavecentrotrabajo;

  set clavecentrotrabajo(String value) {
    _clavecentrotrabajo = value;
  }

  String get depto => _depto;

  set depto(String value) {
    _depto = value;
  }

  String get clavegerencia => _clavegerencia;

  set clavegerencia(String value) {
    _clavegerencia = value;
  }

  String get gerencia => _gerencia;

  set gerencia(String value) {
    _gerencia = value;
  }

  String get clavesubdireccion => _clavesubdireccion;

  set clavesubdireccion(String value) {
    _clavesubdireccion = value;
  }

  String get subdireccion => _subdireccion;

  set subdireccion(String value) {
    _subdireccion = value;
  }

  String get direccion => _direccion;

  set direccion(String value) {
    _direccion = value;
  }

  String get puesto => _puesto;

  set puesto(String value) {
    _puesto = value;
  }

  String get vip => _vip;

  set vip(String value) {
    _vip = value;
  }

  String get numempleado => _numempleado;

  set numempleado(String value) {
    _numempleado = value;
  }

  String get nombrecompleto => _nombrecompleto;

  set nombrecompleto(String value) {
    _nombrecompleto = value;
  }

  String get nombres => _nombres;

  set nombres(String value) {
    _nombres = value;
  }

  String get apellidos => _apellidos;

  set apellidos(String value) {
    _apellidos = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  String get folio => _folio;

  set folio(String value) {
    _folio = value;
  }

  String get fmodificafiles => _fmodificafiles;

  set fmodificafiles(String value) {
    _fmodificafiles = value;
  }

  String get fcreaconfiles => _fcreaconfiles;

  set fcreaconfiles(String value) {
    _fcreaconfiles = value;
  }

  String get fcreacon => _fcreacon;

  set fcreacon(String value) {
    _fcreacon = value;
  }

  String get proyectodescripcion => _proyectodescripcion;

  set proyectodescripcion(String value) {
    _proyectodescripcion = value;
  }

  String get proyecto => _proyecto;

  set proyecto(String value) {
    _proyecto = value;
  }

  String get proyectoid => _proyectoid;

  set proyectoid(String value) {
    _proyectoid = value;
  }

  int get inventarioid => _inventarioid;

  set inventarioid(int value) {
    _inventarioid = value;
  }

  @override
  String toString() {
    return 'Inventario{_inventarioid: $_inventarioid, _folio: $_folio}';
  }
}