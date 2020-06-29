import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:isae/src/complements/globalStyles.dart';
import 'package:isae/src/complements/globalVariables.dart';
import 'package:isae/src/complements/globalWidgets.dart';
import 'package:isae/src/database/IMC/imcDates_database.dart';
import 'package:isae/src/database/IMC/imcDetailsM_database.dart';
import 'package:isae/src/models/IMC/imcDates_model.dart';
import 'package:isae/src/models/IMC/imcDetailsM_model.dart';
import 'package:isae/src/models/imcR_models.dart';
import 'package:isae/src/services/ApiDefinitions.dart';
import 'package:isae/src/services/consults_imc/Inventario_wsConsults.dart';
import 'package:isae/src/ui/IMC/InventarioAdd_scren.dart';
import 'package:isae/src/ui/IMC/PhotoPreviewScreen.dart';
import 'package:isae/src/ui/IMC/PthotoImagen_scren.dart';
import 'package:isae/src/ui/IMC/Inventario_scren.dart';
import 'package:isae/src/ui/loginUpdatePass_screen.dart';
import 'package:isae/src/ui/login_screen.dart';
import 'package:camera/camera.dart';
class ImcRBloc {


  static  validateUserLogin(BuildContext context,int opcion) async {

    print('Entrando a app cargando Ws -----> Login');
    if(opcion == 1){
      loginUser(context, ApiDefinition.wsLoginUser, GlobalVariables.textNEmp.text, GlobalVariables.textPass.text);

    }else{
      loginValidateUser(context, ApiDefinition.wsLoginValidateUser, GlobalVariables.textNEmp.text, GlobalVariables.textPass.text);
    }


  }
  static  updateUserLogin(BuildContext context) async {

    print('Entrando a app cargando Ws -----> Login');
    updateUser(context, ApiDefinition.wsLoginUserUpdate + GlobalVariables.user.id.toString(), GlobalVariables.textPassNew.text);


  }
  static getProyects(BuildContext context,int opcion) async {

    print('Entrando a app cargando Ws -----> Home');
    getProyect(context, ApiDefinition.wsProyects, opcion);
    getInventarioAgrupado(context, ApiDefinition.wsInventToAgrupado, '2019-06-30', '206246');
    for (var index = 1; index < 29; index++){
      ImcRBloc.loadcatlogos(context,index);

    }


  }
  static loadInventarioAgrupado(BuildContext context, int idProyect, int idInven ) async {

    print('Entrando a app cargando Ws -----> Home');
    getInventarioAgrupado(context, ApiDefinition.wsInventToAgrupado, '2019-06-30', '206246');
    //getInvent(context, ApiDefinition.wsInventToProyect + '6');



  }
  static loadInventarioDetalleAgrupado(BuildContext context,int opcion) async {

    print('Entrando a app cargando Ws -----> DetalleAgrupado');
    if( opcion == 1){
      getInventarioDetalleAgrupado(context, ApiDefinition.wsDetalleAgrupado + GlobalVariables.idProyect.toString()+ '/' + GlobalVariables.idIventario.toString() + '/' +GlobalVariables.idAgrupador.toString());

    }else{
      getInventarioDetalleAgrupado(context, ApiDefinition.wsDetalleAgrupado + GlobalVariables.idProyect.toString()+ '/1/' +GlobalVariables.idAgrupador.toString());

    }




  }
  static updateDetalleInvet(BuildContext context, int idProyc, int idInvent, String campo, String valor) async {

    print('Entrando a app cargando Ws -----> update');
    updateInvent(context, ApiDefinition.wsUpdateInventario + idProyc.toString()+ '/' + idInvent.toString(),campo,valor );
    //getInvent(context, ApiDefinition.wsInventToProyect + '6');



  }


  static loadcatlogos(BuildContext context, int id) async {

    print('Entrando a app cargando Ws -----> catalogos ' + id.toString());
    getCatalogosAdd(context, ApiDefinition.wsCatalogos+ id.toString(), id);


  }

  static insertInvet(BuildContext context) async {

    print('Entrando a app cargando Ws -----> update');
    insertInvent(context, ApiDefinition.wsInsertInvet);


  }


  static addDatesImc(int id, String date) async {
    final dbHelper = IMCDatesDatabase.instance;

    final dateM = IMCDatesModel(
      id: id,
      descripcion: date,
    );

    await dbHelper.insertDates(dateM);

    //print('insert objet id: $id. in DB');
  }

  static loadViewIMC(BuildContext context) async {

    final dbHelper = IMCDatesDatabase.instance;
    final countDates = await dbHelper.queryRowCount();
   final idM = countDates - 1 ;
    //final idM =  1 ;
    //Load global variables:
    ImcRBloc.getListDates(context, idM);

    //load bar select:
    GlobalVariables.selectBar = idM;
  }

  static getListDates(BuildContext context, int idM) async {
    final dbHelper = IMCDatesDatabase.instance;
    final countDates = await dbHelper.queryRowCount();

    //clean list:
    GlobalVariables.listDatesIMC.clear();
    //add dates in list:
    for(var i = 0; i < countDates; i++){
      final date = await dbHelper.getDate('id');
      GlobalVariables.listDatesIMC.add(date[i]['id']);
    }

    //add text date:
    GlobalVariables.dateIMC = GlobalVariables.listDatesIMC[idM];
    //finished getDates - start details concepts
    /////ImcRBloc.getDetailsCn(context, idM);
    ImcRBloc.loadProyects(context);
  }



  static addDetailsImc(int idM, int id, String anioAnt, String concepto, String conceptoL, String creditos,
      String mesAct, String mesAnt, String pAnioAnt, String pMesAnt, String varAnioAnt, String varMesAnt) async {

    final dbHelper = IMCDetailsMDatabase.instance;

    final detailM = IMCDetailsMModel(
      idM: idM,
      id: id,
      aAnioAn: anioAnt,
      aConcept: concepto,
      aConceptL: conceptoL,
      aCreditos: creditos,
      aMonthAc: mesAct,
      aMonthAn: mesAnt,
      aPercentAA: pAnioAnt,
      aPercentMA: pMesAnt,
      aVarAnioAn: varAnioAnt,
      aVarMonthAn: varMesAnt,
    );

    await dbHelper.insertDetails(detailM);

    //print('insert objet id: $idM. in DB');
  }

  /*static getListetails(BuildContext context, List<String> listD, String nColumn, int idM) async {
    final dbHelper = IMCDetailsMDatabase.instance;
    final countDetails = await dbHelper.queryCount('anioAnt', 0);
    //Clean list:
    listD.clear();
    //add details in list:
    for(var i = 0; i < countDetails; i++){
      final detail = await dbHelper.getDetail('$nColumn', idM);
      listD.add(detail[i]['$nColumn']);
    }
  }*/

  //getsDetails anidados:----------------------------------------------
  static getDetailsCn(BuildContext context, int idM) async {
//    final dbHelper = IMCDetailsMDatabase.instance;
//    final countDetails = await dbHelper.queryCount('anioAnt', idM);
//
//    //Clean list:
//    GlobalVariables.listConcepts.clear();
//    //add details in list:
//    for(var i = 0; i < countDetails; i++){
//      final detail = await dbHelper.getDetail('conceptoL', idM);
//      GlobalVariables.listConcepts.add(detail[i]['conceptoL']);
//    }
    //finished concept - start año anterior
    ImcRBloc.getDetailsAA(context, idM);
  }
  static getDetailsAA(BuildContext context, int idM) async {
    final dbHelper = IMCDetailsMDatabase.instance;
//    final countDetails = await dbHelper.queryCount('anioAnt', idM);
//    //Clean list:
//    GlobalVariables.anioAnt.clear();
//    //add details in list:
//    for(var i = 0; i < countDetails; i++){
//      final detail = await dbHelper.getDetail('anioAnt', idM);
//      GlobalVariables.anioAnt.add(detail[i]['anioAnt']);
//    }
//    //finished año anterior - start mes anterior
    ImcRBloc.getDetailsMAn(context, idM);
  }

  static getDetailsMAn(BuildContext context, int idM) async {
//    final dbHelper = IMCDetailsMDatabase.instance;
//    final countDetails = await dbHelper.queryCount('anioAnt', idM);
//    //Clean list:
//    GlobalVariables.monthAnt.clear();
//    //add details in list:
//    for(var i = 0; i < countDetails; i++){
//      final detail = await dbHelper.getDetail('mesAnt', idM);
//      GlobalVariables.monthAnt.add(detail[i]['mesAnt']);
//    }
//    //finished mes anterior - start mes actual
    ImcRBloc.getDetailsMAc(context, idM);
  }

  static getDetailsMAc(BuildContext context, int idM) async {
//    final dbHelper = IMCDetailsMDatabase.instance;
//    final countDetails = await dbHelper.queryCount('anioAnt', idM);
//    //Clean list:
//    GlobalVariables.monthAct.clear();
//    //add details in list:
//    for(var i = 0; i < countDetails; i++){
//      final detail = await dbHelper.getDetail('mesAct', idM);
//      GlobalVariables.monthAct.add(detail[i]['mesAct']);
//    }
    //finished mes actual - start variación mes anterior
    ImcRBloc.getDetailsVMAn(context, idM);
  }

  static getDetailsVMAn(BuildContext context, int idM) async {
//    final dbHelper = IMCDetailsMDatabase.instance;
//    final countDetails = await dbHelper.queryCount('anioAnt', idM);
//    //Clean list:
//    GlobalVariables.varMonthAn.clear();
//    //add details in list:
//    for(var i = 0; i < countDetails; i++){
//      final detail = await dbHelper.getDetail('varMesAnt', idM);
//      GlobalVariables.varMonthAn.add(detail[i]['varMesAnt']);
//    }
    //finished variación mes anterior - start porcentajeMesAnt
    ImcRBloc.getDetailsPMAn(context, idM);
  }

  static getDetailsPMAn(BuildContext context, int idM) async {
//    final dbHelper = IMCDetailsMDatabase.instance;
//    final countDetails = await dbHelper.queryCount('anioAnt', idM);
//    //Clean list:
//    GlobalVariables.percentM.clear();
//    //add details in list:
//    for(var i = 0; i < countDetails; i++){
//      final detail = await dbHelper.getDetail('porcentajeMesAnt', idM);
//      GlobalVariables.percentM.add(detail[i]['porcentajeMesAnt']);
//    }
    //finished porcentajeMesAnt - start variación año anterior
    ImcRBloc.getDetailsVAA(context, idM);
  }

  static getDetailsVAA(BuildContext context, int idM) async {
//    final dbHelper = IMCDetailsMDatabase.instance;
//    final countDetails = await dbHelper.queryCount('anioAnt', idM);
//    //Clean list:
//    GlobalVariables.varAnioAn.clear();
//    //add details in list:
//    for(var i = 0; i < countDetails; i++){
//      final detail = await dbHelper.getDetail('varAnioAnt', idM);
//      GlobalVariables.varAnioAn.add(detail[i]['varAnioAnt']);
//    }
//    //finished variación año anterior - start porcentajeAnioAnt
    ImcRBloc.getDetailsPAA(context, idM);
  }

  static getDetailsPAA(BuildContext context, int idM) async {
//    final dbHelper = IMCDetailsMDatabase.instance;
//    final countDetails = await dbHelper.queryCount('anioAnt', idM);
//    //Clean list:
//    GlobalVariables.percentA.clear();
//    //add details in list:
//    for(var i = 0; i < countDetails; i++){
//      final detail = await dbHelper.getDetail('porcentajeAnioAnt', idM);
//      GlobalVariables.percentA.add(detail[i]['porcentajeAnioAnt']);
//    }
//    //finished load all details - load extra details(credits)
    ImcRBloc.getDetCredits(context, idM);
    //ImcRBloc.loadAllDetChart(context,idM);
  }

  static getDetCredits(BuildContext context, int idM) async {
//    final dbHelper = IMCDetailsMDatabase.instance;
//    final countDetails = await dbHelper.queryCount('anioAnt', idM);
//    //Clean list:
//    GlobalVariables.credits.clear();
//    //add details in list:
//    for(var i = 0; i < countDetails; i++){
//      final detail = await dbHelper.getDetail('creditos', idM);
//      final detD = detail[i]['creditos'];
//      if(detD == 'N/A'){
//        GlobalVariables.credits.add('0');
//      } else {
//        GlobalVariables.credits.add(detail[i]['creditos']);
//      }
//
//    }
    //finished load all details - load datas Chart IMC
    ImcRBloc.loadAllDetChart(context, idM);
  }
  //---------------------------------------------------------------------

  static loadAllDetChart(BuildContext context, int idM) async {
//    //final dbHelper = IMCDatesDatabase.instance;
//    final countDates = GlobalVariables.listDatesIMC.length;
//
//    //details mes actual:
//    final dbHelperD = IMCDetailsMDatabase.instance;
//    //clean:
//    GlobalVariables.listAllDetChart.clear();
//    //add to list all months
//    for(var i = 0; i < countDates; i++){
//      List<double> aDetail = [];
//      final detail = await dbHelperD.getDetail('mesAct', i);
//      //print(detail);
//      //clean:
//      aDetail.clear();
//      for(var j = 0; j < detail.length; j++){
//        final str = detail[j]['mesAct'];
//        final dbl = double.parse('$str');
//        aDetail.add(dbl);
//      }
//      //print(aDetail);
//      GlobalVariables.listAllDetChart.add(aDetail);//list all month for all dates
//    }

    //finish load all dates for monthAc - start load info chart://Show IMC:
    ImcRBloc.loadInfoChart(context, idM);
  }

  static loadInfoChart(BuildContext context, int idM) async{
//    final date = GlobalVariables.listDatesIMC;
//    final monthAc = GlobalVariables.listAllDetChart;
//
//    final dbHelper = IMCDatesDatabase.instance;
//    final countDates = await dbHelper.queryRowCount();
//    //clean info chart:
//    GlobalVariables.chartData.clear();
//    GlobalVariables.salesData.clear();
//    //print(monthAc);
//    var color1;
//    var color2;
//    var color3;
//    var color4;
//    var color5;
//    var color6;
//    var color7;
//    for(var i = 0; i < countDates; i++){
//      if (i == GlobalVariables.selectBar){
//        //color1 = Color.fromRGBO(128, 222, 234, 0.49);
//        color1 = Color(0xFF9AF8FF);//
//        color2 = Color(0xFFFFEEFF);//
//        color3 = Color(0xFFFFFFEA);//
//        color4 = Color(0xFFFFE7E7);//
//        color5 = Color(0xFFFFEAFF);//
//        color6 = Color(0xFFCEFFD1);//
//        color7 = Color(0xFFC6D3FF);//
//      } else {
//        color1 = Color(0xFF67C5D1);//Color(0xFF80DEEA);
//        color2 = Color(0xFFF8BBD0);
//        color3 = Color(0xFFFFF59D);
//        color4 = Color(0xFFEF9A9A);
//        color5 = Color(0xFFB39DDB);
//        color6 = Color(0xFF81C784);
//        color7 = Color(0xFF7986CB);
//      }
//      //quit day from date:
//      final dateWD = GlobalStyles.formatDateChartIMC(date[i]);//date[i].substring(0,7);
//      //stack bar chart:
//      GlobalVariables.chartData.add(ChartIMCData(dateWD, monthAc[i][0], monthAc[i][1], monthAc[i][2], monthAc[i][3], monthAc[i][4], monthAc[i][5], monthAc[i][6], color1, color2, color3, color4, color5, color6, color7));
//      //stack line chart:
//      GlobalVariables.salesData.add(SalesData(dateWD, monthAc[i][7]));
//    }

    //load tablaResum:
    ImcRBloc.loadProyects(context);

    //Show IMC & Dismiss loadSpinner:
    /*GlobalWidgets.loadingIndicator(context, false);

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ImcRScreen())
    );*/

  }

  static loadFoto(BuildContext context, int idM) async {

    GlobalWidgets.loadingIndicator(context, false);
    final cameras = await availableCameras();

    // Obtén una cámara específica de la lista de cámaras disponibles
    final firstCamera = cameras.first;

    Navigator.pushReplacement(
        context,
        PageRouteBuilder(pageBuilder: (context, anim1, anim2) => TakePictureScreen(
          // Pasa la cámara correcta al widget de TakePictureScreen
          camera: firstCamera,
        ),
          transitionsBuilder: (context, anim1, anim2, child) => Container(child: child),//(context, anim1, anim2, child) => FadeTransition(opacity: anim1, child: child),
          transitionDuration: Duration(seconds: 1),
        )
    );
//    Navigator.pushReplacement(
//        context,
//        PageRouteBuilder(pageBuilder: (context, anim1, anim2) => PhotoPreviewScreen(),
//          transitionsBuilder: (context, anim1, anim2, child) => Container(child: child),//(context, anim1, anim2, child) => FadeTransition(opacity: anim1, child: child),
//          transitionDuration: Duration(seconds: 1),
//        )
//    );

  }

  static closeSesion(BuildContext context) async{
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(pageBuilder: (context, anim1, anim2) => LoginScreen(),
          transitionsBuilder: (context, anim1, anim2, child) => Container(child: child),//(context, anim1, anim2, child) => FadeTransition(opacity: anim1, child: child),
          transitionDuration: Duration(seconds: 1),
        )
    );

  }
  static UpdatePassLoginn(BuildContext context) async{
    GlobalWidgets.loadingIndicator(context, false);
    ImcRBloc.laoding(context, false);
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(pageBuilder: (context, anim1, anim2) => LoginUpdatePassScreen(),
          transitionsBuilder: (context, anim1, anim2, child) => Container(child: child),//(context, anim1, anim2, child) => FadeTransition(opacity: anim1, child: child),
          transitionDuration: Duration(seconds: 1),
        )
    );

  }
  //----------------------reloads:-----------------------------
  static reloadInfoTable(BuildContext context, int idM) async {
    //show spinner:
    GlobalWidgets.loadingIndicator(context, false);
    //add text date:
    GlobalVariables.dateIMC = GlobalVariables.listDatesIMC[idM];

    //load bar select:
    ImcRBloc.getDetailsCn(context, idM);
  }

  static loadInventarioAdd(BuildContext context) async {

    GlobalWidgets.loadingIndicator(context, false);

    Navigator.pushReplacement(
        context,
        PageRouteBuilder(pageBuilder: (context, anim1, anim2) => InventarioAddScreen(),
          transitionsBuilder: (context, anim1, anim2, child) => Container(child: child),//(context, anim1, anim2, child) => FadeTransition(opacity: anim1, child: child),
          transitionDuration: Duration(seconds: 1),
        )
    );

  }
  static loadProyects(BuildContext context) async {

    GlobalWidgets.loadingIndicator(context, false);

    Navigator.pushReplacement(
        context,
        PageRouteBuilder(pageBuilder: (context, anim1, anim2) => InventarioScreen(),
          transitionsBuilder: (context, anim1, anim2, child) => Container(child: child),//(context, anim1, anim2, child) => FadeTransition(opacity: anim1, child: child),
          transitionDuration: Duration(seconds: 1),
        )
    );

  }

  static laoding(BuildContext context, bool bandera) async {

    GlobalWidgets.loadingIndicator(context, bandera);



  }

}