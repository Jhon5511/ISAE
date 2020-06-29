
class IMCDetailsMModel {

  int idM;
  int id;
  String aAnioAn;
  String aConcept;
  String aConceptL;
  String aCreditos;
  String aMonthAc;
  String aMonthAn;
  String aPercentAA;
  String aPercentMA;
  String aVarAnioAn;
  String aVarMonthAn;



  IMCDetailsMModel({this.idM, this.id, this.aAnioAn,this.aConcept, this.aConceptL, this.aCreditos,
    this.aMonthAc, this.aMonthAn, this.aPercentAA, this.aPercentMA, this.aVarAnioAn, this.aVarMonthAn});

  Map<String, dynamic> toMap(){
    return {
      'idM': idM,
      'id': id,
      'anioAnt': aAnioAn,
      'concepto': aConcept,
      'conceptoL': aConceptL,
      'creditos': aCreditos,
      'mesAct': aMonthAc,
      'mesAnt': aMonthAn,
      'porcentajeAnioAnt': aPercentAA,
      'porcentajeMesAnt': aPercentMA,
      'varAnioAnt': aVarAnioAn,
      'varMesAnt': aVarMonthAn,
    };
  }

  static final columns = ["idM","id", "anioAnt", "concepto", "conceptoL", "creditos", "mesAct",
    "mesAnt", "porcentajeAnioAnt", "porcentajeMesAnt", "varAnioAnt", "varMesAnt"];

  //-----------for WS --------------------
  factory IMCDetailsMModel.fromDatabaseJson(Map<String, dynamic> data) => IMCDetailsMModel(
    idM: data['idM'],
    id: data['id'],
    aAnioAn: data['anioAnt'],
    aConcept: data['concepto'],
    aConceptL: data['conceptoL'],
    aCreditos: data['creditos'],
    aMonthAc: data['mesAct'],
    aMonthAn: data['mesAnt'],
    aPercentAA: data['porcentajeAnioAnt'],
    aPercentMA: data['porcentajeMesAnt'],
    aVarAnioAn: data['varAnioAnt'],
    aVarMonthAn: data['varMesAnt'],
  );

  Map<String, dynamic> toDatabaseJson() => {
    "idM": this.idM,
    "id": this.id,
    "anioAnt": this.aAnioAn,
    "concepto": this.aConcept,
    "conceptoL": this.aConceptL,
    "creditos": this.aCreditos,
    "mesAct": this.aMonthAc,
    "mesAnt": this.aMonthAn,
    "porcentajeAnioAnt": this.aPercentAA,
    "porcentajeMesAnt": this.aPercentMA,
    "varAnioAnt": this.aVarAnioAn,
    "varMesAnt": this.aVarMonthAn,
  };

  //--------------------------------------

  @override
  String toString() {
    return 'DetailsMonth $idM: {id: $id, anioAnt: $aAnioAn, concepto: $aConcept, conceptoL: $aConceptL, creditos: $aCreditos, '
        'mesAct: $aMonthAc, mesAnt: $aMonthAn, porcentajeAnioAnt: $aPercentAA, porcentajeMesAnt: $aPercentMA, varAnioAnt: $aVarAnioAn, varMesAnt: $aVarMonthAn}';
  }

  int toList() {
    return aConceptL.length;
  }

}