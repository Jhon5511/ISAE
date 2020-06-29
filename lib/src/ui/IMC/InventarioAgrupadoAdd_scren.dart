import 'dart:async';
import 'dart:io';

import 'package:amazon_s3_cognito/amazon_s3_cognito.dart';
import 'package:amazon_s3_cognito/aws_region.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:isae/src/blocs/IMC/imcR_bloc.dart';
import 'package:isae/src/blocs/login_bloc.dart';
import 'package:isae/src/complements/globalStyles.dart';
import 'package:isae/src/complements/globalWidgets.dart';
import 'package:isae/src/complements/globalVariables.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:isae/src/models/Inventario.dart';
import 'package:isae/src/models/InventarioAgrupado.dart';
import 'package:isae/src/models/Proyects.dart';
import 'package:isae/src/services/ApiDefinitions.dart';
import 'package:isae/src/services/consults_imc/Inventario_wsConsults.dart';
import 'package:isae/src/ui/IMC/InventarioAdd_scren.dart';
import 'package:isae/src/ui/IMC/InventarioDetalleAddAgrupacion_scren.dart';
import 'package:isae/src/ui/IMC/InventarioDetalleAgrupacion_scren.dart';
import 'package:isae/src/ui/IMC/Inventario_scren.dart';
import 'package:isae/src/ui/IMC/PhotoPreviewScreen.dart';
import 'package:progress_dialog/progress_dialog.dart';

import 'TablePojo.dart';
class InventarioAgrupadoAddScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => InventarioAgrupadoAddScreenState();

}

class InventarioAgrupadoAddScreenState extends State<InventarioAgrupadoAddScreen> {


  @override
  void initState(){
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    DateTime now1 = DateTime.now();
    var currentTime = new DateTime(now1.year, now1.month, now1.day);
    GlobalVariables.dateNow = currentTime.toString();
    //print('Fecha del dia  $currentTime');
    return Scaffold(
      //key: GlobalVariables.scaffoldKeyIMCR,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(85.0),
             child: GlobalWidgets.topBar('INVENTARIO AGRUPADO','Marco Antonio', context, '$currentTime'.substring(0,10)),

          ),
      backgroundColor: Color.fromRGBO(207, 227, 233, 1),


      body: Material(
        child: Container(
          color: Color.fromRGBO(207, 227, 233, 1),
          child: Column(
            children: <Widget>[
              //------------Body------------
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        FlatButton(
                          child: Image(image: new AssetImage('assets/images/previous.png'),
                              width: 25, height: 25),
                          onPressed: (){
                            Navigator.pushReplacement(
                                context,
                                PageRouteBuilder(pageBuilder: (context, anim1, anim2) => InventarioAddScreen(),
                                  transitionsBuilder: (context, anim1, anim2, child) => Container(child: child),//(context, anim1, anim2, child) => FadeTransition(opacity: anim1, child: child),
                                  transitionDuration: Duration(seconds: 1),
                                )
                            );
                          },
                        ),

                    Container(

                          color: Color.fromRGBO(12, 160, 219, 1), // cOLORE DE FONDO CAMBIAR
                          child: Column(
                            children: <Widget>[
                              //--------var es------------
                              Container(
                                color: Color.fromRGBO(207, 227, 233, 1),
                                child: getAgrupado(context, GlobalVariables.listAgrupado),
                              ),


                            ],
                          ),
                        ),


                      ],
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );


  }

}

Widget getAgrupado(BuildContext context , List<InventarioAgrupado> listaAgrupado) {


  return Container(
    color: Color.fromRGBO(178, 222, 235, 1),

    padding: EdgeInsets.all(20),

    child: Column(children: <Widget>[

    for(var index = 0; index < listaAgrupado.length; index++)(


        InkWell(
          onTap: () {
        print('Detalle Campos ..........    ' + GlobalVariables.listAgrupado[index].id.toString());
        GlobalVariables.idAgrupador = GlobalVariables.listAgrupado[index].id;
        LoginBloc.loadingI(context,true);
        ImcRBloc.loadInventarioDetalleAgrupado(context,1);






        Future.delayed(Duration(seconds: 3), () => {
          LoginBloc.loadingI(context,false),
          Navigator.pushReplacement(
              context,
              PageRouteBuilder(pageBuilder: (context, anim1, anim2) => InventarioDetalleAddAgrupacionScreen(),
                transitionsBuilder: (context, anim1, anim2, child) => Container(child: child),//(context, anim1, anim2, child) => FadeTransition(opacity: anim1, child: child),
                transitionDuration: Duration(seconds: 3),
              )
          ),


//        for (var index = 0; index < GlobalVariables.listDetalleAgrupado.length; index++){
//            if(GlobalVariables.listDetalleAgrupado[index].tipoCampo.contains('CATALOGO')){
//              print('cargando los catalogos  .... '+GlobalVariables.listDetalleAgrupado[index].tipoCampo.replaceAll('CATALOGO', ' ')),
//               ImcRBloc.loadcatlogos(context,int.parse(GlobalVariables.listDetalleAgrupado[index].tipoCampo.replaceAll('CATALOGO', ' ')))
//
//            }
//
//          }
        });


          }, // handle your onTap here
          child: Container(
          padding: EdgeInsets.all(10),
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
            color:  (index % 2) == 0 ? Color.fromRGBO(2, 142, 201, 1): Color.fromRGBO(65, 190, 223, 1),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0))),
        height: MediaQuery.of(context).size.height * 0.08,
        child: Row(children: <Widget>[

          Text(listaAgrupado[index].descripcion,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 13)),
          new Icon(Icons.add_circle_outline,color: Colors.white),

        ]),
          ),
     // ),
  )
    ),
      Container(
        height: MediaQuery.of(context).size.height * 0.02,
      ),
      Material(
        elevation: 5.0,
        //borderRadius: BorderRadius.circular(30.0),
        color:  Color.fromRGBO(74, 191, 37, 1),
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width / 2,
          onPressed: () async {

            print("Guardar::::...... ");



            //print("VALOR A Nombres::::   " + GlobalVariables.controllerNOMBRES.text);
            //print("VALOR A Nombres::::   " + GlobalVariables.selectedItemCatPISO.descripcion);
          if(GlobalVariables.controllerAREA.text == ''){
            print("SIII  " );

          }else{
            print("NOOOO::::   ");

          }


            if(GlobalVariables.controllerNOMBRES.text == ''){
              showDialog(context: context, builder: (context) => ShowMessage('Existen campos vacios, favor de validar!'));
            }else{
              showDialog(context: context, builder: (context) => ShowMessageSave('Inventario guardado correctamente!'));

            //            LoginBloc.loadingI(context,true);
              Future.delayed(Duration(seconds: 3), () => {
                //      LoginBloc.loadingI(context,false),
                Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(pageBuilder: (context, anim1, anim2) => InventarioAgrupadoAddScreen(),
                      transitionsBuilder: (context, anim1, anim2, child) => Container(child: child),//(context, anim1, anim2, child) => FadeTransition(opacity: anim1, child: child),
                      transitionDuration: Duration(seconds: 3),
                    )
                ),
                ImcRBloc.insertInvet(context)
              });


              limpiar();
            }



          },
          textColor: Colors.white,
          child: Text("Guardar",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      Container(
        height: MediaQuery.of(context).size.height * 0.02,
      ),
    ]),
  );
}


 void loadAllDatesIMC(BuildContext context,List<Proyects> listaProyects, int index) async {

   if(GlobalVariables.listIventario.isEmpty)
  print('Entrando a app cargando Ws -----> Inventario desde proyecto ///////' +  listaProyects[index].id.toString());

  getInvent(context, ApiDefinition.wsInventToProyect + listaProyects[index].id.toString());
  //print(GlobalVariables.listIventario[0].toString());

}

void limpiar () async{
  GlobalVariables.selectedItemCatPROYECTO= null;
  GlobalVariables.selectedItemCatPROYECTODESCRIPCION= null;
  GlobalVariables.selectedItemCatFCREACON= null;
  GlobalVariables.selectedItemCatFOLIO= null;
  GlobalVariables.selectedItemCatID= null;
  GlobalVariables.selectedItemCatAPELLIDOS= null;
  GlobalVariables.selectedItemCatAPELLIDOS2= null;
  GlobalVariables.selectedItemCatNOMBRES= null;
  GlobalVariables.selectedItemCatNOMBRECOMPLETO= null;
  GlobalVariables.selectedItemCatNUMEMPLEADO= null;
  GlobalVariables.selectedItemCatVIP= null;
  GlobalVariables.selectedItemCatPUESTO= null;
  GlobalVariables.selectedItemCatDIRECCION= null;
  GlobalVariables.selectedItemCatSUBDIRECCION= null;
  GlobalVariables.selectedItemCatCLAVESUBDIRECCION= null;
  GlobalVariables.selectedItemCatGERENCIA= null;
  GlobalVariables.selectedItemCatCLAVEGERENCIA= null;
  GlobalVariables.selectedItemCatDEPTO= null;
  GlobalVariables.selectedItemCatCLAVECENTROTRABAJO= null;
  GlobalVariables.selectedItemCatCORREO= null;
  GlobalVariables.selectedItemCatTELEFONO= null;
  GlobalVariables.selectedItemCatEXT= null;
  GlobalVariables.selectedItemCatUBICACION= null;
  GlobalVariables.selectedItemCatESTADO= null;
  GlobalVariables.selectedItemCatCP= null;
  GlobalVariables.selectedItemCatCOLONIA= null;
  GlobalVariables.selectedItemCatUBICACIONCOMPLETA= null;
  GlobalVariables.selectedItemCatZONA= null;
  GlobalVariables.selectedItemCatLOCALIDAD= null;
  GlobalVariables.selectedItemCatEDIFICIO= null;
  GlobalVariables.selectedItemCatPISO= null;
  GlobalVariables.selectedItemCatAREA= null;
  GlobalVariables.selectedItemCatADSCRIPCION= null;
  GlobalVariables.selectedItemCatAPELLIDOSJEFE= null;
  GlobalVariables.selectedItemCatNOMBRESJEFE= null;
  GlobalVariables.selectedItemCatNOMBRECOMPLETOJEFE= null;
  GlobalVariables.selectedItemCatFICHAJEFE= null;
  GlobalVariables.selectedItemCatEXTJEFE= null;
  GlobalVariables.selectedItemCatUBICACIONJEFE= null;
  GlobalVariables.selectedItemCatNOMBREJEFEINMEDIATO= null;
  GlobalVariables.selectedItemCatAPELLIDOSRESGUARDO= null;
  GlobalVariables.selectedItemCatNOMBRESRESGUARDO= null;
  GlobalVariables.selectedItemCatNOMBRECOMPLETORESGUARDO= null;
  GlobalVariables.selectedItemCatADSCRIPCIONRESGUARDO= null;
  GlobalVariables.selectedItemCatEXTRESGUARDO= null;
  GlobalVariables.selectedItemCatAPELLIDOSRESPONSABLE= null;
  GlobalVariables.selectedItemCatNOMBRESRESPONSABLE= null;
  GlobalVariables.selectedItemCatNOMBRECOMPLETORESPONSABLE= null;
  GlobalVariables.selectedItemCatAPELLIDOSPEMEX= null;
  GlobalVariables.selectedItemCatNOMBRESPEMEX= null;
  GlobalVariables.selectedItemCatNOMBRECOMPLETOPEMEX= null;
  GlobalVariables.selectedItemCatTIPOEQUIPO= null;
  GlobalVariables.selectedItemCatEQUIPO= null;
  GlobalVariables.selectedItemCatMARCAEQUIPO= null;
  GlobalVariables.selectedItemCatMODELOEQUIPO= null;
  GlobalVariables.selectedItemCatNUMSERIEEQUIPO= null;
  GlobalVariables.selectedItemCatEQUIPOCOMPLETO= null;
  GlobalVariables.selectedItemCatMONITOR= null;
  GlobalVariables.selectedItemCatMARCAMONITOR= null;
  GlobalVariables.selectedItemCatMODELOMONITOR= null;
  GlobalVariables.selectedItemCatNUMSERIEMONITOR= null;
  GlobalVariables.selectedItemCatMONITORCOMPLETO= null;
  GlobalVariables.selectedItemCatTECLADO= null;
  GlobalVariables.selectedItemCatMARCATECLADO= null;
  GlobalVariables.selectedItemCatMODELOTECLADO= null;
  GlobalVariables.selectedItemCatNUMSERIETECLADO= null;
  GlobalVariables.selectedItemCatTECLADOCOMPLETO= null;
  GlobalVariables.selectedItemCatMOUSE= null;
  GlobalVariables.selectedItemCatMARCAMOUSE= null;
  GlobalVariables.selectedItemCatMODELOMAUSE= null;
  GlobalVariables.selectedItemCatNUMSERIEMOUSE= null;
  GlobalVariables.selectedItemCatMOUSECOMPLETO= null;
  GlobalVariables.selectedItemCatUPS= null;
  GlobalVariables.selectedItemCatMARCAUPS= null;
  GlobalVariables.selectedItemCatMODELOUPS= null;
  GlobalVariables.selectedItemCatNUMSERIEUPS= null;
  GlobalVariables.selectedItemCatUPSCOMPLETO= null;
  GlobalVariables.selectedItemCatMALETIN= null;
  GlobalVariables.selectedItemCatMARCAMALETIN= null;
  GlobalVariables.selectedItemCatMODELOMALETIN= null;
  GlobalVariables.selectedItemCatNUMSERIEMALETIN= null;
  GlobalVariables.selectedItemCatMALETINCOMLETO= null;
  GlobalVariables.selectedItemCatCANDADO= null;
  GlobalVariables.selectedItemCatMARCACANDADO= null;
  GlobalVariables.selectedItemCatMODELOCANDADO= null;
  GlobalVariables.selectedItemCatNUMSERIECANDADO= null;
  GlobalVariables.selectedItemCatCANDADOCOMPLETO= null;
  GlobalVariables.selectedItemCatBOCINAS= null;
  GlobalVariables.selectedItemCatMARCABOCINAS= null;
  GlobalVariables.selectedItemCatMODELOBOCINAS= null;
  GlobalVariables.selectedItemCatNUMSERIEBOCINAS= null;
  GlobalVariables.selectedItemCatBOCINASCOMPLETO= null;
  GlobalVariables.selectedItemCatCAMARA= null;
  GlobalVariables.selectedItemCatMARCACAMARA= null;
  GlobalVariables.selectedItemCatMODELOCAMARA= null;
  GlobalVariables.selectedItemCatNUMSERIECMARA= null;
  GlobalVariables.selectedItemCatCAMARACOMPLETO= null;
  GlobalVariables.selectedItemCatMONITOR2= null;
  GlobalVariables.selectedItemCatMARCAMONITOR2= null;
  GlobalVariables.selectedItemCatMODELOMONITOR2= null;
  GlobalVariables.selectedItemCatNUMSERIEMONITOR2= null;
  GlobalVariables.selectedItemCatMONITOR2COMPLETO= null;
  GlobalVariables.selectedItemCatACCESORIO= null;
  GlobalVariables.selectedItemCatMARCAACCESORIO= null;
  GlobalVariables.selectedItemCatMODELOACCESORIO= null;
  GlobalVariables.selectedItemCatNUMSERIEACCESORIO= null;
  GlobalVariables.selectedItemCatACCESORIOCOMPLETO= null;
  GlobalVariables.selectedItemCatRAM= null;
  GlobalVariables.selectedItemCatDISCODURO= null;
  GlobalVariables.selectedItemCatPROCESADOR= null;
  GlobalVariables.selectedItemCatTIPOEQUIPOCOMP1= null;
  GlobalVariables.selectedItemCatMODELOCOMP1= null;
  GlobalVariables.selectedItemCatNUMSERIECOMP1= null;
  GlobalVariables.selectedItemCatCRUCECLIENTECOMP1= null;
  GlobalVariables.selectedItemCatTIPOEQUIPOCOMP2= null;
  GlobalVariables.selectedItemCatMODELOCOMP2= null;
  GlobalVariables.selectedItemCatNUMSERIECOMP2= null;
  GlobalVariables.selectedItemCatCRUCECLIENTECOMP2= null;
  GlobalVariables.selectedItemCatTIPOEQUIPOCOMP3= null;
  GlobalVariables.selectedItemCatMODELOCOMP3= null;
  GlobalVariables.selectedItemCatNUMSERIECOMP3= null;
  GlobalVariables.selectedItemCatCRUCECLIENTECOMP3= null;
  GlobalVariables.selectedItemCatTIPOEQUIPOCOMP4= null;
  GlobalVariables.selectedItemCatMODELOCOMP4= null;
  GlobalVariables.selectedItemCatNUMSERIECOMP4= null;
  GlobalVariables.selectedItemCatCRUCECLIENTECOMP4= null;
  GlobalVariables.selectedItemCatTIPOEQUIPOCOMP5= null;
  GlobalVariables.selectedItemCatMODELOCOMP5= null;
  GlobalVariables.selectedItemCatNUMSERIECOMP5= null;
  GlobalVariables.selectedItemCatCRUCECLIENTECOMP5= null;
  GlobalVariables.selectedItemCatTIPOEQUIPOCOMP6= null;
  GlobalVariables.selectedItemCatMODELOCOMP6= null;
  GlobalVariables.selectedItemCatNUMSERIECOMP6= null;
  GlobalVariables.selectedItemCatCRUCECLIENTECOMP6= null;
  GlobalVariables.selectedItemCatTIPOEQUIPOCOMP7= null;
  GlobalVariables.selectedItemCatMODELOCOMP7= null;
  GlobalVariables.selectedItemCatNUMSERIECOMP7= null;
  GlobalVariables.selectedItemCatCRUCECLIENTECOMP7= null;
  GlobalVariables.selectedItemCatVALIDACIONCOMP1= null;
  GlobalVariables.selectedItemCatVALIDACIONCOMP2= null;
  GlobalVariables.selectedItemCatVALIDACIONCOMP3= null;
  GlobalVariables.selectedItemCatVALIDACIONCOMP4= null;
  GlobalVariables.selectedItemCatVALIDACIONCOMP5= null;
  GlobalVariables.selectedItemCatVALIDACIONCOMP6= null;
  GlobalVariables.selectedItemCatVALIDACIONCOMP7= null;
  GlobalVariables.selectedItemCatVALIDADOSCOMP= null;
  GlobalVariables.selectedItemCatTECNICONOMBRE= null;
  GlobalVariables.selectedItemCatDIA= null;
  GlobalVariables.selectedItemCatMES= null;
  GlobalVariables.selectedItemCatANIO= null;
  GlobalVariables.selectedItemCatREQESPECIAL1= null;
  GlobalVariables.selectedItemCatREQESPECIAL2= null;
  GlobalVariables.selectedItemCatOBSINV= null;
  GlobalVariables.selectedItemCatOBSRESGUARDO= null;
  GlobalVariables.selectedItemCatOBSEXTRAS1= null;
  GlobalVariables.selectedItemCatOBSEXTRAS2= null;
  GlobalVariables.selectedItemCatESTATUS= null;
  GlobalVariables.selectedItemCatFESCALACION= null;
  GlobalVariables.selectedItemCatCOMENTARIOSESCALACION= null;
  GlobalVariables.controllerPROYECTO.text = '';
  GlobalVariables.controllerPROYECTODESCRIPCION.text = '';
  GlobalVariables.controllerFCREACON.text = '';
  GlobalVariables.controllerFOLIO.text = '';
  GlobalVariables.controllerID.text = '';
  GlobalVariables.controllerAPELLIDOS.text = '';
  GlobalVariables.controllerAPELLIDOS2.text = '';
  GlobalVariables.controllerNOMBRES.text = '';
  GlobalVariables.controllerNOMBRECOMPLETO.text = '';
  GlobalVariables.controllerNUMEMPLEADO.text = '';
  GlobalVariables.controllerVIP.text = '';
  GlobalVariables.controllerPUESTO.text = '';
  GlobalVariables.controllerDIRECCION.text = '';
  GlobalVariables.controllerSUBDIRECCION.text = '';
  GlobalVariables.controllerCLAVESUBDIRECCION.text = '';
  GlobalVariables.controllerGERENCIA.text = '';
  GlobalVariables.controllerCLAVEGERENCIA.text = '';
  GlobalVariables.controllerDEPTO.text = '';
  GlobalVariables.controllerCLAVECENTROTRABAJO.text = '';
  GlobalVariables.controllerCORREO.text = '';
  GlobalVariables.controllerTELEFONO.text = '';
  GlobalVariables.controllerEXT.text = '';
  GlobalVariables.controllerUBICACION.text = '';
  GlobalVariables.controllerESTADO.text = '';
  GlobalVariables.controllerCP.text = '';
  GlobalVariables.controllerCOLONIA.text = '';
  GlobalVariables.controllerUBICACIONCOMPLETA.text = '';
  GlobalVariables.controllerZONA.text = '';
  GlobalVariables.controllerLOCALIDAD.text = '';
  GlobalVariables.controllerEDIFICIO.text = '';
  GlobalVariables.controllerPISO.text = '';
  GlobalVariables.controllerAREA.text = '';
  GlobalVariables.controllerADSCRIPCION.text = '';
  GlobalVariables.controllerAPELLIDOSJEFE.text = '';
  GlobalVariables.controllerNOMBRESJEFE.text = '';
  GlobalVariables.controllerNOMBRECOMPLETOJEFE.text = '';
  GlobalVariables.controllerFICHAJEFE.text = '';
  GlobalVariables.controllerEXTJEFE.text = '';
  GlobalVariables.controllerUBICACIONJEFE.text = '';
  GlobalVariables.controllerNOMBREJEFEINMEDIATO.text = '';
  GlobalVariables.controllerAPELLIDOSRESGUARDO.text = '';
  GlobalVariables.controllerNOMBRESRESGUARDO.text = '';
  GlobalVariables.controllerNOMBRECOMPLETORESGUARDO.text = '';
  GlobalVariables.controllerADSCRIPCIONRESGUARDO.text = '';
  GlobalVariables.controllerEXTRESGUARDO.text = '';
  GlobalVariables.controllerAPELLIDOSRESPONSABLE.text = '';
  GlobalVariables.controllerNOMBRESRESPONSABLE.text = '';
  GlobalVariables.controllerNOMBRECOMPLETORESPONSABLE.text = '';
  GlobalVariables.controllerAPELLIDOSPEMEX.text = '';
  GlobalVariables.controllerNOMBRESPEMEX.text = '';
  GlobalVariables.controllerNOMBRECOMPLETOPEMEX.text = '';
  GlobalVariables.controllerTIPOEQUIPO.text = '';
  GlobalVariables.controllerEQUIPO.text = '';
  GlobalVariables.controllerMARCAEQUIPO.text = '';
  GlobalVariables.controllerMODELOEQUIPO.text = '';
  GlobalVariables.controllerNUMSERIEEQUIPO.text = '';
  GlobalVariables.controllerEQUIPOCOMPLETO.text = '';
  GlobalVariables.controllerMONITOR.text = '';
  GlobalVariables.controllerMARCAMONITOR.text = '';
  GlobalVariables.controllerMODELOMONITOR.text = '';
  GlobalVariables.controllerNUMSERIEMONITOR.text = '';
  GlobalVariables.controllerMONITORCOMPLETO.text = '';
  GlobalVariables.controllerTECLADO.text = '';
  GlobalVariables.controllerMARCATECLADO.text = '';
  GlobalVariables.controllerMODELOTECLADO.text = '';
  GlobalVariables.controllerNUMSERIETECLADO.text = '';
  GlobalVariables.controllerTECLADOCOMPLETO.text = '';
  GlobalVariables.controllerMOUSE.text = '';
  GlobalVariables.controllerMARCAMOUSE.text = '';
  GlobalVariables.controllerMODELOMAUSE.text = '';
  GlobalVariables.controllerNUMSERIEMOUSE.text = '';
  GlobalVariables.controllerMOUSECOMPLETO.text = '';
  GlobalVariables.controllerUPS.text = '';
  GlobalVariables.controllerMARCAUPS.text = '';
  GlobalVariables.controllerMODELOUPS.text = '';
  GlobalVariables.controllerNUMSERIEUPS.text = '';
  GlobalVariables.controllerUPSCOMPLETO.text = '';
  GlobalVariables.controllerMALETIN.text = '';
  GlobalVariables.controllerMARCAMALETIN.text = '';
  GlobalVariables.controllerMODELOMALETIN.text = '';
  GlobalVariables.controllerNUMSERIEMALETIN.text = '';
  GlobalVariables.controllerMALETINCOMLETO.text = '';
  GlobalVariables.controllerCANDADO.text = '';
  GlobalVariables.controllerMARCACANDADO.text = '';
  GlobalVariables.controllerMODELOCANDADO.text = '';
  GlobalVariables.controllerNUMSERIECANDADO.text = '';
  GlobalVariables.controllerCANDADOCOMPLETO.text = '';
  GlobalVariables.controllerBOCINAS.text = '';
  GlobalVariables.controllerMARCABOCINAS.text = '';
  GlobalVariables.controllerMODELOBOCINAS.text = '';
  GlobalVariables.controllerNUMSERIEBOCINAS.text = '';
  GlobalVariables.controllerBOCINASCOMPLETO.text = '';
  GlobalVariables.controllerCAMARA.text = '';
  GlobalVariables.controllerMARCACAMARA.text = '';
  GlobalVariables.controllerMODELOCAMARA.text = '';
  GlobalVariables.controllerNUMSERIECMARA.text = '';
  GlobalVariables.controllerCAMARACOMPLETO.text = '';
  GlobalVariables.controllerMONITOR2.text = '';
  GlobalVariables.controllerMARCAMONITOR2.text = '';
  GlobalVariables.controllerMODELOMONITOR2.text = '';
  GlobalVariables.controllerNUMSERIEMONITOR2.text = '';
  GlobalVariables.controllerMONITOR2COMPLETO.text = '';
  GlobalVariables.controllerACCESORIO.text = '';
  GlobalVariables.controllerMARCAACCESORIO.text = '';
  GlobalVariables.controllerMODELOACCESORIO.text = '';
  GlobalVariables.controllerNUMSERIEACCESORIO.text = '';
  GlobalVariables.controllerACCESORIOCOMPLETO.text = '';
  GlobalVariables.controllerRAM.text = '';
  GlobalVariables.controllerDISCODURO.text = '';
  GlobalVariables.controllerPROCESADOR.text = '';
  GlobalVariables.controllerTIPOEQUIPOCOMP1.text = '';
  GlobalVariables.controllerMODELOCOMP1.text = '';
  GlobalVariables.controllerNUMSERIECOMP1.text = '';
  GlobalVariables.controllerCRUCECLIENTECOMP1.text = '';
  GlobalVariables.controllerTIPOEQUIPOCOMP2.text = '';
  GlobalVariables.controllerMODELOCOMP2.text = '';
  GlobalVariables.controllerNUMSERIECOMP2.text = '';
  GlobalVariables.controllerCRUCECLIENTECOMP2.text = '';
  GlobalVariables.controllerTIPOEQUIPOCOMP3.text = '';
  GlobalVariables.controllerMODELOCOMP3.text = '';
  GlobalVariables.controllerNUMSERIECOMP3.text = '';
  GlobalVariables.controllerCRUCECLIENTECOMP3.text = '';
  GlobalVariables.controllerTIPOEQUIPOCOMP4.text = '';
  GlobalVariables.controllerMODELOCOMP4.text = '';
  GlobalVariables.controllerNUMSERIECOMP4.text = '';
  GlobalVariables.controllerCRUCECLIENTECOMP4.text = '';
  GlobalVariables.controllerTIPOEQUIPOCOMP5.text = '';
  GlobalVariables.controllerMODELOCOMP5.text = '';
  GlobalVariables.controllerNUMSERIECOMP5.text = '';
  GlobalVariables.controllerCRUCECLIENTECOMP5.text = '';
  GlobalVariables.controllerTIPOEQUIPOCOMP6.text = '';
  GlobalVariables.controllerMODELOCOMP6.text = '';
  GlobalVariables.controllerNUMSERIECOMP6.text = '';
  GlobalVariables.controllerCRUCECLIENTECOMP6.text = '';
  GlobalVariables.controllerTIPOEQUIPOCOMP7.text = '';
  GlobalVariables.controllerMODELOCOMP7.text = '';
  GlobalVariables.controllerNUMSERIECOMP7.text = '';
  GlobalVariables.controllerCRUCECLIENTECOMP7.text = '';
  GlobalVariables.controllerVALIDACIONCOMP1.text = '';
  GlobalVariables.controllerVALIDACIONCOMP2.text = '';
  GlobalVariables.controllerVALIDACIONCOMP3.text = '';
  GlobalVariables.controllerVALIDACIONCOMP4.text = '';
  GlobalVariables.controllerVALIDACIONCOMP5.text = '';
  GlobalVariables.controllerVALIDACIONCOMP6.text = '';
  GlobalVariables.controllerVALIDACIONCOMP7.text = '';
  GlobalVariables.controllerVALIDADOSCOMP.text = '';
  GlobalVariables.controllerTECNICONOMBRE.text = '';
  GlobalVariables.controllerDIA.text = '';
  GlobalVariables.controllerMES.text = '';
  GlobalVariables.controllerANIO.text = '';
  GlobalVariables.controllerREQESPECIAL1.text = '';
  GlobalVariables.controllerREQESPECIAL2.text = '';
  GlobalVariables.controllerOBSINV.text = '';
  GlobalVariables.controllerOBSRESGUARDO.text = '';
  GlobalVariables.controllerOBSEXTRAS1.text = '';
  GlobalVariables.controllerOBSEXTRAS2.text = '';
  GlobalVariables.controllerESTATUS.text = '';
  GlobalVariables.controllerFESCALACION.text = '';
  GlobalVariables.controllerCOMENTARIOSESCALACION.text = '';
}
Future<bool> _getFutureBool() {
  return Future.delayed(Duration(milliseconds: 5000))
      .then((onValue) => true);
}

