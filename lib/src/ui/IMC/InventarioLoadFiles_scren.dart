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
import 'package:isae/src/models/InventarioDetalleAgrupado.dart';
import 'package:isae/src/models/Proyects.dart';
import 'package:isae/src/services/ApiDefinitions.dart';
import 'package:isae/src/services/consults_imc/Inventario_wsConsults.dart';
import 'package:isae/src/ui/IMC/InventarioAdd_scren.dart';
import 'package:isae/src/ui/IMC/InventarioDetalleAddAgrupacion_scren.dart';
import 'package:isae/src/ui/IMC/InventarioDetalleAgrupacion_scren.dart';
import 'package:isae/src/ui/IMC/InventarioDetalle_scren.dart';
import 'package:isae/src/ui/IMC/Inventario_scren.dart';
import 'package:isae/src/ui/IMC/PhotoPreviewScreen.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:path/path.dart' as path;
import 'package:flutter_share_file/flutter_share_file.dart';

import 'TablePojo.dart';
class InventarioLoadFilesScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => InventarioLoadFilesScreenState();

}

class InventarioLoadFilesScreenState extends State<InventarioLoadFilesScreen> {
  File _pickedImage;

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
             child: GlobalWidgets.topBar('ARCHIVOS','Marco Antonio', context, '$currentTime'.substring(0,10)),

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
                            GlobalVariables.listFiles.clear();
                            Navigator.pushReplacement(
                                context,
                                PageRouteBuilder(pageBuilder: (context, anim1, anim2) => InventarioDetalleScreen(),
                                  transitionsBuilder: (context, anim1, anim2, child) => Container(child: child),//(context, anim1, anim2, child) => FadeTransition(opacity: anim1, child: child),
                                  transitionDuration: Duration(seconds: 2),
                                )
                            );
                          },
                        ),


                        Container(
                          padding: EdgeInsets.fromLTRB(10, 1, 1, 10),
                          child: Column(
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  _pickImage(context);
                                }, // handle your onTap here
                                child: Row(
                                children: <Widget>[
                                    Icon(Icons.attach_file, color: Colors.blue),
                                    Text('Adjuntar Archivo.',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 14,

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

                          color: Color.fromRGBO(207, 227, 233, 1),// cOLORE DE FONDO CAMBIAR
                          child: Column(
                            children: <Widget>[

                              for (var index = 0; index < GlobalVariables.listFiles.length; index++)(

                                  Container(

                                      decoration: BoxDecoration(
                                          color: Color.fromRGBO(65, 190, 223, 1).withOpacity(0.2),
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(40.0),
                                              bottomRight: Radius.circular(20.0))),
                                      child:   Table(
                                    border: TableBorder.all(


                                      color: Color.fromRGBO(207, 227, 233, 1),
                                    ),
                                    children: [

                                      TableRow(children: [

                                        Column(children: [

                                          InkWell(

                                            onTap: () {
                                              print('Eliminar....' + ' index ' + index.toString());

                                              GlobalVariables.listFiles.removeAt(index);
                                              Navigator.pushReplacement(
                                                  context,
                                                  PageRouteBuilder(pageBuilder: (context, anim1, anim2) => InventarioLoadFilesScreen(),
                                                    transitionsBuilder: (context, anim1, anim2, child) => Container(child: child),//(context, anim1, anim2, child) => FadeTransition(opacity: anim1, child: child),
                                                    transitionDuration: Duration(seconds: 1),
                                                  )
                                              );

                                            },child:


                                          Container(

                                            padding: EdgeInsets.fromLTRB(350, 15, 0, 0),
                                              child: Icon(Icons.delete, color: Colors.blue),
                                          ),
                                             ),

                                      Container(
                                        padding: EdgeInsets.fromLTRB(30, 5, 0, 0),
                                        height: MediaQuery.of(context).size.height * 0.01,
                                            child: Row ( children: <Widget>[

                                            Icon(Icons.image, color: Colors.blue),
                                            ]
                                            ),
                                          ),


                                          InkWell(

                                            onTap: () {
                                              print('Vista previa....' );

                                              LoginBloc.loadingI(context,true);
                                              Future.delayed(Duration(seconds: 2), () => {

                                                LoginBloc.loadingI(context,false),
                                                showDialog(context: context, builder: (context) => ShowPreviewImage(index,GlobalVariables.listFiles[index]))

                                              });


                                            },
                                            child: SizedBox(

                                                height: MediaQuery.of(context).size.height * 0.03,
                                                child:


                                                Text(GlobalVariables.nameProyectFile + '_'+ GlobalVariables.nameInvenFolioFile.toString()+'_Evidencia_'+index.toString()+'.png',
                                                    maxLines: 2,
                                                    style: TextStyle(fontWeight: FontWeight.bold,
                                                    color: Colors.black,

                                                    fontSize: 16 ,
                                                        decoration:
                                                        TextDecoration.underline)

                                                )
                                            ),

                                          ),




                                        ]

                                        )
                                      ])


                                    ])
                          )

                              ),


                            ],

                          ),
                        ),


                        Align(

                          alignment: Alignment.bottomCenter,
                          child:
                        Container(

                          child:  FlatButton(
disabledColor: Color.fromRGBO(12, 33, 121, 1),
                          color:  Color.fromRGBO(74, 191, 37, 1),
                          child: Text("Guardar Archivos",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                          onPressed: GlobalVariables.listFiles.length > 0 ? (){
                            showAlertDialog(context);
                          }: (){
                            showMessageFiles(context);
                          },
                        ),
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

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancelar"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Aceptar"),
      onPressed: () {
        print('Folio Name::: ' +   GlobalVariables.nameProyectFile);
        LoginBloc.loadingI(context, true);
        Future.delayed(
            Duration(seconds: 3),
            () => {
                  LoginBloc.loadingI(context, false),
                  for (var i = 0; i < GlobalVariables.listFiles.length; i++)
                    (uploadFileASW(GlobalVariables.listFiles[i],
                        GlobalVariables.nameProyectFile + '_'+ GlobalVariables.nameInvenFolioFile.toString() + '_Evidencia_' + i.toString() + '.png')),
                  Navigator.of(context).pop(),
                  GlobalVariables.listFiles.clear(),
                  Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, anim1, anim2) =>
                            InventarioLoadFilesScreen(),
                        transitionsBuilder: (context, anim1, anim2, child) =>
                            Container(child: child),
                        //(context, anim1, anim2, child) => FadeTransition(opacity: anim1, child: child),
                        transitionDuration: Duration(seconds: 2),
                      ))
                });
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Aviso!"),
      content: Text("¿Esta seguro de guardar los archivos permanentemente?."),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  showMessageFiles(BuildContext context) {


    Widget continueButton = FlatButton(
      child: Text("Aceptar"),
      onPressed:  () {

        Navigator.of(context).pop();

      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Aviso!"),
      content: Text("No existen archivos adjuntos!."),
      actions: [

        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  void _pickImage(BuildContext context) async {

      var picture = await ImagePicker.pickImage(source: ImageSource.camera);
      this.setState(() {
        _pickedImage = picture;
      });


    GlobalVariables.listFiles.add(_pickedImage);

    // ignore: unnecessary_statements
    for (var index = 0; index < GlobalVariables.listFiles.length; index++)(
        print('Ruta file:: ' + GlobalVariables.listFiles[index].path)


    );
//    File file = new File("/dir1/dir2/file.ext");
//    Future<String> basename = getFileNameWithExtension(GlobalVariables.listFiles[0].path);
  }
  static Future<String> getFileNameWithExtension(File file)async{

    if(await file.exists()){
      //To get file name without extension
      //path.basenameWithoutExtension(file.path);

      //return file with file extension
      return path.basename(file.path);
    }else{
      return null;
    }
  }

  Future<Function> geNameFile(File file) async {
    String fileNameWithExtension = await getFileNameWithExtension(file);

    print('name file:: ' + fileNameWithExtension);
  }

}

Widget ShowPreviewImage(int index, File _pickedImage) =>
    StreamBuilder<bool>(builder: (context, snap) {


      return AlertDialog(

          backgroundColor: Color.fromRGBO(207, 227, 233, 1),
          scrollable: true,
          title: Column(

            children: <Widget>[
              Text('Vista previa',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(9, 99, 141, 1),
                      fontSize: 26)),


            ],
          ),

          content:
          Column(
              children: <Widget>[
                InkWell(

                  onTap: () {
                    print('Compartir....'+ GlobalVariables.listFiles[index].path);

                    FlutterShareFile.shareImage(GlobalVariables.listFiles[index].path, 'image.png');


                  },
                  child: Container(

                    padding: EdgeInsets.fromLTRB(200, 1, 1, 10),

                    child: Row ( children: <Widget>[

                      Icon(Icons.share, color: Colors.blue),
                    ]
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.20,
                  child: _pickedImage == null ?
                  Text("Sin datos") :
                  Image(image: FileImage(_pickedImage),
                    width: 450, height: 450,),

                ),
                Container(
                    height: MediaQuery.of(context).size.height * 0.03,

                ),
                Container(
                    height: MediaQuery.of(context).size.height * 0.40,
                    child:  getGoogleMaps(context, GlobalVariables.center, GlobalVariables.markers)

                ),

              ])


      );
    });

uploadFileASW(File file, String nameFile) async {
  print('awss3:::::::::::::::::::INICIA::: ');
  print('Ruta archivo::: ' + file.path);
  String uploadedImageUrl = await AmazonS3Cognito.upload(
      file.path,
      "app-despliegue",
      "us-east-2:2b0ec14d-9e91-4e19-bea9-7e5f21f1d801",
      nameFile,
      AwsRegion.US_EAST_2,
      AwsRegion.US_EAST_2);
  print('awss3:::::::::::::::::::Archivo subido correctamente::: ');
}


deleteFileASW(File file, String nameFile) async {
  print('awss3:::::::::::::::::::INICIA::: ');
  print('Ruta archivo::: ' + file.path);
  String uploadedImageUrl = await AmazonS3Cognito.delete(
      "app-despliegue",
      "us-east-2:2b0ec14d-9e91-4e19-bea9-7e5f21f1d801",
      nameFile,
      AwsRegion.US_EAST_2,
      AwsRegion.US_EAST_2);
  print('awss3:::::::::::::::::::Archivo subido correctamente::: ');
}
Widget getGoogleMaps(BuildContext context, LatLng _center, Map<String, Marker> _markers) {
  if(_center != null)
    return Container(
      height: MediaQuery.of(context).size.height * 2.0,
      child:GoogleMap(
        myLocationButtonEnabled: true,
        buildingsEnabled: true,
        myLocationEnabled: true,
        trafficEnabled: true,
        mapType: MapType.hybrid,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 17,
        ),
        markers: _markers.values.toSet(),
      ),
    );
}