
class IMCDatesModel {

  int id;
  String descripcion;

  IMCDatesModel({this.id, this.descripcion});

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'descripcion': descripcion,
    };
  }

  static final columns = ["id", "descripcion"];

  //-----------for WS --------------------
  factory IMCDatesModel.fromDatabaseJson(Map<String, dynamic> data) => IMCDatesModel(
    id: data['_id'],
    descripcion: data['descripcion'],
  );

  Map<String, dynamic> toDatabaseJson() => {
    "_id": this.id,
    "descripcion": this.descripcion,
  };

  //--------------------------------------

  @override
  String toString() {
    return 'User{id: $id, date: $descripcion}';
  }

  int toList() {
    return descripcion.length;
  }
}