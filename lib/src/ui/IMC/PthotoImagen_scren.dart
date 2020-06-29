import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:isae/src/ui/IMC/Inventario_scren.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';

import 'package:amazon_s3_cognito/amazon_s3_cognito.dart';
import 'package:amazon_s3_cognito/aws_region.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:isae/src/complements/globalStyles.dart';
import 'package:isae/src/complements/globalWidgets.dart';
import 'package:isae/src/complements/globalVariables.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// Una pantalla que permite a los usuarios tomar una fotografía utilizando una cámara determinada.
class TakePictureScreen extends StatefulWidget {
  final CameraDescription camera;

  const TakePictureScreen({
    Key key,
    @required this.camera,
  }) : super(key: key);

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  CameraController _controller;
  Future<void> _initializeControllerFuture;


  @override
  void initState() {
    super.initState();
    // Para visualizar la salida actual de la cámara, es necesario
    // crear un CameraController.
    _controller = CameraController(
      // Obtén una cámara específica de la lista de cámaras disponibles
      widget.camera,
      // Define la resolución a utilizar
      ResolutionPreset.medium,

    );
    getUserLocation();
    // A continuación, debes inicializar el controlador. Esto devuelve un Future!
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Asegúrate de deshacerte del controlador cuando se deshaga del Widget.
    _controller.dispose();
    super.dispose();
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tomar Foto')),
      // Debes esperar hasta que el controlador se inicialice antes de mostrar la vista previa
      // de la cámara. Utiliza un FutureBuilder para mostrar un spinner de carga
      // hasta que el controlador haya terminado de inicializar.
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // Si el Future está completo, muestra la vista previa
            return CameraPreview(_controller);
          } else {
            // De lo contrario, muestra un indicador de carga
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt),
        // Agrega un callback onPressed
        onPressed: () async {
          // Toma la foto en un bloque de try / catch. Si algo sale mal,
          // atrapa el error.
          try {
            // Ensure the camera is initialized
            await _initializeControllerFuture;

            // Construye la ruta donde la imagen debe ser guardada usando
            // el paquete path.
            final path = join(

              //
              (await getTemporaryDirectory()).path,
              '${DateTime.now()}.png',
            );

            // Attempt to take a picture and log where it's been saved
            await _controller.takePicture(path);

            // En este ejemplo, guarda la imagen en el directorio temporal. Encuentra
            // el directorio temporal usando el plugin `path_provider`.
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(imagePath: path),
              ),
            );
          } catch (e) {
            // Si se produce un error, regístralo en la consola.
            print(e);
          }
        },
      ),

    );
  }




}

// Un Widget que muestra la imagen tomada por el usuario
class DisplayPictureScreen extends StatelessWidget {



  final String imagePath;

  DisplayPictureScreen({Key key, this.imagePath}) : super(key: key);
  @override
  void initState(){
    getUserLocation();
  }

  Future<Position> locateUser() async {
    return Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  getUserLocation() async {
    GlobalVariables.currentLocation = await locateUser();

    GlobalVariables.center = LatLng(GlobalVariables.currentLocation.latitude, GlobalVariables.currentLocation.longitude);


    print('Ubicacion de la Foto:::: '+ GlobalVariables.center.toString());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Foto de Incio de sesiòn')),
      // La imagen se almacena como un archivo en el dispositivo. Usa el
      // constructor `Image.file` con la ruta dada para mostrar la imagen
      body:
      Material(
        child: Container(
          color: Color.fromRGBO(207, 227, 233, 1),
          child: Column(
            children: <Widget>[

              Image.file(File(imagePath),width: 250, height: 250),



              Container(
                height: MediaQuery.of(context).size.height * 0.03,

              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.40,
                  child:  getGoogleMaps(context, GlobalVariables.center, GlobalVariables.markers)

              ),

              Container(
                height: MediaQuery.of(context).size.height * 0.03,

              ),

              Material(
                elevation: 5.0,
                //borderRadius: BorderRadius.circular(30.0),
                color:  Color.fromRGBO(74, 191, 37, 1),
                child: MaterialButton(

                  //padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  onPressed: () async {

                    print("Inicio::::...... ");

                    Future.delayed(Duration(seconds: 2), () => {

                      Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(pageBuilder: (context, anim1, anim2) => InventarioScreen(),
                            transitionsBuilder: (context, anim1, anim2, child) => Container(child: child),//(context, anim1, anim2, child) => FadeTransition(opacity: anim1, child: child),
                            transitionDuration: Duration(seconds: 1),
                          )
                      )

                    });
                    //Navigator.pop(context);

                  },
                  textColor: Colors.white,
                  child: Text("Guardar",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
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