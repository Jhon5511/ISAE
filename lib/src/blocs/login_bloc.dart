import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:isae/src/blocs/IMC/imcR_bloc.dart';
import 'package:isae/src/complements/globalVariables.dart';
import 'package:isae/src/complements/globalWidgets.dart';
import 'package:isae/src/database/statusWS_database.dart';
import 'package:isae/src/database/userData_database.dart';
import 'package:isae/src/models/userData_model.dart';
import 'package:progress_dialog/progress_dialog.dart';

class LoginBloc {


  static insertData() async {
    final dbHelper = UserDataDatabase.instance;
    final countInfo = await dbHelper.queryRowCount();
    //dbHelper.deleteUser(1);
    if(countInfo != 0) {
      final infoU = await dbHelper.getDataUser('userInfo');
      final infoP = await dbHelper.getDataUser('passInfo');

      GlobalVariables.textNEmp.text = infoU[0]['userInfo'];
      GlobalVariables.textPass.text = infoP[0]['passInfo'];

      //print(infoU[0]['userInfo']);
      //print(infoP[0]['passInfo']);

    } else {
      print('sin info');
    }
  }
  static loadingI(BuildContext context, bool status) async {

    ProgressDialog pr;
    pr = ProgressDialog(

      context,

      type: ProgressDialogType.Normal,


    );
    pr.style(
        message: '                    Cargando...',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator(),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: TextStyle(
            color: Colors.black, fontSize: 12.0, fontWeight: FontWeight.w200),
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 12.0, fontWeight: FontWeight.w600)
    );
    if(status == true) {
      await pr.show();
    } else {
      await pr.hide();
    }
  }
  static login(BuildContext context,int opcion){
    if(GlobalVariables.textNEmp.text.length == 0  || GlobalVariables.textPass.text.length == 0){
      print('ingresa los datos');
      showDialog(context: context, builder: (context) => AlertDialog(content: Text('Favor ingresar todos los datos')));

    } else {


      loadingI(context, true);
      ImcRBloc.validateUserLogin(context,opcion);

    }
  }
  static loginUpdatePass(BuildContext context){
    if(GlobalVariables.textPassActual.text.length == 0  || GlobalVariables.textPassActual.text.length == 0 || GlobalVariables.textPassConfir.text.length == 0){
      print('ingresa los datos');
      showDialog(context: context, builder: (context) => AlertDialog(content: Text('Favor ingresar todos los datos')));

    } else {
      //LoginBloc.addUserData();
      loadingI(context, true);
      ImcRBloc.updateUserLogin(context);

    }
  }
  static updateStatusWS() async {
    final dbHelper = StatusWSDatabase.instance;
    //count
    final count = await dbHelper.queryRowCount();

    if(count == 0) {
      //insert:
      Map<String, dynamic> rowWS = {
        //StatusWSDatabase.columnIdCM
        StatusWSDatabase.columnIdGnrlD : '0',
        StatusWSDatabase.columnIdCM : '0',
        StatusWSDatabase.columnIdRM : '0',
        StatusWSDatabase.columnIdVM : '0',
        StatusWSDatabase.columnIdEM : '0',
        StatusWSDatabase.columnIdIMC : '0',
        StatusWSDatabase.columnIdIMCD : '0',
        StatusWSDatabase.columnIdVivDet : '0',
        StatusWSDatabase.columnIdVivDetP : '0',
        StatusWSDatabase.columnIdVivDetRT : '0',
        StatusWSDatabase.columnIdVivDetRVg : '0',
        StatusWSDatabase.columnIdVivDetRTr : '0',
        StatusWSDatabase.columnIdVivDetRVn : '0',
        StatusWSDatabase.columnIdVivDetCo : '0',
        StatusWSDatabase.columnIdVivDetICV : '0',
        StatusWSDatabase.columnIdVivDates : '0',
      };
      final id = await dbHelper.insert(rowWS);
      print('inserted row statusWS id: $id');

    } else {
      print('Sin datos nuevos para WS-bd');
    }
  }

  static addUserData() async {
    final dbHelper = UserDataDatabase.instance;

    final count = await dbHelper.queryRowCount();
    if(count == 0) {
      final us1 = UserDataModel(
        id: 0,
        userInfo: GlobalVariables.textNEmp.text,//'84574',
        passInfo: GlobalVariables.textPass.text,//GS2020',
      );

      await dbHelper.insertUser(us1);

      print('insert objet Us in DB');
    } else {
      print('Sin datos nuevos para Us-bd');
    }

  }

  /*static updateUserData() async {
    final dbHelper = UserDataDatabase.instance;
    Map<String, dynamic> row = {
      UserDataDatabase.columnInfoU : '84574',
      UserDataDatabase.columnInfoP : 'GS2020'
    };
    final id = await dbHelper.insert(row);
    print('inserted row id: $id');
    /*count
    final count = await dbHelper.queryRowCount();

    if(count == 0) {
      //insert:
      Map<String, dynamic> rowUs = {
        //StatusWSDatabase.columnIdCM
        UserDataDatabase.columnInfoU : 'Bob',//GlobalVariables.textNEmp.text,
        UserDataDatabase.columnInfoP : '2345'//GlobalVariables.textPass.text,

      };
      final id = await dbHelper.insert(rowUs);
      print('inserted row userData id: $id');

    } else {
      print('Sin datos nuevos para Us-bd');
    }*/
  }*/

  /*void _insert() async {
    // reference to our single class that manages the database
    final dbHelper = IMCDatesDatabase.instance;
    // row to insert
    Map<String, dynamic> row = {
      IMCDatesDatabase.columnDate : '2018-10',
    };
    final id = await dbHelper.insert(row);
    print('inserted row id: $id');
  }*/
}