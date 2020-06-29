class GnrlDetailsModel {

  int idD;
  int idDt;
  String aAnticipos;
  String aCapital;
  String aIntereses;
  String aLeyenda;
  String aPedidos;
  String aPlazoProm;
  String aSaldo;
  String aTicketProm;


  GnrlDetailsModel({this.idD, this.idDt, this.aAnticipos,this.aCapital, this.aIntereses, this.aLeyenda, this.aPedidos,
  this.aPlazoProm, this.aSaldo, this.aTicketProm});

  Map<String, dynamic> toMap(){
    return {
      'idD': idD,
      'idDt': idDt,
      'anticipos': aAnticipos,
      'capital': aCapital,
      'intereses': aIntereses,
      'leyenda': aLeyenda,
      'pedidos': aPedidos,
      'plazo_promedio': aPlazoProm,
      'saldo': aSaldo,
      'ticket_promedio': aTicketProm,
    };
  }

  static final columns = ["idD","idS", "anticipos", "capital", "intereses", "leyenda", "pedidos", "plazo_promedio", "saldo", "ticket_promedio"];

  //-----------for WS --------------------
  factory GnrlDetailsModel.fromDatabaseJson(Map<String, dynamic> data) => GnrlDetailsModel(
    idD: data['idD'],
    idDt: data['idDt'],
    aAnticipos: data['anticipos'],
    aCapital: data['capital'],
    aIntereses: data['intereses'],
    aLeyenda: data['leyenda'],
    aPedidos: data['pedidos'],
    aPlazoProm: data['plazo_promedio'],
    aSaldo: data['saldo'],
    aTicketProm: data['ticket_promedio'],

  );

  Map<String, dynamic> toDatabaseJson() => {
    "idD": this.idD,
    "idDt": this.idDt,
    "anticipos": this.aAnticipos,
    "capital": this.aCapital,
    "intereses": this.aIntereses,
    "leyenda": this.aLeyenda,
    "pedidos": this.aPedidos,
    "plazo_promedio": aPlazoProm,
    "saldo": this.aSaldo,
    "ticket_promedio": this.aTicketProm,
  };

  //--------------------------------------

  @override
  String toString() {
    return 'DetailsDate $idD: {idDt: $idDt, anticipos: $aAnticipos, capital: $aCapital, intereses: $aIntereses, '
        'leyenda: $aLeyenda, pedidos: $aPedidos, plazo_promedio: $aPlazoProm, saldo: $aSaldo, ticket_promedio: $aTicketProm}';
  }

  int toList() {
    return aLeyenda.length;
  }

}