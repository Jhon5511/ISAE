
class GnrlDatesModel {
  int id;
  String date;

  GnrlDatesModel({this.id, this.date});

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'date': date,
    };
  }

  static final columns = ["id", "date"];

  //-----------for WS --------------------
  factory GnrlDatesModel.fromDatabaseJson(Map<String, dynamic> data) => GnrlDatesModel(
    id: data['_id'],
    date: data['date'],
  );

  Map<String, dynamic> toDatabaseJson() => {
    "_id": this.id,
    "date": this.date,
  };

  //--------------------------------------

  @override
  String toString() {
    return 'User{id: $id, date: $date}';
  }

  int toList() {
    return date.length;
  }
}