
class UserDataModel {

  int id;
  String userInfo;
  String passInfo;

  UserDataModel({this.id, this.userInfo, this.passInfo});

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'userInfo': userInfo,
      'passInfo': passInfo,
    };
  }

  static final columns = ["id", "userInfo", "passInfo"];

  // Implementa toString para que sea más fácil ver información sobre cada objeto
  // usando la declaración de impresión.
  @override
  String toString() {
    return 'User{id: $id, user: $userInfo, pass: $passInfo}';
  }

}