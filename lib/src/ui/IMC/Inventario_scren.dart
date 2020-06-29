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
import 'package:isae/src/ui/IMC/InventarioDetalle_scren.dart';
import 'package:isae/src/ui/IMC/PhotoPreviewScreen.dart';
import 'package:isae/src/ui/IMC/InventarioAdd_scren.dart';
import 'package:progress_dialog/progress_dialog.dart';

import 'TablePojo.dart';
class InventarioScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => InventarioScreenState();

}

class InventarioScreenState extends State<InventarioScreen> {
  File _pickedImage;
  LatLng _center ;
  Position currentLocation;
  final Map<String, Marker> _markers = {};

  @override
  void initState(){
    super.initState();



  }

  @override
  Widget build(BuildContext context) {
    DateTime now1 = DateTime.now();
    var currentTime = new DateTime(now1.year, now1.month, now1.day);
    GlobalVariables.dateNow = currentTime.toString();
  print('Cargando App...');
    return Scaffold(
      //key: GlobalVariables.scaffoldKeyIMCR,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
             child: GlobalWidgets.topBar('PROYECTOS ASIGNADOS','Marco Antonio Moreno Silva', context, '$currentTime'.substring(0,10)),

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
//                          child:  Text('PROYECTOS ASIGNADOS',
//                              textAlign: TextAlign.center,
//                              style: TextStyle(
//                                  fontWeight: FontWeight.bold,
//                                  color: Color.fromRGBO(9, 99, 141, 1),
//                                  fontSize: 26)),
//
//                        ),

//                    InkWell(
//                      onTap: () {
//                        print('Agregar Proyecto    ');
//                        showDialog(context: context, builder: (context) => addProyect());
//
//                      }, // handle your onTap here
//                      child: new Icon(Icons.add_circle,color:  Color.fromRGBO(9, 99, 141, 1)),
//                    ),
                      /*  Container(
                          height: MediaQuery.of(context).size.height * 0.20,
                          child: _pickedImage == null ?
                          Text("Sin datos") :
                          Image(image: FileImage(_pickedImage),
                            width: 450, height: 450,),

                        ),

                        Container(
                          height: MediaQuery.of(context).size.height * 0.20,
                          child:  getGoogleMaps(context, _center, _markers)

                        ),*/

                    Container(

                          color: Color.fromRGBO(12, 160, 219, 1), // cOLORE DE FONDO CAMBIAR
                          child: Column(
                            children: <Widget>[
                              //--------var es------------
                              Container(
                                color: Color.fromRGBO(207, 227, 233, 1),
                                child: getProyects(context, GlobalVariables.listProyects),
                              ),
                            ],
                          ),
                        ),


//                      Container(
//                          height: MediaQuery.of(context).size.height * 0.20,
//                          child: _pickedImage == null ?
//                          Text("Sin datos") :
//                          Image(image: FileImage(_pickedImage),
//                            width: 200, height: 200,),
//
//                        ),
//                        Container(
//                          height: MediaQuery.of(context).size.height * 0.05,
//
//                        ),
//                        Container(
//                          height: MediaQuery.of(context).size.height * 0.20,
//                          child:  getGoogleMaps(context, _center, _markers)
//
//                        ),




//                        Container(
//                          height: MediaQuery
//                              .of(context)
//                              .size
//                              .height * 100,
//                          color: Color(0xFF8E8F94),
//                          child: Column(
//                            children: <Widget>[
//                              //--------var es------------
//                              Container(
//                                color: Color.fromRGBO(207, 227, 233, 1),
//                                child: getBodyTablePrueba(context),
//                              ),
//                            ],
//                          ),
//                        ),


                        //------------Tables------------
//                        Container(
//                          height: MediaQuery
//                              .of(context)
//                              .size
//                              .height * 0.40,
//                          color: Color(0xFF8E8F94),
//                          child: Column(
//                            children: <Widget>[
//                              //--------var es------------
//                              Container(
//                                color: Colors.white,
//                                child: getBodyWidget(context),
//                              ),
//                            ],
//                          ),
//                        ),
                      ],
                    ),
                  ),
                ),
              ),
//              //----------BottomBar---------
//              Container(
//                height: MediaQuery.of(context).size.height * 0.12,
//                decoration: GlobalStyles.lineTop(3.0),
//                child: Row(
//                  children: <Widget>[
//                    Container(
//                      width: MediaQuery.of(context).size.width / 3.0,
//                      //color: Colors.red,
//                      child: FlatButton(
//                        //color: Colors.white,
//                        child: Image(image: new AssetImage('assets/images/graphModules.png'),
//                          width: 50, height: 50,),
//                        onPressed: (){},
//                      ),
//                    ),
//                    Container(
//                      width: MediaQuery.of(context).size.width / 3.0,
//                      //color: Colors.blue,
//                      child: FlatButton(
//                        //color: Colors.white,
//                        child: Image(image: new AssetImage('assets/images/cancelModules.png'),
//                          width: 50, height: 50,),
//                        onPressed: (){},
//                      ),
//                    ),
//                    Container(
//                      width: MediaQuery.of(context).size.width / 3.0,
//                      //color: Colors.amber,
//                      child: FlatButton(
//                        //color: Colors.white,
//                        child: Image(image: new AssetImage('assets/images/barChart.png'),
//                          width: 50, height: 50,),
//                        onPressed: (){},
//                      ),
//                    ),
//                  ],
//                ),
//              ),
            ],
          ),
        ),
      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _pickImage,
//        child: Icon(Icons.image),
//      ),
    );


  }
  void _pickImage() async {
    final imageSource = await showDialog<ImageSource>(
        context: context,
        builder: (context) =>
            AlertDialog(
              title: Text("Seleccione una imagen"),
              actions: <Widget>[
                MaterialButton(
                  child: Text("Camara"),
                  onPressed: () => Navigator.pop(context, ImageSource.camera),
                ),
                MaterialButton(
                  child: Text("Galeria"),
                  onPressed: () => Navigator.pop(context, ImageSource.gallery),
                )
              ],
            )
    );
    if(imageSource != null) {
      final file = await ImagePicker.pickImage(source: imageSource);
      if(file != null) {
        setState(() => _pickedImage = file);
      }
      uploadFileASW(file);
      getUserLocation();
      getGoogleMaps(context, _center, _markers);
    }

  }
  Widget getBodyUploadFile(BuildContext context, LatLng _center, Map<String, Marker> _markers) {
    return   Container(
      height: MediaQuery.of(context).size.height * 1.0,
      child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  new Align(
                    alignment: Alignment.bottomCenter,
                    child: new SizedBox(
                      width: 50.0,
                      height: 45.0,
                      child: new RaisedButton(
                        padding: const EdgeInsets.all(10.0),
                        onPressed: (){
                          _pickImage();
                        },
                        color: Color.fromRGBO(170, 214, 225, 1),
                        child: new Icon(Icons.unarchive,color:  Color.fromRGBO(9, 99, 141, 1)),
                        shape: RoundedRectangleBorder(side: BorderSide(
                            color: Color.fromRGBO(0, 131, 186, 1),
                            width: 3,
                            style: BorderStyle.solid
                        ),
                          borderRadius: BorderRadius.circular(50),),
                      ),
                    ),

                  ),
                ]
            ),
            /* Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              new Align(
                alignment: Alignment.bottomLeft,
                child: new SizedBox(
                  width: 50.0,
                  height: 45.0,
                  child:  new RaisedButton(
                    padding: const EdgeInsets.all(10.0),
                    onPressed: (){},
                    color: Color.fromRGBO(170, 214, 225, 1),
                    child: new Icon(Icons.mode_edit,color: Color.fromRGBO(9, 99, 141, 1),),
                    shape: RoundedRectangleBorder(side: BorderSide(
                        color: Color.fromRGBO(0, 131, 186, 1),
                        width: 3,
                        style: BorderStyle.solid
                    ),
                      borderRadius: BorderRadius.circular(50),),
                  ),
                ),
              ),
            ],
          ),

          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              new Align(
                alignment: Alignment.bottomLeft,
                child: new SizedBox(
                  width: 50.0,
                  height: 45.0,
                  child:  new RaisedButton(
                    padding: const EdgeInsets.all(10.0),
                    onPressed: (){
                      showDialog(context: context, builder: (context) =>  getGoogleMaps(context, _center, _markers));
                    },
                    color: Color.fromRGBO(170, 214, 225, 1),
                    child: Image(image: new AssetImage('assets/images/list.png'),color:  Color.fromRGBO(9, 99, 141, 1)),
                    shape: RoundedRectangleBorder(side: BorderSide(
                        color: Color.fromRGBO(0, 131, 186, 1),
                        width: 3,
                        style: BorderStyle.solid
                    ),
                      borderRadius: BorderRadius.circular(50),),
                  ),
                ),
              ),
            ],
          ),
*/
          ]
      ),
    );
  }

  uploadFileASW(File file) async {
    print('awss3:::::::::::::::::::INICIA::: ');
    print('Ruta archivo::: ' + file.path);
    String uploadedImageUrl = await AmazonS3Cognito.upload(
        file.path,
        "app-despliegue",
        "us-east-2:2b0ec14d-9e91-4e19-bea9-7e5f21f1d801",
        "prueba.jpg",
        AwsRegion.US_EAST_2,
        AwsRegion.US_EAST_2);
    print('awss3:::::::::::::::::::TERMINA::: ');
  }
  Future<Position> locateUser() async {
    return Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  getUserLocation() async {
    currentLocation = await locateUser();
    setState(() {
      _center = LatLng(currentLocation.latitude, currentLocation.longitude);
    });
    print('Ubicacion de la Foto:::: $_center');
  }


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
 numeroPar(int index) async{
  if ((index % 2) == 0){
    print(index.toString() + ' es par');
  }else{
    print(index.toString() + ' es impar');
  }

}
Widget getProyects(BuildContext context , List<Proyects> listaProyects) {
  DateTime now1 = DateTime.parse("2020-05-20 20:18:00");
  var currentTime1 =
      new DateTime(now1.year, now1.month, now1.day, now1.hour, now1.minute);
  //print('$currentTime1');
  DateTime now2 = DateTime.parse("2020-05-21 16:14:00");
  var currentTime2 =
      new DateTime(now2.year, now2.month, now2.day, now2.hour, now2.minute);
  //print('$currentTime2');
  DateTime now3 = DateTime.parse("2020-05-15 19:42:00");
  var currentTime3 =
      new DateTime(now3.year, now3.month, now3.day, now3.hour, now3.minute);
  //print('$currentTime3');
    var color1 = Colors.amberAccent;
  var color2 = Colors.deepOrange;


  return Container(
    color: Color.fromRGBO(207, 227, 233, 1),

    padding: EdgeInsets.all(20),

    child: Column(children: <Widget>[

    for(var index = 0; index < listaProyects.length; index++)(


        InkWell(
          onTap: () {
            LoginBloc.loadingI(context,true);
            loadAllDatesIMC(context,listaProyects,index);
            Future.delayed(Duration(seconds: 3), () => {

              LoginBloc.loadingI(context,false),
              showDialog(context: context, builder: (context) => ShowInventarioForProyect(index))

            });

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

        child: Row(children: <Widget>[

          Text(listaProyects[index].descripcion,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 13)),
          new Icon(Icons.assignment,color: Colors.white),
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(1, 1, 1, 10),
              alignment: Alignment.bottomRight,
              child: Text('$currentTime1'.substring(0,10),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 11, color: Colors.white)),
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



            searchFolio(),

          ],
        ),

        content: Container(


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

Widget searchFolio() => StreamBuilder<bool>(

  builder: (context, snap){
    return TextField(

      onChanged: (text) {
        //print("First text field: $text");

        getListInventarioKeyPreseed(context, GlobalVariables.listIventario, text);
      },
      textCapitalization: TextCapitalization.characters,
      autocorrect: false,
      textAlign: TextAlign.center,
      cursorColor: Colors.black,
      //maxLength: 8,
        //  decoration: GlobalStyles.decorationTFLogin('Escriba aqui...'),
    );
  },
);

getListInventarioKeyPreseed(BuildContext context, List<Inventario> listaInventario, String text) async{
  //print('Lista a buscar' + listaInventario.length.toString()+ ' texttt '+ text );
  var  nameJ = listaInventario.where((inventario) => inventario.folio.contains(text));
  // var list =  nameJ as List;
   var countList = nameJ.toList().length;

  GlobalVariables.listIventarioSearch = nameJ.toList();
  print(GlobalVariables.listIventarioSearch.length);

//
//  List<Inventario> listInventario = new List<Inventario>();
//  List<Inventario> listInventarioAll = new List<Inventario>();
//  listInventarioAll =  GlobalVariables.listIventario;
//  Inventario inventario = null;
// for(var index = 0; index < GlobalVariables.listIventarioSearch.length; index++) {
//   inventario = new  Inventario(GlobalVariables.listIventarioSearch[index].folio,'');
//   listInventario.add(inventario);
//
// }
//
//  GlobalVariables.listIventario = listInventario;
//  print('NUEVA FILTRO BUSCAR:::: '+  GlobalVariables.listIventario.length.toString());
}
Widget getBodyTablePrueba(BuildContext context) {
  getDataTable();
  if(GlobalVariables.listTableInven.isNotEmpty)
    return   Container(
      height: MediaQuery.of(context).size.height * 2.0,

      child: Center(
        child: Column(children: <Widget>[
          Container(
            margin: EdgeInsets.all(20),
            child: Table(
              border: TableBorder.all(width: 1.8, color:  Color.fromRGBO(207, 227, 233, 1),),

              children: [

                TableRow(children: [
                  Column(children: [
                    Container(
                      child: Text(GlobalVariables.listFirtColumn[0],
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 14)),
                      padding: EdgeInsets.fromLTRB(10, 15, 15, 5),
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(16, 175, 205, 1),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40.0),
                              bottomRight: Radius.circular(10.0))),
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.08,
                    )
                  ]),
                ]),
                TableRow(children: [
                  Container(
                    child: Text(GlobalVariables.listTableInven[0].get_fecha,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 12)),
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(131, 198, 219, 1),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0))),
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.06,
                  )
                ]),


                TableRow(children: [
                  Column(children: [
                    Container(
                      child: Text(GlobalVariables.listFirtColumn[1],
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 14)),
                      padding: EdgeInsets.fromLTRB(10, 15, 15, 5),
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(16, 175, 205, 1),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40.0),
                              bottomRight: Radius.circular(10.0))),
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.08,
                    )
                  ]),
                ]),
                TableRow(children: [
                  Container(
                    child: Text(GlobalVariables.listTableInven[0].get_descripcion,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 12)),
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(131, 198, 219, 1),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0))),
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.06,
                  )
                ]),

                TableRow(children: [
                  Column(children: [
                    Container(
                      child: Text(GlobalVariables.listFirtColumn[2],
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 14)),
                      padding: EdgeInsets.fromLTRB(10, 15, 15, 5),
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(16, 175, 205, 1),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40.0),
                              bottomRight: Radius.circular(10.0))),
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.08,
                    )
                  ]),
                ]),
                TableRow(children: [
                  Container(
                    child: Text(GlobalVariables.listTableInven[0].get_estatus,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 12)),
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(131, 198, 219, 1),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0))),
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.06,
                  )
                ]),

                TableRow(children: [
                  Column(children: [
                    Container(
                      child: Text(GlobalVariables.listFirtColumn[3],
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 14)),
                      padding: EdgeInsets.fromLTRB(10, 15, 15, 5),
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(16, 175, 205, 1),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40.0),
                              bottomRight: Radius.circular(10.0))),
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.08,
                    )
                  ]),
                ]),
                TableRow(children: [
                  Container(
                    child: Text(GlobalVariables.listTableInven[0].get_importe,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 12)),
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(131, 198, 219, 1),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0))),
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.06,
                  )
                ]),

                TableRow(children: [
                  Column(children: [
                    Container(
                      child: Text(GlobalVariables.listFirtColumn[4],
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 14)),
                      padding: EdgeInsets.fromLTRB(10, 15, 15, 5),
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(16, 175, 205, 1),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40.0),
                              bottomRight: Radius.circular(10.0))),
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.08,
                    )
                  ]),
                ]),
                TableRow(children: [
                  Container(
                    child: Text(GlobalVariables.listTableInven[0].get_vip,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 12)),
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(131, 198, 219, 1),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0))),
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.06,
                  )
                ]),

                TableRow(children: [
                  Column(children: [
                    Container(
                      child: Text(GlobalVariables.listFirtColumn[5],
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 14)),
                      padding: EdgeInsets.fromLTRB(10, 15, 15, 5),
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(16, 175, 205, 1),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40.0),
                              bottomRight: Radius.circular(10.0))),
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.08,
                    )
                  ]),
                ]),
                TableRow(children: [
                  Container(
                    child: Text(GlobalVariables.listTableInven[0].get_puesto,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 12)),
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(131, 198, 219, 1),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0))),
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.06,
                  )
                ]),




              ],
            ),
          ),


        ]),

      ),


    );
}


void getDataTable()async{
  List<TablePojo> listTable = List<TablePojo>();
  listTable.add(new TablePojo('JONATHAN','VILLA PEREZ','JONATHAN VILLA PEREZ','123456','N0','JEFE DE DEPARTAMENTO')) ;
 GlobalVariables.listTableInven = listTable;
  print("Lista:::: " + listTable.toString());
}

//

List<Widget> _getTitleWidget(BuildContext ctx){
  return [
    /*FlatButton(
      padding: EdgeInsets.all(0),
      child: _getTitleItemWidget('Conceptos', ctx, 0.30, 0.05),
      onPressed: () {
        /*sortType = sortName;
          isAscending = !isAscending;
          user.sortName(isAscending);
          setState(() {

          });*/
      },
    ),
    FlatButton(
      padding: EdgeInsets.all(0),
      child: _getTitleItemWidget('Año anterior', ctx, 0.15, 0.05),
      onPressed: () {
        /*sortType = sortStatus;
          isAscending = !isAscending;
          user.sortStatus(isAscending);
          setState(() {

          });*/
      },
    ),*/
    _getTitleItemWidget('Conceptos', ctx, 0.30, 0.06, Alignment.center),
    _getTitleItemWidget('Año anterior', ctx, 0.15, 0.06, Alignment.center), //Alignment.centerRight
    _getTitleItemWidget('Mes anterior', ctx, 0.15, 0.06, Alignment.center),
    _getTitleItemWidget('Mes actual', ctx, 0.15, 0.06, Alignment.center),
    _getTitleItemWidget('Variación mes anterior', ctx, 0.20, 0.06, Alignment.center),
    _getTitleItemWidget(' % ', ctx, 0.10, 0.06, Alignment.center),
    _getTitleItemWidget('Variación año anterior', ctx, 0.20, 0.06, Alignment.center),
    _getTitleItemWidget(' % ', ctx, 0.10, 0.06, Alignment.center),
  ];
}

Widget _getTitleItemWidget(String label, BuildContext ctx, double w, double h, Alignment alg){
  return Container(
    child: Text(label, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
    width: MediaQuery.of(ctx).size.width * w, //width,
    height:  MediaQuery.of(ctx).size.height * h,//56,
    padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
    alignment: alg,
    color: Color(0xFF84e33),
  );
}



Widget _generateRightHandSideColumnRow(BuildContext ctx, int index) {
  return Row(
    children: <Widget>[
      Container(
        child: Text(GlobalStyles.numFormat.format(double.parse(GlobalVariables.anioAnt[index]))/*GlobalVariables.anioAnt[index]*/),
        //width: 200,
        //height: 52,
        height: MediaQuery.of(ctx).size.height * 0.06,
        width: MediaQuery.of(ctx).size.width * 0.15,
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.centerRight,

      ),
      Container(
        child: Text(GlobalStyles.numFormat.format(double.parse(GlobalVariables.monthAnt[index]))/*GlobalVariables.monthAnt[index]*/),
        //width: 200,
        //height: 52,
        height: MediaQuery.of(ctx).size.height * 0.06,
        width: MediaQuery.of(ctx).size.width * 0.15,
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.centerRight,
      ),
      Container(
        child: Text(GlobalStyles.numFormat.format(double.parse(GlobalVariables.monthAct[index]))/*GlobalVariables.monthAct[index]*/),
        //width: 100,
        //height: 52,
        height: MediaQuery.of(ctx).size.height * 0.06,
        width: MediaQuery.of(ctx).size.width * 0.15,
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.centerRight,
      ),
      Container(
        child: Text(GlobalStyles.numFormat.format(double.parse(GlobalVariables.varMonthAn[index]))/*GlobalVariables.varMonthAn[index]*/),
        //width: 200,
        //height: 52,
        height: MediaQuery.of(ctx).size.height * 0.06,
        width: MediaQuery.of(ctx).size.width * 0.20,
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.centerRight,
      ),
      Container(
        child: Text(GlobalVariables.percentM[index]+'%'),
        //width: 200,
        //height: 52,
        height: MediaQuery.of(ctx).size.height * 0.06,
        width: MediaQuery.of(ctx).size.width * 0.10,
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.centerRight,
      ),
      Container(
        child: Text(GlobalStyles.numFormat.format(double.parse(GlobalVariables.varAnioAn[index]))/*GlobalVariables.varAnioAn[index]*/),
        //width: 200,
        //height: 52,
        height: MediaQuery.of(ctx).size.height * 0.06,
        width: MediaQuery.of(ctx).size.width * 0.20,
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.centerRight,
      ),
      Container(
        child: Text(GlobalVariables.percentA[index]+'%'),
        //width: 200,
        //height: 52,
        height: MediaQuery.of(ctx).size.height * 0.06,
        width: MediaQuery.of(ctx).size.width * 0.10,
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.centerRight,
      ),
    ],
  );
}
Widget getAddProyects(BuildContext context ) {
  DateTime now1 = DateTime.parse("2020-05-20 20:18:00");
  var currentTime1 =
  new DateTime(now1.year, now1.month, now1.day, now1.hour, now1.minute);
  print('$currentTime1');
  DateTime now2 = DateTime.parse("2020-05-21 16:14:00");
  var currentTime2 =
  new DateTime(now2.year, now2.month, now2.day, now2.hour, now2.minute);
  print('$currentTime2');
  DateTime now3 = DateTime.parse("2020-05-15 19:42:00");
  var currentTime3 =
  new DateTime(now3.year, now3.month, now3.day, now3.hour, now3.minute);
  print('$currentTime3');
  var color1 = Colors.amberAccent;
  var color2 = Colors.deepOrange;


  return Container(
    color: Color.fromRGBO(207, 227, 233, 1),

    padding: EdgeInsets.all(20),

    child: Column(children: <Widget>[


          InkWell(
            onTap: () {
              print("ver...::");
            }, // handle your onTap here
            child: Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(9, 99, 141, 1),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0))),
              height: MediaQuery.of(context).size.height * 0.08,
              child: Row(children: <Widget>[

                Text(GlobalVariables.addProyect,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 13)),
                new Icon(Icons.assignment,color: Colors.white),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(1, 1, 15, 10),
                    alignment: Alignment.bottomRight,
                    child: Text('$currentTime1'.substring(0,10),
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 11, color: Colors.white)),
                  ),
                ),
              ]),
            ),
            // ),
          )

    ]),
  );
}
//
//Widget addProyect() =>
//    StreamBuilder<bool>(builder: (context, snap) {
//
//
//      return AlertDialog(
//
//        backgroundColor: Color.fromRGBO(207, 227, 233, 1),
//        scrollable: true,
//        title: Column(
//
//          children: <Widget>[
//            Text('AGREGAR PRPOYECTO',
//                textAlign: TextAlign.center,
//                style: TextStyle(
//                    fontWeight: FontWeight.bold,
//                    color: Color.fromRGBO(9, 99, 141, 1),
//                    fontSize: 23)),
//          ],
//        ),
//
//        content: Container(
//          padding: EdgeInsets.all(20),
//          color: Color.fromRGBO(178, 222, 235, 1),
//          child: Column(
//            children: <Widget>[
//                  Column(
//                    children: <Widget>[
//                      Row(
//                        children: <Widget>[
//                          Icon(Icons.arrow_forward_ios, color: Colors.blue),
//                        ],
//                      ),TextField(
//                        onChanged: (text) {
//                          print("nOMBRE: DEL NUEVO PROYECT::  $text");
//                          GlobalVariables.addProyect = text;
//                        },
//                        style: TextStyle(
//                            fontWeight: FontWeight.bold,
//                            color: Color.fromRGBO(9, 99, 141, 1),
//                            fontSize: 17),
//                        cursorColor: Color.fromRGBO(9, 99, 141, 1),
//                        autocorrect: false,
//                        decoration:  GlobalStyles.decorationTFLogin('Nombre del proyecto'),
//                      ),
//                    ],
//                  ),
//
//                         Container(
//                          height: MediaQuery.of(context).size.height * 0.05,
//
//                        ),
//              Material(
//                elevation: 5.0,
//                //borderRadius: BorderRadius.circular(30.0),
//                color:  Color.fromRGBO(74, 191, 37, 1),
//                child: MaterialButton(
//
//                  //padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//                  onPressed: () async {
//
//                    print("Guardar::::...... " + GlobalVariables.addProyect);
//                    Navigator.pushReplacement(
//                        context,
//                        PageRouteBuilder(pageBuilder: (context, anim1, anim2) => ProyectAddScreen(),
//                          transitionsBuilder: (context, anim1, anim2, child) => Container(child: child),//(context, anim1, anim2, child) => FadeTransition(opacity: anim1, child: child),
//                          transitionDuration: Duration(seconds: 1),
//                        )
//                    );
//
//                  },
//                  textColor: Colors.white,
//                  child: Text("Guardar",
//                    textAlign: TextAlign.center,
//                    style: TextStyle(fontWeight: FontWeight.bold),
//                  ),
//                ),
//              ),
//
//            ],
//          ),
//        ),
//      );
//    });


