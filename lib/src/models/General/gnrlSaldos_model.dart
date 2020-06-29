
class GnrlSaldosModel {

  int idD;
  int idS;
  String aCapital;
  String aIntereses;
  String aLeyenda;



  GnrlSaldosModel({this.idD, this.idS, this.aCapital,this.aIntereses, this.aLeyenda});

  Map<String, dynamic> toMap(){
    return {
      'idD': idD,
      'idS': idS,
      'capital': aCapital,
      'interes': aIntereses,
      'leyenda': aLeyenda,
    };
  }

  static final columns = ["idD","idS", "capital", "interes", "leyenda"];

  //-----------for WS --------------------
  factory GnrlSaldosModel.fromDatabaseJson(Map<String, dynamic> data) => GnrlSaldosModel(
    idD: data['idD'],
    idS: data['idS'],
    aCapital: data['capital'],
    aIntereses: data['interes'],
    aLeyenda: data['leyenda'],
  );

  Map<String, dynamic> toDatabaseJson() => {
    "idD": this.idD,
    "idS": this.idS,
    "capital": this.aCapital,
    "interes": this.aIntereses,
    "leyenda": this.aLeyenda,
  };

  //--------------------------------------

  @override
  String toString() {
    return 'SaldosDate $idD: {idS: $idS, capital: $aCapital, interes: $aIntereses, leyenda: $aLeyenda}';
  }

  int toList() {
    return aLeyenda.length;
  }

}