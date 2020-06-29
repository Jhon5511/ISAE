import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:horizontal_data_table/horizontal_data_table.dart';
////import 'package:isae/src/ui/imcR_scren.dart';
import 'package:isae/src/ui/login_screen.dart';
import 'blocs/authorization_bloc.dart';

class App extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
//    SystemChrome.setPreferredOrientations([
//      DeviceOrientation.landscapeLeft,
//      DeviceOrientation.landscapeRight
//    ]);
    authBloc.restoreSession();
    return MaterialApp(
      title: 'Login Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: createContent(),
    );
  }

  createContent() {
    //return Text('Login Demo app');
    return StreamBuilder<bool> (
        stream: authBloc.isSessionValid,
        builder: (context, AsyncSnapshot<bool> snapshot){
          if (snapshot.hasData && snapshot.data) {
            //return HomeScreen();
          }
          return LoginScreen();
          //return ImcRScreen();
        });
  }

}
