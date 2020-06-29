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
import 'package:isae/src/models/Proyects.dart';
import 'package:isae/src/services/ApiDefinitions.dart';
import 'package:isae/src/services/consults_imc/Inventario_wsConsults.dart';
import 'package:isae/src/ui/IMC/InventarioAgrupadoAdd_scren.dart';
import 'package:isae/src/ui/IMC/InventarioDetalle_scren.dart';
import 'package:isae/src/ui/IMC/PhotoPreviewScreen.dart';
import 'package:progress_dialog/progress_dialog.dart';

import 'TablePojo.dart';
class InventarioAddScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => InventarioAddScreenState();

}

class InventarioAddScreenState extends State<InventarioAddScreen> {


  @override
  void initState(){
    super.initState();



  }

  @override
  Widget build(BuildContext context) {
    DateTime now1 = DateTime.now();
    var currentTime = new DateTime(now1.year, now1.month, now1.day);
    GlobalVariables.dateNow = currentTime.toString();

    return Scaffold(
      //key: GlobalVariables.scaffoldKeyIMCR,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(85.0),
             child: GlobalWidgets.topBar('AGREGAR INVENTARIO','Marco Antonio Moreno Silva', context, '$currentTime'.substring(0,10)),

          ),
      backgroundColor: Color.fromRGBO(207, 227, 233, 1),
      //drawer: GlobalWidgets.menuL(context),

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
//                        Container(
//                          alignment: Alignment.center,
//                          margin: EdgeInsets.only(left: 20, right: 20),
//                          decoration: BoxDecoration(
//                              color: Color.fromRGBO(207, 227, 233, 1),
//                              shape: BoxShape.rectangle,
//                              borderRadius: BorderRadius.only(
//                                  topLeft: Radius.circular(10.0),
//                                  bottomRight: Radius.circular(10.0))),
//                          height: MediaQuery.of(context).size.height * 0.08,
//                          child:  Text('AGREGAR INVENTARIO',
//                              textAlign: TextAlign.center,
//                              style: TextStyle(
//                                  fontWeight: FontWeight.bold,
//                                  color: Color.fromRGBO(9, 99, 141, 1),
//                                  fontSize: 26)),
//
//                        ),

                    Container(

                          color: Color.fromRGBO(12, 160, 219, 1), // cOLORE DE FONDO CAMBIAR
                          child: Column(
                            children: <Widget>[
                              //--------var es------------
                              Container(
                                color: Color.fromRGBO(207, 227, 233, 1),
                                child: getProyectsAddInventario(context,GlobalVariables.listProyects),
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




Widget ShowInventarioForProyect(int index) =>
    StreamBuilder<bool>(builder: (context, snap) {


      return AlertDialog(

        backgroundColor: Color.fromRGBO(207, 227, 233, 1),
 scrollable: true,
        title: Column(

          children: <Widget>[
            Text('INVENTARIO',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(9, 99, 141, 1),
                    fontSize: 23)),



            Row(

              children: <Widget>[
                Icon(Icons.arrow_forward_ios, color: Colors.blue),
                Text(GlobalVariables.listProyects[index].descripcion, textAlign: TextAlign.center, style: TextStyle( fontSize: 20, fontWeight: FontWeight.w900)),

              ],
            ),


          ],
        ),

        content: Container(

          height: MediaQuery.of(context).size.height * 0.40,
          padding: EdgeInsets.all(20),
          color: Color.fromRGBO(178, 222, 235, 1),
          child: Column(

            children: <Widget>[

              for(var i = 0; i <  GlobalVariables.listIventario.length; i++)(

                 Column(
                children: <Widget>[
                     InkWell(
                      onTap: () {

                        print('PASAR A AGRUPADOR....' );
                        GlobalVariables.idProyect = GlobalVariables.listProyects[index].id;
                        GlobalVariables.idIventario =  GlobalVariables.listIventario[i].inventarioid;
                        GlobalVariables.nameProyectFile = GlobalVariables.listProyects[index].descripcion;
                        GlobalVariables.nameInvenFolioFile = GlobalVariables.listIventario[i].folio;
                        print('id_proyect:: ' + GlobalVariables.listProyects[index].id.toString() + ' id_inventario::: ' + GlobalVariables.listIventario[i].inventarioid.toString());
                        ImcRBloc.loadInventarioAgrupado(context,GlobalVariables.listProyects[index].id, GlobalVariables.listIventario[i].inventarioid);
                       // GlobalVariables.idIventario = GlobalVariables.listIventario[i].nombrecompleto.toString();
                        Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(pageBuilder: (context, anim1, anim2) => InventarioDetalleScreen(),
                              transitionsBuilder: (context, anim1, anim2, child) => Container(child: child),//(context, anim1, anim2, child) => FadeTransition(opacity: anim1, child: child),
                              transitionDuration: Duration(seconds: 1),
                            )
                        );


                      },

            child:
                  Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                        color: (i % 2) == 0 ? Color.fromRGBO(2, 142, 201, 1): Color.fromRGBO(16, 175, 205, 1),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0))),
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Row(children: <Widget>[
                      Text(GlobalVariables.listIventario[i].folio,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 12)),
                      Expanded(
                        child: Container(

                          padding: EdgeInsets.fromLTRB(100, 0, 10, 100),
                          alignment: Alignment.topRight,
                          width: MediaQuery.of(context).size.width * 100,
                          child: Row ( children: <Widget>[

                            new Icon(Icons.arrow_forward,color: Colors.white),
                          ]
                          ),
                        ),
                      ),

                    ]),
                  ),
                     ),
                ],
              )

                ),
            ],
          ),
        ),
      );
    });



Widget getProyectsAddInventario(BuildContext context , List<Proyects> listaProyects) {
  DateTime now1 = DateTime.parse("2020-05-20 20:18:00");
  var currentTime1 =
  new DateTime(now1.year, now1.month, now1.day, now1.hour, now1.minute);

  DateTime now2 = DateTime.parse("2020-05-21 16:14:00");
  var currentTime2 =
  new DateTime(now2.year, now2.month, now2.day, now2.hour, now2.minute);

  DateTime now3 = DateTime.parse("2020-05-15 19:42:00");
  var currentTime3 =
  new DateTime(now3.year, now3.month, now3.day, now3.hour, now3.minute);

  var color1 = Colors.amberAccent;
  var color2 = Colors.deepOrange;


  return Container(
    color: Color.fromRGBO(207, 227, 233, 1),

    padding: EdgeInsets.all(20),

    child: Column(children: <Widget>[

      for(var index = 0; index < listaProyects.length; index++)(


          InkWell(
            onTap: () {
              print('PASAR A AGRUPADOR....' );
               ImcRBloc.loadInventarioAgrupado(context,GlobalVariables.listProyects[index].id,null);
              GlobalVariables.idProyect = GlobalVariables.listProyects[index].id;
              GlobalVariables.nameProyectFile = GlobalVariables.listProyects[index].descripcion;
              GlobalVariables.idIventario =  1;
              Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(pageBuilder: (context, anim1, anim2) => InventarioAgrupadoAddScreen(),
                    transitionsBuilder: (context, anim1, anim2, child) => Container(child: child),//(context, anim1, anim2, child) => FadeTransition(opacity: anim1, child: child),
                    transitionDuration: Duration(seconds: 1),
                  )
              );




            }, // handle your onTap here
            child: Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                  color:  (index % 2) == 0 ? Color.fromRGBO(9, 99, 141, 1): Color.fromRGBO(65, 190, 223, 1),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0))),
              height: MediaQuery.of(context).size.height * 0.08,
              child: Row(children: <Widget>[

                Text(listaProyects[index].descripcion,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 14)),
                new Icon(Icons.add,color: Colors.white),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(100, 1, 11, 10),
                    alignment: Alignment.bottomRight,
                    child: Text('$currentTime1'.substring(0,10),
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12, color: Colors.white)),
                  ),
                ),
              ]),
            ),
            // ),
          )
      ),

    ]),
  );
}


