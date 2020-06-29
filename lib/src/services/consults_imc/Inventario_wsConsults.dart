import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:isae/src/blocs/IMC/imcR_bloc.dart';
import 'package:isae/src/blocs/login_bloc.dart';
import 'package:isae/src/complements/globalVariables.dart';
import 'package:isae/src/complements/globalWidgets.dart';
import 'package:isae/src/database/IMC/imcDates_database.dart';
import 'package:isae/src/database/IMC/imcDetailsM_database.dart';
import 'package:isae/src/models/Auxiliar.dart';
import 'package:isae/src/models/IMC/imcDates_model.dart';
import 'package:isae/src/models/Inventario.dart';
import 'package:isae/src/models/InventarioAgrupado.dart';
import 'package:isae/src/models/InventarioDetalleAgrupado.dart';
import 'package:isae/src/models/Proyects.dart';
import 'package:isae/src/models/user.dart';


Future<http.Response> loginUser (BuildContext context, String api, String user, String pass) async {
  print(api +' usuario ' + user + ' pass  ' +pass);
  GlobalVariables.valideUserLogin = false;
  Map data = {
    'usuario': user,
    'password': pass
  };
  //encode Map to JSON
  var body = json.encode(data);

  var response = await http.post(api,
      headers: {"Content-Type": "application/json"},
      body: body
  );

  print("${response.statusCode}");

  if (response.statusCode < 200 || response.statusCode > 400 || json == null) {
    print('Error WS');
    GlobalVariables.valideUserLogin = false;
    final error = response.statusCode;
print('Error $error: conexión - service');
    ImcRBloc.laoding(context,false);
    showDialog(context: context, builder: (context) => ShowMessage('Servicio no disponible'));


    throw new Exception("Error while fetching data");
  } else {
    var jsonList = json.decode(response.body) as List;
    var countR = jsonList.toList().length;


    User user = null;
    print(countR);
    for(var index = 0; index < countR; index++){
      user = new  User(
          jsonList[index]['usuarioId'],
          jsonList[index]['nombreCompleto'].toString(),
        jsonList[index]['correo'].toString(),
        jsonList[index]['telefono'].toString(),
        jsonList[index]['cp'].toString(),
        jsonList[index]['ubicacion'].toString(),
        jsonList[index]['perfilId'].toString(),
        jsonList[index]['jefeId'].toString(),
        jsonList[index]['usuario'].toString(),
        jsonList[index]['password'].toString()



      );

      //print(index)
    }


    GlobalVariables.user = user;

      if (user != null) {
        if (GlobalVariables.user.userInfo == GlobalVariables.textNEmp.text) {
          print("${response.body}");
          print('user base::: ' + user.userInfo);
          print("USUARIO CORRECTO::");
          GlobalVariables.valideUserLogin = true;
          if (GlobalVariables.valideUserLogin) {

              LoginBloc.addUserData();

            ImcRBloc.getProyects(context, 1);
          }
        }
      } else {
        ImcRBloc.laoding(context, false);
        showDialog(context: context,
            builder: (context) =>
                ShowMessage('Usuario o Contraseña Incorrecta'));
      }

    return response;
  }
}
Future<http.Response> loginValidateUser (BuildContext context, String api, String user, String pass) async {
  print(api +' usuario updaye ' + user);
  GlobalVariables.valideUpdateUserLogin = false;
  Map data = {
    'usuario': user,
    'password': pass
  };
  //encode Map to JSON
  var body = json.encode(data);

  var response = await http.post(api,
      headers: {"Content-Type": "application/json"},
      body: body
  );

  print("${response.statusCode}");

  if (response.statusCode < 200 || response.statusCode > 400 || json == null) {
    print('Error WS');
    GlobalVariables.valideUserLogin = false;
    final error = response.statusCode;
    print('Error $error: conexión - service');
    ImcRBloc.laoding(context,false);
    showDialog(context: context, builder: (context) => ShowMessage('Servicio no disponible'));


    throw new Exception("Error while fetching data");
  } else {
    var jsonList = json.decode(response.body) as List;
    var countR = jsonList.toList().length;


    User user = null;
    print(countR);
    for(var index = 0; index < countR; index++){
      user = new  User(
          jsonList[index]['usuarioId'],
          jsonList[index]['nombreCompleto'].toString(),
          jsonList[index]['correo'].toString(),
          jsonList[index]['telefono'].toString(),
          jsonList[index]['cp'].toString(),
          jsonList[index]['ubicacion'].toString(),
          jsonList[index]['perfilId'].toString(),
          jsonList[index]['jefeId'].toString(),
          jsonList[index]['usuario'].toString(),
          jsonList[index]['password'].toString()



      );

      //print(index)
    }


    GlobalVariables.user = user;

      if (user != null) {
        if (GlobalVariables.user.userInfo == GlobalVariables.textNEmp.text) {
          print("${response.body}");
          print('user para actualizar::: ' + user.userInfo);

          GlobalVariables.valideUpdateUserLogin = true;
          if (GlobalVariables.valideUpdateUserLogin) {
            ImcRBloc.UpdatePassLoginn(context);
          }
        }
      } else {
        ImcRBloc.laoding(context, false);
        showDialog(context: context,
            builder: (context) =>
                ShowMessage('Usuario no encontrado!'));
      }

    return response;
  }
}
Future<http.Response> getProyect (BuildContext context, String api, int opcion) async {

  var response = await http.get(api);

  if(response.statusCode < 200 || response.statusCode > 400 || json == null){

    print('Error WS');
    final error = response.statusCode;
    showDialog(context: context, builder: (context) => AlertDialog(title: Text('Error'), content: Text('Error $error: conexión - service')));

  } else {
    GlobalVariables.listProyects.clear();
    var jsonList = json.decode(response.body) as List;
    var countR = jsonList.toList().length;

   List<Proyects> listProyects = new List<Proyects>();
    Proyects proyects = null;

 for(var index = 0; index < countR; index++){
    proyects = new  Proyects(
        jsonList[index]['id'],
        jsonList[index]['descripcion'].toString());
     listProyects.add(proyects);
        //print(index)
    }
    print('Lista WS Proyectos::: '+ listProyects.length.toString());
    GlobalVariables.listProyects = listProyects;
    print('Lista Variable Lista nueva:::: '+  GlobalVariables.listProyects.length.toString());
    print('Carga completa WEB SERVICES PROYECTOS');

    if(opcion==1){
      ImcRBloc.loadFoto(context,1);
    }else if(opcion==2){
      ImcRBloc.loadInventarioAdd(context);
    }else{
      ImcRBloc.loadProyects(context);
    }

    return response;

  }
  
}

Future<http.Response> getInvent (BuildContext context, String api) async {

  var response = await http.get(api);
print(api);
  if(response.statusCode < 200 || response.statusCode > 400 || json == null){

    print('Error WS');
    final error = response.statusCode;
    showDialog(context: context, builder: (context) => AlertDialog(title: Text('Error'), content: Text('Error $error: conexión - service')));

  } else {

    var jsonList = json.decode(response.body) as List;
    var countR = jsonList.toList().length;

    List<Inventario> listInventario = new List<Inventario>();
    Inventario inventario = null;
    print(countR);
    for(var index = 0; index < countR; index++){
      inventario = new  Inventario(
          jsonList[index]['inventarioid'],
          jsonList[index]['folio'].toString());
      listInventario.add(inventario);
      //print(index)
    }
    GlobalVariables.listIventario.clear();
    print('Lista WS Iventario::: '+ listInventario.toString());
    GlobalVariables.listIventario = listInventario;
    print('Lista Variable Lista nueva:::: '+  GlobalVariables.listIventario.length.toString());
    print('Carga completa WEB SERVICES INVENTARIOS');


    return response;

  }

}

Future<http.Response> getInventarioAgrupado (BuildContext context, String api, String date, String nEmploye) async {

  var response = await http.get(api);
  print(api);
  if(response.statusCode < 200 || response.statusCode > 400 || json == null){

    print('Error WS');
    final error = response.statusCode;
    showDialog(context: context, builder: (context) => AlertDialog(title: Text('Error'), content: Text('Error $error: conexión - service')));

  } else {

    var jsonList = json.decode(response.body) as List;
    var countR = jsonList.toList().length;

    List<InventarioAgrupado> listAgrupado = new List<InventarioAgrupado>();
    InventarioAgrupado agrupados = null;

    for(var index = 0; index < countR; index++){
      agrupados = new  InventarioAgrupado(
          jsonList[index]['idAgrup'],
          jsonList[index]['campo'].toString());
      listAgrupado.add(agrupados);
      //print(index)
    }
    print('Lista WS Proyectos::: '+ listAgrupado.length.toString());
    GlobalVariables.listAgrupado = listAgrupado;
    print('Lista Variable Lista nueva:::: '+  GlobalVariables.listAgrupado.length.toString());
    print('Carga completa WEB SERVICES PROYECTOS');

   // ImcRBloc.loadInfoTableR(context,1);
    return response;

  }

}

Future<http.Response> getInventarioDetalleAgrupado (BuildContext context, String api) async {

  var response = await http.get(api);
  print(api);
  if(response.statusCode < 200 || response.statusCode > 400 || json == null){

    print('Error WS');
    final error = response.statusCode;
    showDialog(context: context, builder: (context) => AlertDialog(title: Text('Error'), content: Text('Error $error: conexión - service')));

  } else {

    var jsonList = json.decode(response.body) as List;
    var countR = jsonList.toList().length;

    List<InventarioDetalleAgrupado> listDetalleAgrupado = new List<InventarioDetalleAgrupado>();
    InventarioDetalleAgrupado detalleAgrupado = null;
    print(countR);
    for(var index = 0; index < countR; index++){
      detalleAgrupado = new  InventarioDetalleAgrupado(
          jsonList[index]['enApp'],
          jsonList[index]['campoNombre'].toString(),
          jsonList[index]['campoValor'].toString(),
          jsonList[index]['tipoCampo'].toString(),
          jsonList[index]['campo'].toString()
      );
      listDetalleAgrupado.add(detalleAgrupado);
      //print(index)
    }
    GlobalVariables.listDetalleAgrupado.clear();
    print('Lista WS Iventario::: '+ listDetalleAgrupado.toString());
    GlobalVariables.listDetalleAgrupado = listDetalleAgrupado;
    print('Lista Variable Lista nueva:::: '+  GlobalVariables.listDetalleAgrupado.length.toString());
    print('Carga completa WEB SERVICES INVENTARIOS');


    return response;

  }

}

Future<http.Response> updateInvent (BuildContext context, String api, String campo, String valor) async {
  print(api);

  Map data = {
    'campoNombre': campo,
    'campoValor': valor
  };
  //encode Map to JSON
  var body = json.encode(data);

  var response = await http.put(api,
      headers: {"Content-Type": "application/json"},
      body: body
  );

  print("${response.statusCode}");

  if (response.statusCode < 200 || response.statusCode > 400 || json == null) {
    print('Error WS');
    final error = response.statusCode;
    showDialog(context: context,
        builder: (context) =>
            AlertDialog(title: Text('Error'),
                content: Text('Error $error: conexión - service')));

    throw new Exception("Error while fetching data");
  } else {
    print("${response.body}");

    return response;
  }
}

Future<http.Response> updateUser (BuildContext context, String api, String newPass) async {
  print(api);
if(GlobalVariables.textPassNew.text == GlobalVariables.textPassConfir.text) {
  Map data = {
    'password': newPass
  };
  //encode Map to JSON
  var body = json.encode(data);

  var response = await http.put(api,
      headers: {"Content-Type": "application/json"},
      body: body
  );

  print("${response.statusCode}");

  if (response.statusCode < 200 || response.statusCode > 400 || json == null) {
    print('Error WS');
    final error = response.statusCode;
    showDialog(context: context,
        builder: (context) =>
            AlertDialog(title: Text('Error'),
                content: Text('Error $error: conexión - service')));

    throw new Exception("Error while fetching data");
  } else {
    ImcRBloc.laoding(context, false);
    print("${response.body}");
    ImcRBloc.closeSesion(context);
    showDialog(context: context,
        builder: (context) =>
            ShowMessageSave('Contraseñe se actualizo correctamente!'));
    return response;
  }
}else{
  ImcRBloc.laoding(context, false);
  ImcRBloc.UpdatePassLoginn(context);
  showDialog(context: context,
      builder: (context) =>
          ShowMessage('La contraseña no coincide!'));
  ImcRBloc.laoding(context, false);
}
}

Future<http.Response> getCatalogosAdd (BuildContext context, String api, int id) async {

  var response = await http.get(api);
  print(api);
  if(response.statusCode < 200 || response.statusCode > 400 || json == null){

    print('Error WS');
    final error = response.statusCode;
    showDialog(context: context, builder: (context) => AlertDialog(title: Text('Error'), content: Text('Error $error: conexión - service')));

  } else {

    var jsonList = json.decode(response.body) as List;
    var countR = jsonList.toList().length;

    List<Auxiliar> listCatalogos = new List<Auxiliar>();
    Auxiliar catalogos = null;

    for(var index = 0; index < countR; index++){
      catalogos = new  Auxiliar(
          jsonList[index]['id'],
          jsonList[index]['descripcion'].toString());
      listCatalogos.add(catalogos);
      //print(index)
    }

    switch(id) {
      case 1: {
        GlobalVariables.listCatalogos1 = listCatalogos;
      }
      break;
      case 2: {
        GlobalVariables.listCatalogos2 = listCatalogos;
      }
      break;
      case 3: {
        GlobalVariables.listCatalogos3 = listCatalogos;
      }
      break;
      case 4: {

      }
      break;
      case 5: {
        GlobalVariables.listCatalogos5 = listCatalogos;
      }
      break;
      case 6: {
        GlobalVariables.listCatalogos6 = listCatalogos;
      }
      break;
      case 7: {
        GlobalVariables.listCatalogos7 = listCatalogos;
      }
      break;
      case 8: {
        print('Lista WS Proyectos::: '+ GlobalVariables.listCatalogos8.length.toString());

        GlobalVariables.listCatalogos8 = listCatalogos;
      }
      break;
      case 9: {
        GlobalVariables.listCatalogos9 = listCatalogos;
      }
      break;
      case 10: {
        GlobalVariables.listCatalogos10 = listCatalogos;
      }
      break;
      case 11: {
        GlobalVariables.listCatalogos11 = listCatalogos;
      }
      break;
      case 12: {
        GlobalVariables.listCatalogos12 = listCatalogos;
      }
      break;
      case 13: {
        GlobalVariables.listCatalogos13 = listCatalogos;
      }
      break;
      case 14: {
        GlobalVariables.listCatalogos13 = listCatalogos;
      }
      break;
      case 15: {
        GlobalVariables.listCatalogos15 = listCatalogos;
      }
      break;
      case 16: {
        GlobalVariables.listCatalogos16 = listCatalogos;
      }
      break;
      case 17: {
        GlobalVariables.listCatalogos17 = listCatalogos;
      }
      break;
      case 18: {
        GlobalVariables.listCatalogos18 = listCatalogos;
      }
      break;
      case 19: {
        GlobalVariables.listCatalogos19 = listCatalogos;
      }
      break;
      case 20: {
        GlobalVariables.listCatalogos20 = listCatalogos;
      }
      break;
      case 21: {
        GlobalVariables.listCatalogos21 = listCatalogos;
      }
      break;
      case 22: {
        GlobalVariables.listCatalogos22 = listCatalogos;
      }
      break;
      case 23: {
        GlobalVariables.listCatalogos23 = listCatalogos;
      }
      break;
      case 24: {
        GlobalVariables.listCatalogos24 = listCatalogos;
      }
      break;
      case 25: {
        GlobalVariables.listCatalogos25 = listCatalogos;
      }
      break;
      case 26: {
        GlobalVariables.listCatalogos26 = listCatalogos;
      }
      break;
      case 27: {
        GlobalVariables.listCatalogos27 = listCatalogos;
      }
      break;
      case 28: {
        GlobalVariables.listCatalogos28 = listCatalogos;
      }
      break;

      default: {
        //statements;
      }
      break;
    }






    print('Carga completa CATLOGOS');

    // ImcRBloc.loadInfoTableR(context,1);
    return response;

  }

}

Future<http.Response> insertInvent (BuildContext context, String api) async {
  print(api);

  Map data = {
    'inventarioid':0,
    'proyectoid':  GlobalVariables.idProyect == null ? 0 : GlobalVariables.idProyect,
    'proyecto':   GlobalVariables.nameProyectFile == '' ? null : GlobalVariables.nameProyectFile,
    'proyectodescripcion':   GlobalVariables.nameProyectFile == '' ? null : GlobalVariables.nameProyectFile,
    'fcreacon': GlobalVariables.controllerFCREACON.text == '' ? null : GlobalVariables.controllerFCREACON.text,
    'fcreaconfiles':null,
    'fmodificafiles':null,
    'folio': GlobalVariables.controllerFOLIO.text == '' ? null : GlobalVariables.controllerFOLIO.text,
    'id':GlobalVariables.controllerID.text== '' ? 0 : GlobalVariables.controllerID.text,
    'apellidos': GlobalVariables.controllerAPELLIDOS.text == '' ? null : GlobalVariables.controllerAPELLIDOS.text + ' ' + GlobalVariables.controllerAPELLIDOS2.text,
    'nombres':  GlobalVariables.controllerNOMBRES.text == '' ? null : GlobalVariables.controllerNOMBRES.text,
    'nombrecompleto': GlobalVariables.controllerNOMBRES.text == '' ? null : GlobalVariables.controllerNOMBRES.text + ' ' + GlobalVariables.controllerAPELLIDOS.text + ' ' + GlobalVariables.controllerAPELLIDOS2.text,
    'numempleado': GlobalVariables.controllerNUMEMPLEADO.text== '' ? 0 : GlobalVariables.controllerNUMEMPLEADO.text,
    'vip': GlobalVariables.selectedItemCatVIP == null ? null : GlobalVariables.selectedItemCatVIP.descripcion,
    'puesto': GlobalVariables.controllerPUESTO.text == '' ? null : GlobalVariables.controllerPUESTO.text,
    'direccion': GlobalVariables.controllerDIRECCION.text == '' ? null : GlobalVariables.controllerDIRECCION.text,
    'subdireccion': GlobalVariables.controllerSUBDIRECCION.text == '' ? null : GlobalVariables.controllerSUBDIRECCION.text,
    'clavesubdireccion': GlobalVariables.controllerCLAVESUBDIRECCION.text== '' ? 0 :  GlobalVariables.controllerCLAVESUBDIRECCION.text,
    'gerencia': GlobalVariables.controllerGERENCIA.text == '' ? null : GlobalVariables.controllerGERENCIA.text,
    'clavegerencia': GlobalVariables.controllerCLAVEGERENCIA.text== '' ? 0 : GlobalVariables.controllerCLAVEGERENCIA.text,
    'depto': GlobalVariables.controllerDEPTO.text == '' ? null : GlobalVariables.controllerDEPTO.text,
    'clavecentrotrabajo': GlobalVariables.controllerCLAVECENTROTRABAJO.text== '' ? 0 : GlobalVariables.controllerCLAVECENTROTRABAJO.text,
    'correo': GlobalVariables.controllerCORREO.text == '' ? null : GlobalVariables.controllerCORREO.text,
    'telefono': GlobalVariables.controllerTELEFONO.text== '' ? 0 : GlobalVariables.controllerTELEFONO.text,
    'ext': GlobalVariables.controllerEXT.text== '' ? 0 : GlobalVariables.controllerEXT.text,
    'ubicacion': GlobalVariables.controllerUBICACION.text == '' ? null :GlobalVariables.controllerUBICACION,
    'colonia': GlobalVariables.controllerCOLONIA.text == '' ? null :GlobalVariables.controllerCOLONIA.text,
    'cp': GlobalVariables.controllerCP.text== '' ? 0 : GlobalVariables.controllerCP.text,
    'estado':GlobalVariables.controllerESTADO.text == '' ? null :GlobalVariables.controllerESTADO.text,
    'ubicacioncompleta':GlobalVariables.controllerUBICACIONCOMPLETA.text == '' ? null : GlobalVariables.controllerUBICACIONCOMPLETA.text,
    'zona': GlobalVariables.controllerZONA.text == '' ? null : GlobalVariables.controllerZONA.text,
    'localidad': GlobalVariables.controllerLOCALIDAD.text == '' ? null :GlobalVariables.controllerLOCALIDAD.text,
    'edificio': GlobalVariables.controllerEDIFICIO.text == '' ? null :GlobalVariables.controllerEDIFICIO.text,
    'piso': GlobalVariables.selectedItemCatPISO == null ? null : GlobalVariables.selectedItemCatPISO.descripcion,
    'area': GlobalVariables.controllerAREA.text == '' ? null : GlobalVariables.controllerAREA.text,
    'adscripcion':  GlobalVariables.controllerADSCRIPCION.text == '' ? null : GlobalVariables.controllerADSCRIPCION.text,
    'apellidosjefe':  GlobalVariables.controllerAPELLIDOSJEFE.text == '' ? null : GlobalVariables.controllerAPELLIDOSJEFE.text,
    'nombresjefe':  GlobalVariables.controllerNOMBRESJEFE.text == '' ? null : GlobalVariables.controllerNOMBRESJEFE.text ,
    'nombrecompletojefe':  GlobalVariables.controllerNOMBRESJEFE.text == '' ? null : GlobalVariables.controllerAPELLIDOSJEFE.text + ' ' +  GlobalVariables.controllerNOMBRESJEFE.text,
    'fichajefe':  GlobalVariables.controllerFICHAJEFE.text== '' ? 0 : GlobalVariables.controllerFICHAJEFE.text,
    'extjefe': GlobalVariables.controllerEXTJEFE.text== '' ? 0 : GlobalVariables.controllerEXTJEFE.text,
    'ubicacionjefe': GlobalVariables.controllerUBICACIONJEFE.text == '' ? null : GlobalVariables.controllerUBICACIONJEFE.text,
    'nombrejefeinmediato': GlobalVariables.controllerNOMBREJEFEINMEDIATO.text == '' ? null :GlobalVariables.controllerNOMBREJEFEINMEDIATO.text,
    'apellidosresguardo': GlobalVariables.controllerAPELLIDOSRESGUARDO.text == '' ? null : GlobalVariables.controllerAPELLIDOSRESGUARDO.text,
    'nombresresguardo': GlobalVariables.controllerNOMBRESRESGUARDO.text == '' ? null : GlobalVariables.controllerNOMBRESRESGUARDO.text,
    'nombrecompletoresguardo': GlobalVariables.controllerNOMBRESRESGUARDO.text == '' ? null : GlobalVariables.controllerAPELLIDOSRESGUARDO.text + ' ' + GlobalVariables.controllerNOMBRESRESGUARDO.text,
    'adscripcionresguardo': GlobalVariables.controllerADSCRIPCIONRESGUARDO.text == '' ? null : GlobalVariables.controllerADSCRIPCIONRESGUARDO.text,
    'extresguardo': GlobalVariables.controllerEXTRESGUARDO.text== '' ? 0 : GlobalVariables.controllerEXTRESGUARDO.text,
    'apellidosresponsable': GlobalVariables.controllerAPELLIDOSRESPONSABLE.text == '' ? null : GlobalVariables.controllerAPELLIDOSRESPONSABLE.text,
    'nombresresponsable': GlobalVariables.controllerNOMBRESRESPONSABLE.text == '' ? null : GlobalVariables.controllerNOMBRESRESPONSABLE.text,
    'nombrecompletoresponsable': GlobalVariables.controllerNOMBRESRESPONSABLE.text == '' ? null : GlobalVariables.controllerAPELLIDOSRESPONSABLE.text + ' ' + GlobalVariables.controllerNOMBRESRESPONSABLE.text,
    'apellidospemex': GlobalVariables.controllerAPELLIDOSPEMEX.text == '' ? null : GlobalVariables.controllerAPELLIDOSPEMEX.text,
    'nombrespemex': GlobalVariables.controllerNOMBRESPEMEX.text == '' ? null : GlobalVariables.controllerNOMBRESPEMEX.text,
    'nombrecompletopemex': GlobalVariables.controllerNOMBRESPEMEX.text == '' ? null : GlobalVariables.controllerAPELLIDOSPEMEX.text + ' ' +GlobalVariables.controllerNOMBRESPEMEX.text,
    'tipoequipo': GlobalVariables.selectedItemCatTIPOEQUIPO == null ? null :GlobalVariables.selectedItemCatTIPOEQUIPO.descripcion,
    'equipo': GlobalVariables.selectedItemCatEQUIPO == null ? null : GlobalVariables.selectedItemCatEQUIPO.descripcion,
    'marcaequipo': GlobalVariables.selectedItemCatMARCAEQUIPO == null ? null : GlobalVariables.selectedItemCatMARCAEQUIPO.descripcion,
    'modeloequipo': GlobalVariables.selectedItemCatMODELOEQUIPO == null ? null : GlobalVariables.selectedItemCatMODELOEQUIPO.descripcion ,
    'numserieequipo': GlobalVariables.controllerNUMSERIEEQUIPO.text == '' ? null : GlobalVariables.controllerNUMSERIEEQUIPO.text,
    'equipocompleto': GlobalVariables.selectedItemCatMARCAEQUIPO == null ? null : GlobalVariables.selectedItemCatMARCAEQUIPO.descripcion + ' '+GlobalVariables.selectedItemCatMODELOEQUIPO.descripcion + ' ' +GlobalVariables.controllerNUMSERIEEQUIPO.text,
    'monitor': GlobalVariables.selectedItemCatMONITOR == null ? null : GlobalVariables.selectedItemCatMONITOR.descripcion,
    'marcamonitor': GlobalVariables.selectedItemCatMARCAMONITOR == null ? null : GlobalVariables.selectedItemCatMARCAMONITOR.descripcion,
    'modelomonitor': GlobalVariables.selectedItemCatMODELOMONITOR == null ? null : GlobalVariables.selectedItemCatMODELOMONITOR.descripcion,
    'numseriemonitor': GlobalVariables.controllerNUMSERIEMONITOR.text == '' ? null : GlobalVariables.controllerNUMSERIEMONITOR.text,
    'monitorcompleto': GlobalVariables.selectedItemCatMARCAMONITOR == null ? null : GlobalVariables.selectedItemCatMARCAMONITOR.descripcion + ' ' + GlobalVariables.selectedItemCatMODELOMONITOR.descripcion + ' ' + GlobalVariables.controllerNUMSERIEMONITOR.text,
    'teclado':  GlobalVariables.selectedItemCatTECLADO == null ? null : GlobalVariables.selectedItemCatTECLADO.descripcion,
    'marcateclado': GlobalVariables.selectedItemCatMARCATECLADO == null ? null : GlobalVariables.selectedItemCatMARCATECLADO.descripcion,
    'modeloteclado': GlobalVariables.selectedItemCatMODELOTECLADO == null ? null :GlobalVariables.selectedItemCatMODELOTECLADO.descripcion,
    'numserieteclado': GlobalVariables.controllerNUMSERIETECLADO.text == '' ? null : GlobalVariables.controllerNUMSERIETECLADO.text,
    'tecladocompleto': GlobalVariables.selectedItemCatMARCATECLADO == null ? null : GlobalVariables.selectedItemCatMARCATECLADO.descripcion +' '+GlobalVariables.selectedItemCatMODELOTECLADO.descripcion + '' +GlobalVariables.controllerNUMSERIETECLADO.text,
    'mouse': GlobalVariables.selectedItemCatMOUSE == null ? null : GlobalVariables.selectedItemCatMOUSE.descripcion,
    'marcamouse':GlobalVariables.selectedItemCatMARCAMOUSE == null ? null : GlobalVariables.selectedItemCatMARCAMOUSE.descripcion,
    'modelomause':GlobalVariables.selectedItemCatMODELOMAUSE == null ? null : GlobalVariables.selectedItemCatMODELOMAUSE.descripcion,
    'numseriemouse': GlobalVariables.controllerNUMSERIEMOUSE.text == '' ? null : GlobalVariables.controllerNUMSERIEMOUSE.text,
    'mousecompleto': GlobalVariables.selectedItemCatMARCAMOUSE == null ? null : GlobalVariables.selectedItemCatMARCAMOUSE.descripcion + ' '+ GlobalVariables.selectedItemCatMODELOMAUSE.descripcion + ' ' + GlobalVariables.controllerNUMSERIEMOUSE.text,
    'ups': GlobalVariables.selectedItemCatUPS == null ? null : GlobalVariables.selectedItemCatUPS.descripcion,
    'marcaups': GlobalVariables.selectedItemCatMARCAUPS == null ? null : GlobalVariables.selectedItemCatMARCAUPS.descripcion,
    'modeloups': GlobalVariables.selectedItemCatMODELOUPS == null ? null : GlobalVariables.selectedItemCatMODELOUPS.descripcion,
    'numserieups': GlobalVariables.controllerNUMSERIEUPS.text == '' ? null : GlobalVariables.controllerNUMSERIEUPS.text,
    'upscompleto': GlobalVariables.selectedItemCatMARCAUPS == null ? null : GlobalVariables.selectedItemCatMARCAUPS.descripcion + ' ' +GlobalVariables.selectedItemCatMODELOUPS.descripcion + ' ' +GlobalVariables.controllerNUMSERIEUPS.text,
    'maletin': GlobalVariables.selectedItemCatMALETIN == null ? null : GlobalVariables.selectedItemCatMALETIN.descripcion,
    'marcamaletin': GlobalVariables.selectedItemCatMARCAMALETIN == null ? null : GlobalVariables.selectedItemCatMARCAMALETIN.descripcion,
    'modelomaletin': GlobalVariables.selectedItemCatMODELOMALETIN == null ? null : GlobalVariables.selectedItemCatMODELOMALETIN.descripcion,
    'numseriemaletin': GlobalVariables.controllerNUMSERIEMALETIN.text == '' ? null : GlobalVariables.controllerNUMSERIEMALETIN.text,
    'maletincomleto': GlobalVariables.selectedItemCatMARCAMALETIN == null ? null : GlobalVariables.selectedItemCatMARCAMALETIN.descripcion + ' '+ GlobalVariables.selectedItemCatMODELOMALETIN.descripcion + ' '+GlobalVariables.controllerNUMSERIEMALETIN.text,
    'candado': GlobalVariables.selectedItemCatCANDADO == null ? null : GlobalVariables.selectedItemCatCANDADO.descripcion,
    'marcacandado': GlobalVariables.selectedItemCatMARCACANDADO == null ? null : GlobalVariables.selectedItemCatMARCACANDADO.descripcion,
    'modelocandado':GlobalVariables.selectedItemCatMODELOCANDADO == null ? null : GlobalVariables.selectedItemCatMODELOCANDADO.descripcion,
    'numseriecandado':GlobalVariables.controllerNUMSERIECANDADO.text == '' ? null : GlobalVariables.controllerNUMSERIECANDADO.text,
    'candadocompleto': GlobalVariables.selectedItemCatMARCACANDADO == null ? null : GlobalVariables.selectedItemCatMARCACANDADO.descripcion + ' '+ GlobalVariables.selectedItemCatMODELOCANDADO.descripcion + ' '+GlobalVariables.controllerNUMSERIECANDADO.text,
    'bocinas':GlobalVariables.selectedItemCatBOCINAS == null ? null : GlobalVariables.selectedItemCatBOCINAS.descripcion,
    'marcabocinas':GlobalVariables.selectedItemCatMARCABOCINAS == null ? null : GlobalVariables.selectedItemCatMARCABOCINAS.descripcion,
    'modelobocinas':GlobalVariables.selectedItemCatMODELOBOCINAS == null ? null : GlobalVariables.selectedItemCatMODELOBOCINAS.descripcion,
    'numseriebocinas':GlobalVariables.controllerNUMSERIEBOCINAS.text == '' ? null :GlobalVariables.controllerNUMSERIEBOCINAS.text,
    'bocinascompleto':GlobalVariables.selectedItemCatMARCABOCINAS == null ? null : GlobalVariables.selectedItemCatMARCABOCINAS.descripcion + ' '+ GlobalVariables.selectedItemCatMODELOBOCINAS.descripcion + ' '+GlobalVariables.controllerNUMSERIEBOCINAS.text,
    'camara': GlobalVariables.selectedItemCatCAMARA == null ? null : GlobalVariables.selectedItemCatCAMARA.descripcion,
    'marcacamara': GlobalVariables.selectedItemCatMARCACAMARA == null ? null : GlobalVariables.selectedItemCatMARCACAMARA.descripcion,
    'modelocamara': GlobalVariables.selectedItemCatMODELOCAMARA == null ? null : GlobalVariables.selectedItemCatMODELOCAMARA.descripcion,
    'numseriecmara':GlobalVariables.controllerNUMSERIECMARA.text == '' ? null : GlobalVariables.controllerNUMSERIECMARA.text,
    'camaracompleto': GlobalVariables.selectedItemCatMARCACAMARA == null ? null : GlobalVariables.selectedItemCatMARCACAMARA.descripcion + ' '+ GlobalVariables.selectedItemCatMODELOCAMARA.descripcion + ' '+GlobalVariables.controllerNUMSERIECMARA.text,
    'monitor2': GlobalVariables.selectedItemCatMONITOR2 == null ? null : GlobalVariables.selectedItemCatMONITOR2.descripcion,
    'marcamonitor2': GlobalVariables.selectedItemCatMARCAMONITOR2 == null ? null : GlobalVariables.selectedItemCatMARCAMONITOR2.descripcion,
    'modelomonitor2':GlobalVariables.selectedItemCatMODELOMONITOR2 == null ? null : GlobalVariables.selectedItemCatMODELOMONITOR2.descripcion,
    'numseriemonitor2': GlobalVariables.controllerNUMSERIEMONITOR2.text == '' ? null : GlobalVariables.controllerNUMSERIEMONITOR2.text,
    'monitor2completo': GlobalVariables.selectedItemCatMARCAMONITOR2 == null ? null : GlobalVariables.selectedItemCatMARCAMONITOR2.descripcion + ' ' +GlobalVariables.selectedItemCatMODELOMONITOR2.descripcion +' ' +GlobalVariables.controllerNUMSERIEMONITOR2.text,
    'accesorio': GlobalVariables.selectedItemCatACCESORIO,
    'marcaaccesorio': GlobalVariables.selectedItemCatMARCAACCESORIO == null ? null : GlobalVariables.selectedItemCatMARCAACCESORIO.descripcion,
    'modeloaccesorio': GlobalVariables.selectedItemCatMODELOACCESORIO == null ? null : GlobalVariables.selectedItemCatMODELOACCESORIO.descripcion,
    'numserieaccesorio': GlobalVariables.controllerNUMSERIEACCESORIO.text == '' ? null : GlobalVariables.controllerNUMSERIEACCESORIO.text,
    'accesoriocompleto': GlobalVariables.selectedItemCatMARCAACCESORIO == null ? null : GlobalVariables.selectedItemCatMARCAACCESORIO.descripcion + ' ' +GlobalVariables.selectedItemCatMODELOACCESORIO.descripcion + ' ' + GlobalVariables.controllerNUMSERIEACCESORIO.text,
    'ram': GlobalVariables.selectedItemCatRAM == null ? null : GlobalVariables.selectedItemCatRAM.descripcion,
    'discoduro': GlobalVariables.selectedItemCatDISCODURO == null ? null : GlobalVariables.selectedItemCatDISCODURO.descripcion,
    'procesador': GlobalVariables.controllerPROCESADOR.text == '' ? null : GlobalVariables.controllerPROCESADOR.text,
    'tipoequipocomp1': GlobalVariables.selectedItemCatTIPOEQUIPOCOMP1 == null ? null :  GlobalVariables.selectedItemCatTIPOEQUIPOCOMP1.descripcion,
    'modelocomp1': GlobalVariables.selectedItemCatMODELOCOMP1 == null ? null : GlobalVariables.selectedItemCatMODELOCOMP1.descripcion,
    'numseriecomp1': GlobalVariables.controllerNUMSERIECOMP1.text == '' ? null : GlobalVariables.controllerNUMSERIECOMP1.text,
    'cruceclientecomp1': GlobalVariables.controllerCRUCECLIENTECOMP1.text == '' ? null : GlobalVariables.controllerCRUCECLIENTECOMP1.text,
    'tipoequipocomp2': GlobalVariables.selectedItemCatTIPOEQUIPOCOMP2 == null ? null : GlobalVariables.selectedItemCatTIPOEQUIPOCOMP2.descripcion,
    'modelocomp2': GlobalVariables.selectedItemCatMODELOCOMP2 == null ? null : GlobalVariables.selectedItemCatMODELOCOMP2.descripcion,
    'numseriecomp2':GlobalVariables.controllerNUMSERIECOMP2.text == '' ? null : GlobalVariables.controllerNUMSERIECOMP2.text,
    'cruceclientecomp2': GlobalVariables.controllerCRUCECLIENTECOMP2 == null ? null : GlobalVariables.controllerCRUCECLIENTECOMP2.text,
    'tipoequipocomp3':GlobalVariables.selectedItemCatTIPOEQUIPOCOMP3 == null ? null : GlobalVariables.selectedItemCatTIPOEQUIPOCOMP3.descripcion,
    'modelocomp3':GlobalVariables.selectedItemCatMODELOCOMP3 == null ? null : GlobalVariables.selectedItemCatMODELOCOMP3.descripcion,
    'numseriecomp3':GlobalVariables.controllerNUMSERIECOMP3.text == '' ? null : GlobalVariables.controllerNUMSERIECOMP3.text,
    'cruceclientecomp3': GlobalVariables.controllerCRUCECLIENTECOMP3.text == '' ? null : GlobalVariables.controllerCRUCECLIENTECOMP3.text,
    'tipoequipocomp4': GlobalVariables.selectedItemCatTIPOEQUIPOCOMP4 == null ? null :GlobalVariables.selectedItemCatTIPOEQUIPOCOMP4.descripcion,
    'modelocomp4': GlobalVariables.selectedItemCatMODELOCOMP4 == null ? null : GlobalVariables.selectedItemCatMODELOCOMP4.descripcion,
    'numseriecomp4': GlobalVariables.controllerNUMSERIECOMP4.text == '' ? null : GlobalVariables.controllerNUMSERIECOMP4.text,
    'cruceclientecomp4': GlobalVariables.controllerCRUCECLIENTECOMP4.text == '' ? null : GlobalVariables.controllerCRUCECLIENTECOMP4.text,
    'tipoequipocomp5': GlobalVariables.selectedItemCatTIPOEQUIPOCOMP5 == null ? null : GlobalVariables.selectedItemCatTIPOEQUIPOCOMP5.descripcion,
    'modelocomp5': GlobalVariables.selectedItemCatMODELOCOMP5 == null ? null : GlobalVariables.selectedItemCatMODELOCOMP5.descripcion,
    'numseriecomp5': GlobalVariables.controllerNUMSERIECOMP5.text == '' ? null : GlobalVariables.controllerNUMSERIECOMP5.text,
    'cruceclientecomp5': GlobalVariables.controllerCRUCECLIENTECOMP5.text == '' ? null : GlobalVariables.controllerCRUCECLIENTECOMP5.text,
    'tipoequipocomp6': GlobalVariables.selectedItemCatTIPOEQUIPOCOMP6 == null ? null : GlobalVariables.selectedItemCatTIPOEQUIPOCOMP6.descripcion,
    'modelocomp6': GlobalVariables.selectedItemCatMODELOCOMP6 == null ? null : GlobalVariables.selectedItemCatMODELOCOMP6.descripcion,
    'numseriecomp6': GlobalVariables.controllerNUMSERIECOMP6.text == '' ? null : GlobalVariables.controllerNUMSERIECOMP6.text,
    'cruceclientecomp6': GlobalVariables.controllerCRUCECLIENTECOMP6.text == '' ? null : GlobalVariables.controllerCRUCECLIENTECOMP6.text,
    'tipoequipocomp7': GlobalVariables.selectedItemCatTIPOEQUIPOCOMP7== null ? null : GlobalVariables.selectedItemCatTIPOEQUIPOCOMP7.descripcion,
    'modelocomp7': GlobalVariables.selectedItemCatMODELOCOMP7 == null ? null : GlobalVariables.selectedItemCatMODELOCOMP7.descripcion,
    'numseriecomp7': GlobalVariables.controllerNUMSERIECOMP7.text == '' ? null : GlobalVariables.controllerNUMSERIECOMP7.text,
    'cruceclientecomp7': GlobalVariables.controllerCRUCECLIENTECOMP7.text == '' ? null : GlobalVariables.controllerCRUCECLIENTECOMP7.text,
    'validacioncomp1': GlobalVariables.controllerVALIDACIONCOMP1.text == '' ? null : GlobalVariables.controllerVALIDACIONCOMP1.text,
    'validacioncomp2':GlobalVariables.controllerVALIDACIONCOMP2.text == '' ? null : GlobalVariables.controllerVALIDACIONCOMP2.text,
    'validacioncomp3':GlobalVariables.controllerVALIDACIONCOMP3.text == '' ? null : GlobalVariables.controllerVALIDACIONCOMP3.text,
    'validacioncomp4':GlobalVariables.controllerVALIDACIONCOMP4.text == '' ? null : GlobalVariables.controllerVALIDACIONCOMP4.text,
    'validacioncomp5':GlobalVariables.controllerVALIDACIONCOMP5.text == '' ? null : GlobalVariables.controllerVALIDACIONCOMP5.text,
    'validacioncomp6':GlobalVariables.controllerVALIDACIONCOMP6.text == '' ? null : GlobalVariables.controllerVALIDACIONCOMP6.text,
    'validacioncomp7':GlobalVariables.controllerVALIDACIONCOMP7.text == '' ? null : GlobalVariables.controllerVALIDACIONCOMP7.text,
    'validadoscomp': GlobalVariables.controllerVALIDADOSCOMP.text == '' ? 0 : GlobalVariables.controllerVALIDADOSCOMP.text,
    'tecniconombre':GlobalVariables.controllerTECNICONOMBRE.text == '' ? 0 : GlobalVariables.controllerTECNICONOMBRE.text,
    'dia': GlobalVariables.selectedItemCatDIA == null ? null : GlobalVariables.selectedItemCatDIA.descripcion,
    'mes': GlobalVariables.selectedItemCatMES == null ? null : GlobalVariables.selectedItemCatMES.descripcion,
    'anio': GlobalVariables.selectedItemCatANIO == null ? null : GlobalVariables.selectedItemCatANIO.descripcion,
    'reqespecial1': GlobalVariables.controllerREQESPECIAL1.text == '' ? null : GlobalVariables.controllerREQESPECIAL1.text,
    'reqespecial2': GlobalVariables.controllerREQESPECIAL2.text == '' ? null : GlobalVariables.controllerREQESPECIAL2.text,
    'obsinv': GlobalVariables.controllerOBSINV.text == '' ? 0 : GlobalVariables.controllerOBSINV.text,
    'obsresguardo':GlobalVariables.controllerOBSINV.text == '' ? 0 : GlobalVariables.controllerOBSINV.text,
    'obsextras1': GlobalVariables.controllerOBSEXTRAS1.text == '' ? 0 : GlobalVariables.controllerOBSEXTRAS1.text,
    'obsextras2':GlobalVariables.controllerOBSEXTRAS2.text == '' ? 0 : GlobalVariables.controllerOBSEXTRAS2.text,
    'estatus':GlobalVariables.controllerESTATUS.text == '' ? 0 : GlobalVariables.controllerESTATUS.text,
    'fescalacion':GlobalVariables.controllerFESCALACION.text == '' ? 0 : GlobalVariables.controllerFESCALACION.text,
    'comentariosescalacion':GlobalVariables.controllerCOMENTARIOSESCALACION.text == '' ? 0 : GlobalVariables.controllerCOMENTARIOSESCALACION.text,
    'estatusfiles':null,
  };
  //encode Map to JSON
  var body = json.encode(data);

  var response = await http.put(api,
      headers: {"Content-Type": "application/json"},
      body: body
  );

  print("${response.statusCode}");

  if (response.statusCode < 200 || response.statusCode > 400 || json == null) {
    print('Error WS');
    final error = response.statusCode;
    showDialog(context: context,
        builder: (context) =>
            AlertDialog(title: Text('Error'),
                content: Text('Error $error: conexión - service')));

    throw new Exception("Error while fetching data");
  } else {
    print("${response.body}");
  print('Insertado correctamente....');
    return response;
  }
}


Future<http.Response> getDetailsMImc (BuildContext context, String api, String date, String nEmploye, int idM) async {

  Map data = {
    'fecha': date,
    'idUsuario': nEmploye
  };
  //encode Map to JSON
  var body = json.encode(data);

  var response = await http.post(api,
      headers: {"Content-Type": "application/json"},
      body: body
  );

  //print("${response.statusCode}");

  if(response.statusCode < 200 || response.statusCode > 400 || json == null){

    print('Error WS');
    final error = response.statusCode;
    showDialog(context: context, builder: (context) => AlertDialog(title: Text('Error'), content: Text('Error $error: conexión - service')));

    throw new Exception("Error while fetching data");

  } else {
    //print("${response.body}");

    //Size List:
    var jsonList = json.decode(response.body) as List;
    var countR = jsonList.toList().length;
    //print(countR);

    //Agregar a la bd:
    for(var index = 0; index < countR; index++){

      final anioAnt = jsonList[index]['anioAnt'];
      final concepto = jsonList[index]['concepto'];
      final conceptoL = jsonList[index]['conceptoL'];
      final creditos = jsonList[index]['creditos'];
      final mesAct = jsonList[index]['mesAct'];
      final mesAnt = jsonList[index]['mesAnt'];
      final pAnioAnt = jsonList[index]['porcentajeAnioAnt'];
      final pMesAnt = jsonList[index]['porcentajeMesAnt'];
      final varAnioAnt = jsonList[index]['varAnioAnt'];
      final varMesAnt = jsonList[index]['varMesAnt'];

      ImcRBloc.addDetailsImc(idM, index, '$anioAnt', '$concepto', '$conceptoL', '$creditos', '$mesAct', '$mesAnt', '$pAnioAnt', '$pMesAnt', '$varAnioAnt', '$varMesAnt');
      //ImcRBloc.addDetailsImc(0, anioAnt, concepto, conceptoL, creditos, mesAct, mesAnt, pAnioAnt, pMesAnt, varAnioAnt, varMesAnt);
    }

    final dbHelper = IMCDetailsMDatabase.instance;
    final countAll = await dbHelper.queryRowCount(); //156
    final countConcp = await dbHelper.queryCount('conceptoL', 0); //12

    final countTotal = countAll / countConcp;
    //print(countTotal);

    //Count datesIMC:
    final dbHelperD = IMCDatesDatabase.instance;
    final countDates = await dbHelperD.queryRowCount();

    if(countTotal == countDates){
      print('Carga completa DetIMC');
      //pasar a IMC:
      ImcRBloc.loadViewIMC(context);
    }
    return response;


  }

}


Widget ShowMessage(String message) =>
    StreamBuilder<bool>(builder: (context, snap) {


      return AlertDialog(
        backgroundColor: Color.fromRGBO(207, 227, 233, 1),
        scrollable: true,
        title: Column(

          children: <Widget>[

          ],
        ),

        content: Container(

          padding: EdgeInsets.all(20),
          color: Color.fromRGBO(178, 222, 235, 1),
          child: Column(

            children: <Widget>[

              Row(

                children: <Widget>[

                  Text(message, textAlign: TextAlign.center, style: TextStyle( fontSize: 12, fontWeight: FontWeight.bold)),
                  Icon(Icons.report_problem, color: Colors.blue),
                ],
              ),



            ],
          ),
        ),
      );
    });
Widget ShowMessageSave(String message) =>
    StreamBuilder<bool>(builder: (context, snap) {


      return AlertDialog(
        backgroundColor: Color.fromRGBO(207, 227, 233, 1),
        scrollable: true,
        title: Column(

          children: <Widget>[

          ],
        ),

        content: Container(

          padding: EdgeInsets.all(20),
          color: Color.fromRGBO(178, 222, 235, 1),
          child: Column(

            children: <Widget>[

              Row(

                children: <Widget>[

                  Text(message, textAlign: TextAlign.center, style: TextStyle( fontSize: 12, fontWeight: FontWeight.bold)),
                  Icon(Icons.check_circle_outline, color: Colors.blue),
                ],
              ),



            ],
          ),
        ),
      );
    });
