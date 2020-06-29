import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'src/app.dart';

Future main() async {
  //runApp(App());
  WidgetsFlutterBinding.ensureInitialized();
/*  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight])
  .then((_){
    runApp(App());
  });*/

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown])
      .then((_){
    runApp(App());
  });
}