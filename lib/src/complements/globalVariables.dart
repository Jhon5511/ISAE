
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:isae/src/models/Auxiliar.dart';
import 'package:isae/src/models/Benchmarking/bench_models.dart';
import 'package:isae/src/models/General/gnrl_models.dart';
import 'package:isae/src/models/Inventario.dart';
import 'package:isae/src/models/InventarioAgrupado.dart';
import 'package:isae/src/models/InventarioDetalleAgrupado.dart';
import 'package:isae/src/models/Proyects.dart';
import 'package:isae/src/models/imcR_models.dart';
import 'package:isae/src/models/user.dart';
import 'package:isae/src/models/userData_model.dart';
import 'package:isae/src/ui/IMC/TablePojo.dart';

class GlobalVariables{
  static int statusDrawer = 1;
  //-------------------------IMC Chart-------------------------------
  static List<ChartIMCData> chartData = [];

  static List<SalesData> salesData = [];

  static List<IMCCBarData> barData = [];

  static List<IMCCLineData> lineData = [];
  static String dateNow = '';

  //-------------------------IMC:---------------------
  static String dateIMC = '2019---';
  static String dateNameIMC = '';
  static String dateNameIMChart = '';
  static String titleMetric = 'Reserva Total';
  static List<String> listConceptsR = <String>['Reserva natural', 'Reserva natural anterior', 'Variación','Créditos'];
  static List<double> listCNumbersR = <double>[];
  static List<double> listCNumbersRConp = <double>[];

  static List<Icon> listIconsCR = <Icon>[Icon(Icons.equalizer, color: Color(0xff006341)), Icon(Icons.equalizer, color: Color(0xff006341)),Icon(Icons.show_chart, color: Color(0xff006341)),Icon(Icons.equalizer, color: Color(0xff006341))];

  static List<String> listTitles = <String>['Año anterior', 'Mes anterior', 'Mes actual','Variación mes anterior', '%', 'Variación año anterior', '%'];
  static List<String> listConcepts = [];
  static List<String> anioAnt = [];
  static List<String> monthAnt = [];
  static List<String> monthAct = [];
  static List<String> varMonthAn = [];
  static List<String> percentM = [];
  static List<String> varAnioAn = [];
  static List<String> percentA = [];
  static List<String> credits = [];

  static List<String> listDatesIMC = [];
  static List<List<double>> listAllDetChart = [];
  static List<List<double>> listAllDetChartConp = [];
  static List<double> listLineChartIMC = [];
  static int selectBar;

  static int selectConp;
  static String nameBarChart = '';
  static double animationIMC = 1000;

  static List<TablePojo> listTableInven =  [];
  static List<String> listFirtColumn =  <String>['NOMBRE(S)', 'APELLIDOS', 'NOMBRE COMPLETO','NUMERO DE EMPLEADO','VIP','PUESTO'];

  //----------------------------------------------------


  //-------------------------Login:---------------------
  static  final textNEmp = TextEditingController();
  static  final textPass = TextEditingController();
  static  final textPassActual = TextEditingController();
  static  final textPassNew = TextEditingController();
  static  final textPassConfir = TextEditingController();
  static String statusNav = 'false';

  //----------------------------------------------------

  //-------------------------General:---------------------
  static List<String> listDatesGnrl = [];
  static String dateGnrl = '';
  static String subDetailG = '';
  static String subProductG = '';

  static List<String> listProduct = [];
  static List<String> lisSaldoP = [];
  static List<String> listPercentP = [];

  static List<String> listNamesPr = ['Saldo', 'Capital', 'Intereses', 'Anticipos', 'Pedidos', 'Plazo promedio', 'Ticket promedio'];
  static List<String> listSaldosPr = ['0', '0', '0', '0', '0', '0', '0'];

  static List<String> listModulesPr = ['Saldos', 'Reserva', 'Volumen', 'Estatus'];

  static List<GnrlPieData> pieData = [];
  static List<GnrlBarData> barDataG = [];

  static int statusModulGnrl = 1; //1: General-Saldos

  static bool statusTablePr;
  static int statusGnrl = 1;
  static bool statusChartG; //true:pie -- false:bar
  static bool sButtonNext; //oculto
  static bool sButtonPrevious; //visible
  static int indexDate = 0; //0:primera fecha
  static int iExplPieC; //
  static double animationP = 1000;
  static int indexColorP;

  static List<Color> listColors = [Color(0xff2ECC71), Color(0xffF5B041), Color(0xff3498DB), Color(0xffE74C3C), Color(0xffF7DC6F), Color(0xffAF7AC5),
    Color(0xFF4DD0E1), Color(0xffF06292), Color(0xff3949AB), Color(0xffFF7043), Color(0xffA3E4D7), Color(0xffA569BD)];
  //------------------------------------------------------

  //-------------------------Benchmarking:assets/images/---------------------
  static String titleCharts;
  static bool statusBench;
  static List<BenchData> barTData = [];
  static List<BenchData> barNData = [];
  static List<String> namesBanksT = ['HSBC', 'Scotiabank', 'Inbursa', 'Interacciones', 'Bank Of America', 'BanBajio', 'Afirme', 'Banco Azteca'];
  static List<String> namesBanksN = ['Banco Azteca', 'Bancoppel', 'Compartamos', 'Banco Ahorro Famsa', 'Banco Walmart', 'Autofin', 'Consubanco'];

  static List<String> listBanks = [];
  static List<String> listBanks1 = ['646373.09', '389543.24', '352419.94', '186815.67', '174607.22', '173152.94', '153554.60', '128390.45', '44714.18', '30726.71', '24260.22', '0.00', '6810.76','9065.10'];
  static List<String> listBanks2 = ['130594.56','51685.24','32925.16','72649.00','21859.91','22319.46','102174.57','39250.01','24737.26','2.59','200.07','0.00','2030.28','20.05'];
  static List<String> listBanks3 = ['329724.64','256751.02','221040.93','108708.92','16798.32','132317.30','35691.11','99486.83','37717.58','17851.57','20503.02','0.00','4273.00','5817.92'];
  static List<String> listBanks4 = ['52237.61','40063.97','86428.02','13451.78','5542.52','17252.18','3884.98','14398.44','5905.12','10845.76','3182.70','0.00','693.72','2840.83'];
  static List<String> listBanks5 = ['17241','9489','4217','626','245','4343','1933','31943','11743','17738','5985','0','279','1561'];
  static List<String> listBanks6 = ['974','573','664','1','1','295','184','1740','986','121','452','0','14','1'];

  static List<String> listBanksS = [];
  static List<String> namesBanksS = [];
  static List<BenchData> barSData = [];
  static List<String> namesBanksAll = ['HSBC','Scotiabank','Inbursa','Interacciones','Bank Of America','BanBajio','Afirme','Banco Azteca','Bancoppel','Compartamos','Banco Ahorro Famsa','Banco Walmart','Autofin','Consubanco','BBVA','Santander','Banamex','Banorte','IXE','J.P. Morgan','BanRegio','Monex','Invex','Banco Multiva','Barclays','Banca Mifel','BX+','MUFG','Credit Suisse','Deutsche Bank','CI Banco','Bansi','Banco Base','Actinver','American Express','Inter Banco','ABC Capital','Volkswagen BAnk','Banco Inmobiliario','UBS','Banco Forjadores','Fundación Dondé','ING','BNY Mellon','Banco Bicentenario','RBS'];
  static List<String> listBanksAll = [];
  static List<String> listBanks1All = ['646373.09','389543.24','352419.94','186815.67','174607.22','173152.94','153554.60','128390.45','44714.18','30726.71','24260.22','0.00','6810.76','9065.10', '646373.09','389543.24','352419.94','186815.67','174607.22','173152.94','153554.60','128390.45','44714.18','30726.71','24260.22','0.00','6810.76','9065.10', '646373.09','389543.24','352419.94','186815.67','174607.22','173152.94','153554.60','128390.45','44714.18','30726.71','24260.22','0.00','6810.76','9065.10', '24260.22', '0.00','6810.76','9065.10'];
  static List<String> listBanks2All = ['130594.56','51685.24','32925.16','72649.00','21859.91','22319.46','102174.57','39250.01','24737.26','2.59','200.07','0.00','2030.28','20.05','130594.56','51685.24','32925.16','72649.00','21859.91','22319.46','102174.57','39250.01','24737.26','2.59','200.07','0.00','2030.28','20.05','130594.56','51685.24','32925.16','72649.00','21859.91','22319.46','102174.57','39250.01','24737.26','2.59','200.07','0.00','2030.28','20.05','200.07','0.00','2030.28','20.05'];
  static List<String> listBanks3All = ['329724.64','256751.02','221040.93','108708.92','16798.32','132317.30','35691.11','99486.83','37717.58','17851.57','20503.02','0.00','4273.00','5817.92','329724.64','256751.02','221040.93','108708.92','16798.32','132317.30','35691.11','99486.83','37717.58','17851.57','20503.02','0.00','4273.00','5817.92','329724.64','256751.02','221040.93','108708.92','16798.32','132317.30','35691.11','99486.83','37717.58','17851.57','20503.02','0.00','4273.00','5817.92','20503.02','0.00','4273.00','5817.92'];
  static List<String> listBanks4All = ['52237.61','40063.97','86428.02','13451.78','5542.52','17252.18','3884.98','14398.44','5905.12','10845.76','3182.70','0.00','693.72','2840.83','52237.61','40063.97','86428.02','13451.78','5542.52','17252.18','3884.98','14398.44','5905.12','10845.76','3182.70','0.00','693.72','2840.83','52237.61','40063.97','86428.02','13451.78','5542.52','17252.18','3884.98','14398.44','5905.12','10845.76','3182.70','0.00','693.72','2840.83','3182.70','0.00','693.72','2840.83'];
  static List<String> listBanks5All = ['17241','9489','4217','626','245','4343','1933','31943','11743','17738','5985','0','279','1561','17241','9489','4217','626','245','4343','1933','31943','11743','17738','5985','0','279','1561','17241','9489','4217','626','245','4343','1933','31943','11743','17738','5985','0','279','1561','5985','0','279','1561'];
  static List<String> listBanks6All = ['974','573','664','1','1','295','184','1740','986','121','452','0','14','1','974','573','664','1','1','295','184','1740','986','121','452','0','14','1','974','573','664','1','1','295','184','1740','986','121','452','0','14','1','452','0','14','1'];

  static List<String> imagesBench = ['assets/images/bank1.png', 'assets/images/bank2.png', 'assets/images/bank3.png', 'assets/images/bank4.png', 'assets/images/bank5.png', 'assets/images/bank6.png', 'assets/images/bank7.png',
    'assets/images/bank8.png', 'assets/images/bank9.png', 'assets/images/bank10.png', 'assets/images/bank11.png', 'assets/images/bank12.png', 'assets/images/bank13.png', 'assets/images/bank14.png'];

  static List<String> imagesBenchAll = ['assets/images/bank1.png', 'assets/images/bank2.png', 'assets/images/bank3.png', 'assets/images/bank4.png', 'assets/images/bank5.png', 'assets/images/bank6.png', 'assets/images/bank7.png',
    'assets/images/bank8.png', 'assets/images/bank9.png', 'assets/images/bank10.png', 'assets/images/bank11.png', 'assets/images/bank12.png', 'assets/images/bank13.png', 'assets/images/bank14.png', 'assets/images/bank15.png',
    'assets/images/bank16.png', 'assets/images/bank17.png', 'assets/images/bank18.png', 'assets/images/bank19.png', 'assets/images/bank20.png', 'assets/images/bank21.png', 'assets/images/bank22.png', 'assets/images/bank23.png',
    'assets/images/bank24.png', 'assets/images/bank25.png', 'assets/images/bank26.png', 'assets/images/bank27.png', 'assets/images/bank28.png', 'assets/images/bank29.png', 'assets/images/bank30.png', 'assets/images/bank31.png',
    'assets/images/bank32.png', 'assets/images/bank33.png', 'assets/images/bank34.png', 'assets/images/bank35.png', 'assets/images/bank36.png', 'assets/images/bank37.png', 'assets/images/bank38.png', 'assets/images/bank39.png',
    'assets/images/bank40.png', 'assets/images/bank41.png', 'assets/images/bank42.png', 'assets/images/bank43.png', 'assets/images/bank44.png', 'assets/images/bank45.png', 'assets/images/bank46.png'];
  //------------------------------------------------------

  static List<Proyects> listProyects = new List<Proyects>();
  static List<Inventario> listIventario = new List<Inventario>();
  static List<Inventario> listIventarioSearch = new List<Inventario>();

  static List<InventarioAgrupado> listAgrupado= new List<InventarioAgrupado>();
  static List<InventarioDetalleAgrupado> listDetalleAgrupado= new List<InventarioDetalleAgrupado>();
  static int idProyect;
  static int idIventario;
  static int idAgrupador;
  static String campoEdit;
  static String valorEdit;
  static String valorUpdate;
  //adddd
  static String addProyect;

  static LatLng center ;
  static Position currentLocation;
  static Map<String, Marker> markers = {};

  static bool valideUserLogin;
  static bool valideUpdateUserLogin;
  static User user;




////Agrupacion 1
//  static  final controllerApellido1= TextEditingController();
//  static  final controllerApellido2= TextEditingController();
//  static  final controllerNombres = TextEditingController();
//  static  final controllerNumEmpleado= TextEditingController();
//
//  static  final controllerPuesto= TextEditingController();
//  static  final controllerDireccion= TextEditingController();
//  static  final controllerSubdireccion= TextEditingController();
//  static  final controllerClaveSubdireccion= TextEditingController();
//  static  final controllerGerencia= TextEditingController();
//  static  final controllerClaveGerencia= TextEditingController();
//  static  final controllerDepto= TextEditingController();
//  static  final controllerClaveCentroTrabajo= TextEditingController();
//  static  final controllercorreo= TextEditingController();
//  static  final controllerTelefono= TextEditingController();
//  static  final controllerExt= TextEditingController();
//
////Agrupacion 2
//
//  static  final controllerUbicacion= TextEditingController();
//  static  final controllerZona= TextEditingController();
//  static  final controllerEdificio= TextEditingController();
//  static  final controllerArea= TextEditingController();
//  static  final controllerAdscripcion= TextEditingController();
//
////Agrupacion 3
//  static  final controllerApellidosJefe= TextEditingController();
//  static  final controllerNombreJefe= TextEditingController();
//  static  final controllerFichaJefe= TextEditingController();
//  static  final controllerExtJefe= TextEditingController();
//  static  final controllerUbicacionJefe= TextEditingController();
//  static  final controllerNombreJefeImediato= TextEditingController();
//  static  final controllerApellidosResguardo= TextEditingController();
//  static  final controllerNombresResguardo= TextEditingController();
//  static  final controllerAdscripcionResguardo= TextEditingController();
//  static  final controllerExtResguardo= TextEditingController();
//  static  final controlleraApellidosResponsable= TextEditingController();
//  static  final controllerNombresResponsable= TextEditingController();
//  static  final controllerApellidosPemex= TextEditingController();
//  static  final controllerNombrePemex= TextEditingController();
//
////Agrupacion 4
//  static  final controllerNumSerieEquipo= TextEditingController();
//  static  final controllerNumSerieMonitor= TextEditingController();
//  static  final controllerNumSerieTeclado= TextEditingController();
//
//  //Agrupacion 5
//  static  final controllerNumSerieMouse= TextEditingController();
//  static  final controllerNumSerieUPS= TextEditingController();
//  static  final controllerNumSerieMaletin= TextEditingController();
//
////Agrupacion  6 solo catalogos
//  //Agrupacion 7
//  static  final controllerNumSerieMonitorR2= TextEditingController();
//  static  final controllerNumSerieAccesorio= TextEditingController();
//  static  final controllerProcesador= TextEditingController();
////Agruopacion  8
//  static  final controllerNumSerieComp1= TextEditingController();
//  static  final controllerCruceClientesComp1= TextEditingController();
//  static  final controllerNumSerieComp2= TextEditingController();
//  static  final controllerCruceClientesComp2= TextEditingController();
//
////Agrupacion 9
//  static  final controllerNumSerieComp3= TextEditingController();
//  static  final controllerCruceClientesComp3= TextEditingController();
//  static  final controllerNumSerieComp4= TextEditingController();
//  static  final controllerCruceClientesComp4= TextEditingController();
//
//  //Agrupacion 10
//  static  final controllerNumSerieComp5= TextEditingController();
//  static  final controllerCruceClientesComp5= TextEditingController();
//  static  final controllerNumSerieComp6= TextEditingController();
//  static  final controllerCruceClientesComp6= TextEditingController();
//
//  //Agrupacion 11
//  static  final controllerNumSerieComp7= TextEditingController();
//  static  final controllerCruceClientesComp7= TextEditingController();
//
//  //Agrupacion 12
//  static  final controllerTecnicoNombre= TextEditingController();
//  static  final controllerReqEspecial1= TextEditingController();
//  static  final controllerReqEspecial2= TextEditingController();

  static List<Inventario> listIventarioAdd = new List<Inventario>();
  static File _pickedImage;
  static List<File> listFiles= new List<File>();
  static String nameProyectFile;
  static String nameInvenFolioFile;

//  static  Auxiliar selectedItemCat;
//  static  Auxiliar selectedItemCat1;
//  static  Auxiliar selectedItemCat2;
//  static  Auxiliar selectedItemCat3;
//  static  Auxiliar selectedItemCat4;
//  static  Auxiliar selectedItemCat5;
//  static  Auxiliar selectedItemCat6;
//  static  Auxiliar selectedItemCat7;
//  static  Auxiliar selectedItemCat8;
//  static  Auxiliar selectedItemCat9;
//  static  Auxiliar selectedItemCat10;
//  static  Auxiliar selectedItemCat11;
//  static  Auxiliar selectedItemCat12;
//  static  Auxiliar selectedItemCat13;
//  static  Auxiliar selectedItemCat14;
//  static  Auxiliar selectedItemCat15;
//  static  Auxiliar selectedItemCat16;
//  static  Auxiliar selectedItemCat17;
//  static  Auxiliar selectedItemCat18;
//  static  Auxiliar selectedItemCat19;
//  static  Auxiliar selectedItemCat20;
//  static  Auxiliar selectedItemCat21;
//  static  Auxiliar selectedItemCat22;
//  static  Auxiliar selectedItemCat23;
//  static  Auxiliar selectedItemCat24;
//  static  Auxiliar selectedItemCat25;
//  static  Auxiliar selectedItemCat26;
//  static  Auxiliar selectedItemCat27;
//  static  Auxiliar selectedItemCat28;

  static List<Auxiliar> listCatalogos1= new List<Auxiliar>();
  static List<Auxiliar> listCatalogos2= new List<Auxiliar>();
  static List<Auxiliar> listCatalogos3= new List<Auxiliar>();
  static List<Auxiliar> listCatalogos4= new List<Auxiliar>();
  static List<Auxiliar> listCatalogos5= new List<Auxiliar>();
  static List<Auxiliar> listCatalogos6= new List<Auxiliar>();
  static List<Auxiliar> listCatalogos7= new List<Auxiliar>();
  static List<Auxiliar> listCatalogos8= new List<Auxiliar>();
  static List<Auxiliar> listCatalogos9= new List<Auxiliar>();
  static List<Auxiliar> listCatalogos10= new List<Auxiliar>();
  static List<Auxiliar> listCatalogos11= new List<Auxiliar>();
  static List<Auxiliar> listCatalogos12= new List<Auxiliar>();
  static List<Auxiliar> listCatalogos13= new List<Auxiliar>();
  static List<Auxiliar> listCatalogos14= new List<Auxiliar>();
  static List<Auxiliar> listCatalogos15= new List<Auxiliar>();
  static List<Auxiliar> listCatalogos16= new List<Auxiliar>();
  static List<Auxiliar> listCatalogos17= new List<Auxiliar>();
  static List<Auxiliar> listCatalogos18= new List<Auxiliar>();
  static List<Auxiliar> listCatalogos19= new List<Auxiliar>();
  static List<Auxiliar> listCatalogos20= new List<Auxiliar>();
  static List<Auxiliar> listCatalogos21= new List<Auxiliar>();
  static List<Auxiliar> listCatalogos22= new List<Auxiliar>();
  static List<Auxiliar> listCatalogos23= new List<Auxiliar>();
  static List<Auxiliar> listCatalogos24= new List<Auxiliar>();
  static List<Auxiliar> listCatalogos25= new List<Auxiliar>();
  static List<Auxiliar> listCatalogos26= new List<Auxiliar>();
  static List<Auxiliar> listCatalogos27= new List<Auxiliar>();
  static List<Auxiliar> listCatalogos28= new List<Auxiliar>();



  static  Auxiliar selectedItemCatPROYECTO;
  static  Auxiliar selectedItemCatPROYECTODESCRIPCION;
  static  Auxiliar selectedItemCatFCREACON;
  static  Auxiliar selectedItemCatFOLIO;
  static  Auxiliar selectedItemCatID;
  static  Auxiliar selectedItemCatAPELLIDOS;
  static  Auxiliar selectedItemCatAPELLIDOS2;
  static  Auxiliar selectedItemCatNOMBRES;
  static  Auxiliar selectedItemCatNOMBRECOMPLETO;
  static  Auxiliar selectedItemCatNUMEMPLEADO;
  static  Auxiliar selectedItemCatVIP;
  static  Auxiliar selectedItemCatPUESTO;
  static  Auxiliar selectedItemCatDIRECCION;
  static  Auxiliar selectedItemCatSUBDIRECCION;
  static  Auxiliar selectedItemCatCLAVESUBDIRECCION;
  static  Auxiliar selectedItemCatGERENCIA;
  static  Auxiliar selectedItemCatCLAVEGERENCIA;
  static  Auxiliar selectedItemCatDEPTO;
  static  Auxiliar selectedItemCatCLAVECENTROTRABAJO;
  static  Auxiliar selectedItemCatCORREO;
  static  Auxiliar selectedItemCatTELEFONO;
  static  Auxiliar selectedItemCatEXT;
  static  Auxiliar selectedItemCatUBICACION;
  static  Auxiliar selectedItemCatESTADO;
  static  Auxiliar selectedItemCatCP;
  static  Auxiliar selectedItemCatCOLONIA;
  static  Auxiliar selectedItemCatUBICACIONCOMPLETA;
  static  Auxiliar selectedItemCatZONA;
  static  Auxiliar selectedItemCatLOCALIDAD;
  static  Auxiliar selectedItemCatEDIFICIO;
  static  Auxiliar selectedItemCatPISO;
  static  Auxiliar selectedItemCatAREA;
  static  Auxiliar selectedItemCatADSCRIPCION;
  static  Auxiliar selectedItemCatAPELLIDOSJEFE;
  static  Auxiliar selectedItemCatNOMBRESJEFE;
  static  Auxiliar selectedItemCatNOMBRECOMPLETOJEFE;
  static  Auxiliar selectedItemCatFICHAJEFE;
  static  Auxiliar selectedItemCatEXTJEFE;
  static  Auxiliar selectedItemCatUBICACIONJEFE;
  static  Auxiliar selectedItemCatNOMBREJEFEINMEDIATO;
  static  Auxiliar selectedItemCatAPELLIDOSRESGUARDO;
  static  Auxiliar selectedItemCatNOMBRESRESGUARDO;
  static  Auxiliar selectedItemCatNOMBRECOMPLETORESGUARDO;
  static  Auxiliar selectedItemCatADSCRIPCIONRESGUARDO;
  static  Auxiliar selectedItemCatEXTRESGUARDO;
  static  Auxiliar selectedItemCatAPELLIDOSRESPONSABLE;
  static  Auxiliar selectedItemCatNOMBRESRESPONSABLE;
  static  Auxiliar selectedItemCatNOMBRECOMPLETORESPONSABLE;
  static  Auxiliar selectedItemCatAPELLIDOSPEMEX;
  static  Auxiliar selectedItemCatNOMBRESPEMEX;
  static  Auxiliar selectedItemCatNOMBRECOMPLETOPEMEX;
  static  Auxiliar selectedItemCatTIPOEQUIPO;
  static  Auxiliar selectedItemCatEQUIPO;
  static  Auxiliar selectedItemCatMARCAEQUIPO;
  static  Auxiliar selectedItemCatMODELOEQUIPO;
  static  Auxiliar selectedItemCatNUMSERIEEQUIPO;
  static  Auxiliar selectedItemCatEQUIPOCOMPLETO;
  static  Auxiliar selectedItemCatMONITOR;
  static  Auxiliar selectedItemCatMARCAMONITOR;
  static  Auxiliar selectedItemCatMODELOMONITOR;
  static  Auxiliar selectedItemCatNUMSERIEMONITOR;
  static  Auxiliar selectedItemCatMONITORCOMPLETO;
  static  Auxiliar selectedItemCatTECLADO;
  static  Auxiliar selectedItemCatMARCATECLADO;
  static  Auxiliar selectedItemCatMODELOTECLADO;
  static  Auxiliar selectedItemCatNUMSERIETECLADO;
  static  Auxiliar selectedItemCatTECLADOCOMPLETO;
  static  Auxiliar selectedItemCatMOUSE;
  static  Auxiliar selectedItemCatMARCAMOUSE;
  static  Auxiliar selectedItemCatMODELOMAUSE;
  static  Auxiliar selectedItemCatNUMSERIEMOUSE;
  static  Auxiliar selectedItemCatMOUSECOMPLETO;
  static  Auxiliar selectedItemCatUPS;
  static  Auxiliar selectedItemCatMARCAUPS;
  static  Auxiliar selectedItemCatMODELOUPS;
  static  Auxiliar selectedItemCatNUMSERIEUPS;
  static  Auxiliar selectedItemCatUPSCOMPLETO;
  static  Auxiliar selectedItemCatMALETIN;
  static  Auxiliar selectedItemCatMARCAMALETIN;
  static  Auxiliar selectedItemCatMODELOMALETIN;
  static  Auxiliar selectedItemCatNUMSERIEMALETIN;
  static  Auxiliar selectedItemCatMALETINCOMLETO;
  static  Auxiliar selectedItemCatCANDADO;
  static  Auxiliar selectedItemCatMARCACANDADO;
  static  Auxiliar selectedItemCatMODELOCANDADO;
  static  Auxiliar selectedItemCatNUMSERIECANDADO;
  static  Auxiliar selectedItemCatCANDADOCOMPLETO;
  static  Auxiliar selectedItemCatBOCINAS;
  static  Auxiliar selectedItemCatMARCABOCINAS;
  static  Auxiliar selectedItemCatMODELOBOCINAS;
  static  Auxiliar selectedItemCatNUMSERIEBOCINAS;
  static  Auxiliar selectedItemCatBOCINASCOMPLETO;
  static  Auxiliar selectedItemCatCAMARA;
  static  Auxiliar selectedItemCatMARCACAMARA;
  static  Auxiliar selectedItemCatMODELOCAMARA;
  static  Auxiliar selectedItemCatNUMSERIECMARA;
  static  Auxiliar selectedItemCatCAMARACOMPLETO;
  static  Auxiliar selectedItemCatMONITOR2;
  static  Auxiliar selectedItemCatMARCAMONITOR2;
  static  Auxiliar selectedItemCatMODELOMONITOR2;
  static  Auxiliar selectedItemCatNUMSERIEMONITOR2;
  static  Auxiliar selectedItemCatMONITOR2COMPLETO;
  static  Auxiliar selectedItemCatACCESORIO;
  static  Auxiliar selectedItemCatMARCAACCESORIO;
  static  Auxiliar selectedItemCatMODELOACCESORIO;
  static  Auxiliar selectedItemCatNUMSERIEACCESORIO;
  static  Auxiliar selectedItemCatACCESORIOCOMPLETO;
  static  Auxiliar selectedItemCatRAM;
  static  Auxiliar selectedItemCatDISCODURO;
  static  Auxiliar selectedItemCatPROCESADOR;
  static  Auxiliar selectedItemCatTIPOEQUIPOCOMP1;
  static  Auxiliar selectedItemCatMODELOCOMP1;
  static  Auxiliar selectedItemCatNUMSERIECOMP1;
  static  Auxiliar selectedItemCatCRUCECLIENTECOMP1;
  static  Auxiliar selectedItemCatTIPOEQUIPOCOMP2;
  static  Auxiliar selectedItemCatMODELOCOMP2;
  static  Auxiliar selectedItemCatNUMSERIECOMP2;
  static  Auxiliar selectedItemCatCRUCECLIENTECOMP2;
  static  Auxiliar selectedItemCatTIPOEQUIPOCOMP3;
  static  Auxiliar selectedItemCatMODELOCOMP3;
  static  Auxiliar selectedItemCatNUMSERIECOMP3;
  static  Auxiliar selectedItemCatCRUCECLIENTECOMP3;
  static  Auxiliar selectedItemCatTIPOEQUIPOCOMP4;
  static  Auxiliar selectedItemCatMODELOCOMP4;
  static  Auxiliar selectedItemCatNUMSERIECOMP4;
  static  Auxiliar selectedItemCatCRUCECLIENTECOMP4;
  static  Auxiliar selectedItemCatTIPOEQUIPOCOMP5;
  static  Auxiliar selectedItemCatMODELOCOMP5;
  static  Auxiliar selectedItemCatNUMSERIECOMP5;
  static  Auxiliar selectedItemCatCRUCECLIENTECOMP5;
  static  Auxiliar selectedItemCatTIPOEQUIPOCOMP6;
  static  Auxiliar selectedItemCatMODELOCOMP6;
  static  Auxiliar selectedItemCatNUMSERIECOMP6;
  static  Auxiliar selectedItemCatCRUCECLIENTECOMP6;
  static  Auxiliar selectedItemCatTIPOEQUIPOCOMP7;
  static  Auxiliar selectedItemCatMODELOCOMP7;
  static  Auxiliar selectedItemCatNUMSERIECOMP7;
  static  Auxiliar selectedItemCatCRUCECLIENTECOMP7;
  static  Auxiliar selectedItemCatVALIDACIONCOMP1;
  static  Auxiliar selectedItemCatVALIDACIONCOMP2;
  static  Auxiliar selectedItemCatVALIDACIONCOMP3;
  static  Auxiliar selectedItemCatVALIDACIONCOMP4;
  static  Auxiliar selectedItemCatVALIDACIONCOMP5;
  static  Auxiliar selectedItemCatVALIDACIONCOMP6;
  static  Auxiliar selectedItemCatVALIDACIONCOMP7;
  static  Auxiliar selectedItemCatVALIDADOSCOMP;
  static  Auxiliar selectedItemCatTECNICONOMBRE;
  static  Auxiliar selectedItemCatDIA;
  static  Auxiliar selectedItemCatMES;
  static  Auxiliar selectedItemCatANIO;
  static  Auxiliar selectedItemCatREQESPECIAL1;
  static  Auxiliar selectedItemCatREQESPECIAL2;
  static  Auxiliar selectedItemCatOBSINV;
  static  Auxiliar selectedItemCatOBSRESGUARDO;
  static  Auxiliar selectedItemCatOBSEXTRAS1;
  static  Auxiliar selectedItemCatOBSEXTRAS2;
  static  Auxiliar selectedItemCatESTATUS;
  static  Auxiliar selectedItemCatFESCALACION;
  static  Auxiliar selectedItemCatCOMENTARIOSESCALACION;
  static  Auxiliar selectedItemDefault;

  static  final controllerPROYECTO= TextEditingController();
  static  final controllerPROYECTODESCRIPCION= TextEditingController();
  static  final controllerFCREACON= TextEditingController();
  static  final controllerFOLIO= TextEditingController();
  static  final controllerID= TextEditingController();
  static  final controllerAPELLIDOS= TextEditingController();
  static  final controllerAPELLIDOS2= TextEditingController();
  static  final controllerNOMBRES= TextEditingController();
  static  final controllerNOMBRECOMPLETO= TextEditingController();
  static  final controllerNUMEMPLEADO= TextEditingController();
  static  final controllerVIP= TextEditingController();
  static  final controllerPUESTO= TextEditingController();
  static  final controllerDIRECCION= TextEditingController();
  static  final controllerSUBDIRECCION= TextEditingController();
  static  final controllerCLAVESUBDIRECCION= TextEditingController();
  static  final controllerGERENCIA= TextEditingController();
  static  final controllerCLAVEGERENCIA= TextEditingController();
  static  final controllerDEPTO= TextEditingController();
  static  final controllerCLAVECENTROTRABAJO= TextEditingController();
  static  final controllerCORREO= TextEditingController();
  static  final controllerTELEFONO= TextEditingController();
  static  final controllerEXT= TextEditingController();
  static  final controllerUBICACION= TextEditingController();
  static  final controllerESTADO= TextEditingController();
  static  final controllerCP= TextEditingController();
  static  final controllerCOLONIA= TextEditingController();
  static  final controllerUBICACIONCOMPLETA= TextEditingController();
  static  final controllerZONA= TextEditingController();
  static  final controllerLOCALIDAD= TextEditingController();
  static  final controllerEDIFICIO= TextEditingController();
  static  final controllerPISO= TextEditingController();
  static  final controllerAREA= TextEditingController();
  static  final controllerADSCRIPCION= TextEditingController();
  static  final controllerAPELLIDOSJEFE= TextEditingController();
  static  final controllerNOMBRESJEFE= TextEditingController();
  static  final controllerNOMBRECOMPLETOJEFE= TextEditingController();
  static  final controllerFICHAJEFE= TextEditingController();
  static  final controllerEXTJEFE= TextEditingController();
  static  final controllerUBICACIONJEFE= TextEditingController();
  static  final controllerNOMBREJEFEINMEDIATO= TextEditingController();
  static  final controllerAPELLIDOSRESGUARDO= TextEditingController();
  static  final controllerNOMBRESRESGUARDO= TextEditingController();
  static  final controllerNOMBRECOMPLETORESGUARDO= TextEditingController();
  static  final controllerADSCRIPCIONRESGUARDO= TextEditingController();
  static  final controllerEXTRESGUARDO= TextEditingController();
  static  final controllerAPELLIDOSRESPONSABLE= TextEditingController();
  static  final controllerNOMBRESRESPONSABLE= TextEditingController();
  static  final controllerNOMBRECOMPLETORESPONSABLE= TextEditingController();
  static  final controllerAPELLIDOSPEMEX= TextEditingController();
  static  final controllerNOMBRESPEMEX= TextEditingController();
  static  final controllerNOMBRECOMPLETOPEMEX= TextEditingController();
  static  final controllerTIPOEQUIPO= TextEditingController();
  static  final controllerEQUIPO= TextEditingController();
  static  final controllerMARCAEQUIPO= TextEditingController();
  static  final controllerMODELOEQUIPO= TextEditingController();
  static  final controllerNUMSERIEEQUIPO= TextEditingController();
  static  final controllerEQUIPOCOMPLETO= TextEditingController();
  static  final controllerMONITOR= TextEditingController();
  static  final controllerMARCAMONITOR= TextEditingController();
  static  final controllerMODELOMONITOR= TextEditingController();
  static  final controllerNUMSERIEMONITOR= TextEditingController();
  static  final controllerMONITORCOMPLETO= TextEditingController();
  static  final controllerTECLADO= TextEditingController();
  static  final controllerMARCATECLADO= TextEditingController();
  static  final controllerMODELOTECLADO= TextEditingController();
  static  final controllerNUMSERIETECLADO= TextEditingController();
  static  final controllerTECLADOCOMPLETO= TextEditingController();
  static  final controllerMOUSE= TextEditingController();
  static  final controllerMARCAMOUSE= TextEditingController();
  static  final controllerMODELOMAUSE= TextEditingController();
  static  final controllerNUMSERIEMOUSE= TextEditingController();
  static  final controllerMOUSECOMPLETO= TextEditingController();
  static  final controllerUPS= TextEditingController();
  static  final controllerMARCAUPS= TextEditingController();
  static  final controllerMODELOUPS= TextEditingController();
  static  final controllerNUMSERIEUPS= TextEditingController();
  static  final controllerUPSCOMPLETO= TextEditingController();
  static  final controllerMALETIN= TextEditingController();
  static  final controllerMARCAMALETIN= TextEditingController();
  static  final controllerMODELOMALETIN= TextEditingController();
  static  final controllerNUMSERIEMALETIN= TextEditingController();
  static  final controllerMALETINCOMLETO= TextEditingController();
  static  final controllerCANDADO= TextEditingController();
  static  final controllerMARCACANDADO= TextEditingController();
  static  final controllerMODELOCANDADO= TextEditingController();
  static  final controllerNUMSERIECANDADO= TextEditingController();
  static  final controllerCANDADOCOMPLETO= TextEditingController();
  static  final controllerBOCINAS= TextEditingController();
  static  final controllerMARCABOCINAS= TextEditingController();
  static  final controllerMODELOBOCINAS= TextEditingController();
  static  final controllerNUMSERIEBOCINAS= TextEditingController();
  static  final controllerBOCINASCOMPLETO= TextEditingController();
  static  final controllerCAMARA= TextEditingController();
  static  final controllerMARCACAMARA= TextEditingController();
  static  final controllerMODELOCAMARA= TextEditingController();
  static  final controllerNUMSERIECMARA= TextEditingController();
  static  final controllerCAMARACOMPLETO= TextEditingController();
  static  final controllerMONITOR2= TextEditingController();
  static  final controllerMARCAMONITOR2= TextEditingController();
  static  final controllerMODELOMONITOR2= TextEditingController();
  static  final controllerNUMSERIEMONITOR2= TextEditingController();
  static  final controllerMONITOR2COMPLETO= TextEditingController();
  static  final controllerACCESORIO= TextEditingController();
  static  final controllerMARCAACCESORIO= TextEditingController();
  static  final controllerMODELOACCESORIO= TextEditingController();
  static  final controllerNUMSERIEACCESORIO= TextEditingController();
  static  final controllerACCESORIOCOMPLETO= TextEditingController();
  static  final controllerRAM= TextEditingController();
  static  final controllerDISCODURO= TextEditingController();
  static  final controllerPROCESADOR= TextEditingController();
  static  final controllerTIPOEQUIPOCOMP1= TextEditingController();
  static  final controllerMODELOCOMP1= TextEditingController();
  static  final controllerNUMSERIECOMP1= TextEditingController();
  static  final controllerCRUCECLIENTECOMP1= TextEditingController();
  static  final controllerTIPOEQUIPOCOMP2= TextEditingController();
  static  final controllerMODELOCOMP2= TextEditingController();
  static  final controllerNUMSERIECOMP2= TextEditingController();
  static  final controllerCRUCECLIENTECOMP2= TextEditingController();
  static  final controllerTIPOEQUIPOCOMP3= TextEditingController();
  static  final controllerMODELOCOMP3= TextEditingController();
  static  final controllerNUMSERIECOMP3= TextEditingController();
  static  final controllerCRUCECLIENTECOMP3= TextEditingController();
  static  final controllerTIPOEQUIPOCOMP4= TextEditingController();
  static  final controllerMODELOCOMP4= TextEditingController();
  static  final controllerNUMSERIECOMP4= TextEditingController();
  static  final controllerCRUCECLIENTECOMP4= TextEditingController();
  static  final controllerTIPOEQUIPOCOMP5= TextEditingController();
  static  final controllerMODELOCOMP5= TextEditingController();
  static  final controllerNUMSERIECOMP5= TextEditingController();
  static  final controllerCRUCECLIENTECOMP5= TextEditingController();
  static  final controllerTIPOEQUIPOCOMP6= TextEditingController();
  static  final controllerMODELOCOMP6= TextEditingController();
  static  final controllerNUMSERIECOMP6= TextEditingController();
  static  final controllerCRUCECLIENTECOMP6= TextEditingController();
  static  final controllerTIPOEQUIPOCOMP7= TextEditingController();
  static  final controllerMODELOCOMP7= TextEditingController();
  static  final controllerNUMSERIECOMP7= TextEditingController();
  static  final controllerCRUCECLIENTECOMP7= TextEditingController();
  static  final controllerVALIDACIONCOMP1= TextEditingController();
  static  final controllerVALIDACIONCOMP2= TextEditingController();
  static  final controllerVALIDACIONCOMP3= TextEditingController();
  static  final controllerVALIDACIONCOMP4= TextEditingController();
  static  final controllerVALIDACIONCOMP5= TextEditingController();
  static  final controllerVALIDACIONCOMP6= TextEditingController();
  static  final controllerVALIDACIONCOMP7= TextEditingController();
  static  final controllerVALIDADOSCOMP= TextEditingController();
  static  final controllerTECNICONOMBRE= TextEditingController();
  static  final controllerDIA= TextEditingController();
  static  final controllerMES= TextEditingController();
  static  final controllerANIO= TextEditingController();
  static  final controllerREQESPECIAL1= TextEditingController();
  static  final controllerREQESPECIAL2= TextEditingController();
  static  final controllerOBSINV= TextEditingController();
  static  final controllerOBSRESGUARDO= TextEditingController();
  static  final controllerOBSEXTRAS1= TextEditingController();
  static  final controllerOBSEXTRAS2= TextEditingController();
  static  final controllerESTATUS= TextEditingController();
  static  final controllerFESCALACION= TextEditingController();
  static  final controllerCOMENTARIOSESCALACION= TextEditingController();


  static  Auxiliar selectedItemCatPROYECTOadd;
  static  Auxiliar selectedItemCatPROYECTODESCRIPCIONadd;
  static  Auxiliar selectedItemCatFCREACONadd;
  static  Auxiliar selectedItemCatFOLIOadd;
  static  Auxiliar selectedItemCatIDadd;
  static  Auxiliar selectedItemCatAPELLIDOSadd;
  static  Auxiliar selectedItemCatAPELLIDOS2add;
  static  Auxiliar selectedItemCatNOMBRESadd;
  static  Auxiliar selectedItemCatNOMBRECOMPLETOadd;
  static  Auxiliar selectedItemCatNUMEMPLEADOadd;
  static  Auxiliar selectedItemCatVIPadd;
  static  Auxiliar selectedItemCatPUESTOadd;
  static  Auxiliar selectedItemCatDIRECCIONadd;
  static  Auxiliar selectedItemCatSUBDIRECCIONadd;
  static  Auxiliar selectedItemCatCLAVESUBDIRECCIONadd;
  static  Auxiliar selectedItemCatGERENCIAadd;
  static  Auxiliar selectedItemCatCLAVEGERENCIAadd;
  static  Auxiliar selectedItemCatDEPTOadd;
  static  Auxiliar selectedItemCatCLAVECENTROTRABAJOadd;
  static  Auxiliar selectedItemCatCORREOadd;
  static  Auxiliar selectedItemCatTELEFONOadd;
  static  Auxiliar selectedItemCatEXTadd;
  static  Auxiliar selectedItemCatUBICACIONadd;
  static  Auxiliar selectedItemCatESTADOadd;
  static  Auxiliar selectedItemCatCPadd;
  static  Auxiliar selectedItemCatCOLONIAadd;
  static  Auxiliar selectedItemCatUBICACIONCOMPLETAadd;
  static  Auxiliar selectedItemCatZONAadd;
  static  Auxiliar selectedItemCatLOCALIDADadd;
  static  Auxiliar selectedItemCatEDIFICIOadd;
  static  Auxiliar selectedItemCatPISOadd;
  static  Auxiliar selectedItemCatAREAadd;
  static  Auxiliar selectedItemCatADSCRIPCIONadd;
  static  Auxiliar selectedItemCatAPELLIDOSJEFEadd;
  static  Auxiliar selectedItemCatNOMBRESJEFEadd;
  static  Auxiliar selectedItemCatNOMBRECOMPLETOJEFEadd;
  static  Auxiliar selectedItemCatFICHAJEFEadd;
  static  Auxiliar selectedItemCatEXTJEFEadd;
  static  Auxiliar selectedItemCatUBICACIONJEFEadd;
  static  Auxiliar selectedItemCatNOMBREJEFEINMEDIATOadd;
  static  Auxiliar selectedItemCatAPELLIDOSRESGUARDOadd;
  static  Auxiliar selectedItemCatNOMBRESRESGUARDOadd;
  static  Auxiliar selectedItemCatNOMBRECOMPLETORESGUARDOadd;
  static  Auxiliar selectedItemCatADSCRIPCIONRESGUARDOadd;
  static  Auxiliar selectedItemCatEXTRESGUARDOadd;
  static  Auxiliar selectedItemCatAPELLIDOSRESPONSABLEadd;
  static  Auxiliar selectedItemCatNOMBRESRESPONSABLEadd;
  static  Auxiliar selectedItemCatNOMBRECOMPLETORESPONSABLEadd;
  static  Auxiliar selectedItemCatAPELLIDOSPEMEXadd;
  static  Auxiliar selectedItemCatNOMBRESPEMEXadd;
  static  Auxiliar selectedItemCatNOMBRECOMPLETOPEMEXadd;
  static  Auxiliar selectedItemCatTIPOEQUIPOadd;
  static  Auxiliar selectedItemCatEQUIPOadd;
  static  Auxiliar selectedItemCatMARCAEQUIPOadd;
  static  Auxiliar selectedItemCatMODELOEQUIPOadd;
  static  Auxiliar selectedItemCatNUMSERIEEQUIPOadd;
  static  Auxiliar selectedItemCatEQUIPOCOMPLETOadd;
  static  Auxiliar selectedItemCatMONITORadd;
  static  Auxiliar selectedItemCatMARCAMONITORadd;
  static  Auxiliar selectedItemCatMODELOMONITORadd;
  static  Auxiliar selectedItemCatNUMSERIEMONITORadd;
  static  Auxiliar selectedItemCatMONITORCOMPLETOadd;
  static  Auxiliar selectedItemCatTECLADOadd;
  static  Auxiliar selectedItemCatMARCATECLADOadd;
  static  Auxiliar selectedItemCatMODELOTECLADOadd;
  static  Auxiliar selectedItemCatNUMSERIETECLADOadd;
  static  Auxiliar selectedItemCatTECLADOCOMPLETOadd;
  static  Auxiliar selectedItemCatMOUSEadd;
  static  Auxiliar selectedItemCatMARCAMOUSEadd;
  static  Auxiliar selectedItemCatMODELOMAUSEadd;
  static  Auxiliar selectedItemCatNUMSERIEMOUSEadd;
  static  Auxiliar selectedItemCatMOUSECOMPLETOadd;
  static  Auxiliar selectedItemCatUPSadd;
  static  Auxiliar selectedItemCatMARCAUPSadd;
  static  Auxiliar selectedItemCatMODELOUPSadd;
  static  Auxiliar selectedItemCatNUMSERIEUPSadd;
  static  Auxiliar selectedItemCatUPSCOMPLETOadd;
  static  Auxiliar selectedItemCatMALETINadd;
  static  Auxiliar selectedItemCatMARCAMALETINadd;
  static  Auxiliar selectedItemCatMODELOMALETINadd;
  static  Auxiliar selectedItemCatNUMSERIEMALETINadd;
  static  Auxiliar selectedItemCatMALETINCOMLETOadd;
  static  Auxiliar selectedItemCatCANDADOadd;
  static  Auxiliar selectedItemCatMARCACANDADOadd;
  static  Auxiliar selectedItemCatMODELOCANDADOadd;
  static  Auxiliar selectedItemCatNUMSERIECANDADOadd;
  static  Auxiliar selectedItemCatCANDADOCOMPLETOadd;
  static  Auxiliar selectedItemCatBOCINASadd;
  static  Auxiliar selectedItemCatMARCABOCINASadd;
  static  Auxiliar selectedItemCatMODELOBOCINASadd;
  static  Auxiliar selectedItemCatNUMSERIEBOCINASadd;
  static  Auxiliar selectedItemCatBOCINASCOMPLETOadd;
  static  Auxiliar selectedItemCatCAMARAadd;
  static  Auxiliar selectedItemCatMARCACAMARAadd;
  static  Auxiliar selectedItemCatMODELOCAMARAadd;
  static  Auxiliar selectedItemCatNUMSERIECMARAadd;
  static  Auxiliar selectedItemCatCAMARACOMPLETOadd;
  static  Auxiliar selectedItemCatMONITOR2add;
  static  Auxiliar selectedItemCatMARCAMONITOR2add;
  static  Auxiliar selectedItemCatMODELOMONITOR2add;
  static  Auxiliar selectedItemCatNUMSERIEMONITOR2add;
  static  Auxiliar selectedItemCatMONITOR2COMPLETOadd;
  static  Auxiliar selectedItemCatACCESORIOadd;
  static  Auxiliar selectedItemCatMARCAACCESORIOadd;
  static  Auxiliar selectedItemCatMODELOACCESORIOadd;
  static  Auxiliar selectedItemCatNUMSERIEACCESORIOadd;
  static  Auxiliar selectedItemCatACCESORIOCOMPLETOadd;
  static  Auxiliar selectedItemCatRAMadd;
  static  Auxiliar selectedItemCatDISCODUROadd;
  static  Auxiliar selectedItemCatPROCESADORadd;
  static  Auxiliar selectedItemCatTIPOEQUIPOCOMP1add;
  static  Auxiliar selectedItemCatMODELOCOMP1add;
  static  Auxiliar selectedItemCatNUMSERIECOMP1add;
  static  Auxiliar selectedItemCatCRUCECLIENTECOMP1add;
  static  Auxiliar selectedItemCatTIPOEQUIPOCOMP2add;
  static  Auxiliar selectedItemCatMODELOCOMP2add;
  static  Auxiliar selectedItemCatNUMSERIECOMP2add;
  static  Auxiliar selectedItemCatCRUCECLIENTECOMP2add;
  static  Auxiliar selectedItemCatTIPOEQUIPOCOMP3add;
  static  Auxiliar selectedItemCatMODELOCOMP3add;
  static  Auxiliar selectedItemCatNUMSERIECOMP3add;
  static  Auxiliar selectedItemCatCRUCECLIENTECOMP3add;
  static  Auxiliar selectedItemCatTIPOEQUIPOCOMP4add;
  static  Auxiliar selectedItemCatMODELOCOMP4add;
  static  Auxiliar selectedItemCatNUMSERIECOMP4add;
  static  Auxiliar selectedItemCatCRUCECLIENTECOMP4add;
  static  Auxiliar selectedItemCatTIPOEQUIPOCOMP5add;
  static  Auxiliar selectedItemCatMODELOCOMP5add;
  static  Auxiliar selectedItemCatNUMSERIECOMP5add;
  static  Auxiliar selectedItemCatCRUCECLIENTECOMP5add;
  static  Auxiliar selectedItemCatTIPOEQUIPOCOMP6add;
  static  Auxiliar selectedItemCatMODELOCOMP6add;
  static  Auxiliar selectedItemCatNUMSERIECOMP6add;
  static  Auxiliar selectedItemCatCRUCECLIENTECOMP6add;
  static  Auxiliar selectedItemCatTIPOEQUIPOCOMP7add;
  static  Auxiliar selectedItemCatMODELOCOMP7add;
  static  Auxiliar selectedItemCatNUMSERIECOMP7add;
  static  Auxiliar selectedItemCatCRUCECLIENTECOMP7add;
  static  Auxiliar selectedItemCatVALIDACIONCOMP1add;
  static  Auxiliar selectedItemCatVALIDACIONCOMP2add;
  static  Auxiliar selectedItemCatVALIDACIONCOMP3add;
  static  Auxiliar selectedItemCatVALIDACIONCOMP4add;
  static  Auxiliar selectedItemCatVALIDACIONCOMP5add;
  static  Auxiliar selectedItemCatVALIDACIONCOMP6add;
  static  Auxiliar selectedItemCatVALIDACIONCOMP7add;
  static  Auxiliar selectedItemCatVALIDADOSCOMPadd;
  static  Auxiliar selectedItemCatTECNICONOMBREadd;
  static  Auxiliar selectedItemCatDIAadd;
  static  Auxiliar selectedItemCatMESadd;
  static  Auxiliar selectedItemCatANIOadd;
  static  Auxiliar selectedItemCatREQESPECIAL1add;
  static  Auxiliar selectedItemCatREQESPECIAL2add;
  static  Auxiliar selectedItemCatOBSINVadd;
  static  Auxiliar selectedItemCatOBSRESGUARDOadd;
  static  Auxiliar selectedItemCatOBSEXTRAS1add;
  static  Auxiliar selectedItemCatOBSEXTRAS2add;
  static  Auxiliar selectedItemCatESTATUSadd;
  static  Auxiliar selectedItemCatFESCALACIONadd;
  static  Auxiliar selectedItemCatCOMENTARIOSESCALACIONadd;
  static  Auxiliar selectedItemDefaultadd;
}

