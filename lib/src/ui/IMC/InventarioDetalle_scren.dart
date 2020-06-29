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
import 'package:isae/src/ui/IMC/InventarioDetalleAgrupacion_scren.dart';
import 'package:isae/src/ui/IMC/InventarioLoadFiles_scren.dart';
import 'package:isae/src/ui/IMC/Inventario_scren.dart';
import 'package:isae/src/ui/IMC/PhotoPreviewScreen.dart';
import 'package:progress_dialog/progress_dialog.dart';

import 'TablePojo.dart';
class InventarioDetalleScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => InventarioDetalleScreenState();

}

class InventarioDetalleScreenState extends State<InventarioDetalleScreen> {


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
                                PageRouteBuilder(pageBuilder: (context, anim1, anim2) => InventarioScreen(),
                                  transitionsBuilder: (context, anim1, anim2, child) => Container(child: child),//(context, anim1, anim2, child) => FadeTransition(opacity: anim1, child: child),
                                  transitionDuration: Duration(seconds: 1),
                                )
                            );
                          },
                        ),


//                        Text("Presione el grupo que desa editar",
//                            textAlign: TextAlign.center,
//                            style: TextStyle(
//                                fontWeight: FontWeight.bold,
//                                color: Colors.black,
//                                fontSize: 13)),

//                        Container(
//                          alignment: Alignment.center,
//                          margin: EdgeInsets.only(left: 20, right: 20),
//                          decoration: BoxDecoration(
//                              color: Color.fromRGBO(207, 227, 233, 1),
//                              shape: BoxShape.rectangle,
//                              borderRadius: BorderRadius.only(
//                                  topLeft: Radius.circular(30.0),
//                                  bottomRight: Radius.circular(30.0))),
//                          height: MediaQuery.of(context).size.height * 0.08,
//                          child:  Text('INVENTARIO AGRUPADO',
//                              textAlign: TextAlign.center,
//                              style: TextStyle(
//                                  fontWeight: FontWeight.bold,
//                                  color: Color.fromRGBO(9, 99, 141, 1),
//                                  fontSize: 26)),
//
//                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(30, 1, 1, 10),
                          child: Column(
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  print("Cargar archivos::::...... ");
                                  getUserLocation();
                                  GlobalVariables.listFiles.clear();
                                  Future.delayed(Duration(seconds: 1), () => {
                                    LoginBloc.loadingI(context,false),
                                    Navigator.pushReplacement(
                                        context,
                                        PageRouteBuilder(pageBuilder: (context, anim1, anim2) => InventarioLoadFilesScreen(),
                                          transitionsBuilder: (context, anim1, anim2, child) => Container(child: child),//(context, anim1, anim2, child) => FadeTransition(opacity: anim1, child: child),
                                          transitionDuration: Duration(seconds: 1),
                                        )
                                    )

                                  });
                                }, // handle your onTap here
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.unarchive, color: Colors.blue),
                                    Text('CARGAR EVIDENCIA.',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            decoration:
                                            TextDecoration.underline)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                    Container(

                          color:  Color.fromRGBO(207, 227, 233, 1),
                          child: Column(
                            children: <Widget>[

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
  Future<Position> locateUser() async {
    return Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  getUserLocation() async {
    GlobalVariables.currentLocation = await locateUser();
    setState(() {
      GlobalVariables.center = LatLng(GlobalVariables.currentLocation.latitude, GlobalVariables.currentLocation.longitude);
    });

    print('Ubicacion de la Foto:::: '+ GlobalVariables.center.toString());
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
        PageRouteBuilder(pageBuilder: (context, anim1, anim2) => InventarioDetalleAgrupacionScreen(),
        transitionsBuilder: (context, anim1, anim2, child) => Container(child: child),//(context, anim1, anim2, child) => FadeTransition(opacity: anim1, child: child),
        transitionDuration: Duration(seconds: 3),
        )
        )

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
          new Icon(Icons.supervisor_account,color: Colors.white),

        ]),
          ),
     // ),
  )
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
Future<bool> _getFutureBool() {
  return Future.delayed(Duration(milliseconds: 5000))
      .then((onValue) => true);
}

