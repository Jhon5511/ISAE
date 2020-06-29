
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:isae/src/blocs/IMC/imcR_bloc.dart';
import 'package:isae/src/blocs/login_bloc.dart';
import 'package:isae/src/complements/globalStyles.dart';
import 'package:isae/src/complements/globalVariables.dart';
import 'package:flutter/services.dart';
import 'package:isae/src/ui/loginUpdatePass_screen.dart';
import 'package:local_auth/local_auth.dart';
import 'package:isae/src/database/userData_database.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginScreenState();
}
class LoginScreenState extends State<LoginScreen> {

  //-----------------------Authentication Biometrics----------------------------
  final LocalAuthentication _localAuthentication = LocalAuthentication();

  Future<bool> _isBiometricAvailable() async {
    bool isAvailable = false;
    try {
      isAvailable = await _localAuthentication.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }

    if (!mounted) return isAvailable;

    isAvailable
        ? print('Biometric is available!')
        : print('Biometric is unavailable.');

    return isAvailable;
  }

  Future<void> _getListOfBiometricTypes() async {
    List<BiometricType> listOfBiometrics;
    try {
      listOfBiometrics = await _localAuthentication.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }

    if (!mounted) return;

    print(listOfBiometrics);
  }

  Future<void> _authenticateUser() async {
    bool isAuthenticated = false;
    try {
      isAuthenticated = await _localAuthentication.authenticateWithBiometrics(

        localizedReason:
        "Por favor auntentíquese para continuar",
        useErrorDialogs: true,
        stickyAuth: true,
      );
    } on PlatformException catch (e) {
      print(e);
    }

    if (!mounted) return;

    isAuthenticated
        ? print('User is authenticated!')
        : print('User is not authenticated.');

    if (isAuthenticated) {
      if(GlobalVariables.textNEmp.text.length == 0  || GlobalVariables.textPass.text.length == 0){
        print('Sin login');
      } else {
        print('login correcto');
        //show IMC:
        LoginBloc.login(context,1);
      }
    }
  }

  Future _idTouch() async {
    //Prueba:
    final dbHelper = UserDataDatabase.instance;
    final countInfo = await dbHelper.queryRowCount();

    if(countInfo != 0) {
      if(await _isBiometricAvailable()){
        await _getListOfBiometricTypes();
        await _authenticateUser();
      }
    } else {
      print('sin datos - no idTouch');
    }

  }

  //----------------------------------------------------------------------------

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState(){
    super.initState();
    //insert datas in textfields

    LoginBloc.insertData();
    //Show iDTouch:
    //_idTouch();
    getUserLocation();
  }

  @override
  Widget build(BuildContext context) {

    return Material(
      color:  Colors.white,
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //------------Tittle------------
          Flexible(
            flex: 1,
            child: Container(
              color:  Colors.white,
              width: MediaQuery.of(context).size.width * 0.70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 50),
                  titleLogin(),
                  //leyendCorporation(),
                ],
              ),
            ),
          ),
          //------------Image&TextFields------------
          Flexible(

            child: Container(
              color: Color.fromRGBO(207, 227, 233, 1),
              //------Image:

              //------TextField:
              child: Container(
                color: Color.fromRGBO(207, 227, 233, 1),
                width: MediaQuery.of(context).size.width * 0.9,
                margin: EdgeInsets.only(top: 50),
                //----shadow----:
                //----textF in center---:
                child: Container(
                  color:  Colors.white,
                  margin: EdgeInsets.only(left: 50.0, right: 50.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      noEmpF(),
                      passwordF(),
                    ],
                  ),
                ),
                //height: MediaQuery.of(context).size.height * 0.4,
              ),
            ),
          ),
          //------------LoginButton------------


      Container(
        width: MediaQuery.of(context).size.width * 0.9,
        padding: EdgeInsets.fromLTRB(0, 10, 1, 1),
            color:  Color.fromRGBO(207, 227, 233, 1),
            child: FlatButton(
              child: Image(image: new AssetImage('assets/images/huella2.png'),
                  width: 60, height: 60),
              onPressed: (){
                _idTouch();
              },
            ),
      ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            padding: EdgeInsets.fromLTRB(0, 10, 1, 1),
            color:  Color.fromRGBO(207, 227, 233, 1),
            child: MaterialButton(
              minWidth: MediaQuery.of(context).size.width / 2,
              //padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              onPressed: () async {

                LoginBloc.login(context,2);

              },
              textColor: Colors.blue,
              child:

              Text('¿Olvidaste tu contraseña?',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold,   decoration:
                TextDecoration.underline),
              ),
            ),
          ),
          Flexible(
            //flex: 1,
            child: Container(
              color:  Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Material(
                    elevation: 5.0,
                    //borderRadius: BorderRadius.circular(30.0),
                    color: Color.fromRGBO(36, 90, 149, 1),
                    child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width / 2,
                      //padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      onPressed: () async {
                        //_addUser();
                        LoginBloc.login(context,1);
                      },
                      textColor: Colors.white,
                      child: Text("INGRESAR",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),

                  //loginButton()
                ],
              ),
            ),
          ),

        ],
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

Widget titleLogin() => StreamBuilder<bool>(
  builder: (context, snap){

    return Row(
      children: <Widget>[
        Container(
          alignment: Alignment.bottomRight,
          child:  ClipRRect(

            borderRadius: BorderRadius.circular(80.0),
            child: Image.asset(
              'assets/images/Logo_ISAe.png',
              width: 200.0,
              height: 100.0,

            ),
          ),

        ),
//        Container(
//
//          child: GlobalStyles.titleLogin('ISAE'),
////        GlobalStyles.titleLogin(' S'),
////        GlobalStyles.titleLogin(' A'),
////        GlobalStyles.titleLogin(' E'),
//
//        ),

      ],


    );
  },
);

Widget leyendCorporation() => StreamBuilder<bool>(
  builder: (context, snap){
        return Row(
          children: <Widget>[

            Container(

            child: Text('BUSINESS, TECHNOLOGY AND SYSTEMS', maxLines: 2, textAlign: TextAlign.left, style: TextStyle(fontSize: 11,   color: Color.fromRGBO(36, 90, 149, 1))),
        ),
          ],
        );
      },
    );

Widget imageProfile() => StreamBuilder<bool>(
    builder: (context, snap){
      return Image(
        fit: BoxFit.cover,
        image: new AssetImage('assets/images/foto.png'),
        height: 80,
        width: 60,
      );
    },
);

Widget noEmpF() => StreamBuilder<bool>(
    builder: (context, snap){
      return TextField(
        controller: GlobalVariables.textNEmp,
//        keyboardType: TextInputType.number,
        autocorrect: false,
        textAlign: TextAlign.center,
        cursorColor: Colors.blue,
        //maxLength: 8,
        decoration: GlobalStyles.decorationTFLogin('Usuario'),
      );
    },
);

Widget passwordF() => StreamBuilder<bool>(
  builder: (context, snap){
    return TextField(
      controller: GlobalVariables.textPass,
      autocorrect: false,
      textAlign: TextAlign.center,
      obscureText: true,
      cursorColor:  Colors.blue,
      decoration: GlobalStyles.decorationTFLogin('Contraseña'),
    );
  },
);

Widget loginButton() => StreamBuilder<bool>(
  builder: (context, snap){
    return Material(
      elevation: 5.0,
      //borderRadius: BorderRadius.circular(30.0),
      color:  Colors.blue,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width / 2,
        //padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
          //_addUser();
          LoginBloc.login(context,1);
        },
        textColor: Colors.blue,
        child: Text("INGRESAR",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  },
);
