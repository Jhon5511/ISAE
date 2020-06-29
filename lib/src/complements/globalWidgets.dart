
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:isae/src/blocs/IMC/imcR_bloc.dart';
import 'package:isae/src/complements/globalStyles.dart';
import 'package:isae/src/complements/globalVariables.dart';
import 'package:isae/src/models/General/gnrl_models.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:isae/src/models/imcR_models.dart';


class GlobalWidgets{

  static topBar(String title, String nameEmp, BuildContext context, String dateNow) {
    return AppBar(


      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(80),
        ),
      ),


      backgroundColor: Color.fromRGBO(0, 132, 186, 1),

      title: Row(

        children: <Widget>[
          Container(

            alignment: Alignment.topLeft,

            //color: Colors.cyan,
            child: Row(
              children: <Widget>[
                //------------Flag------------
                Container(
                  padding: EdgeInsets.fromLTRB(1, 20, 1, 1),
                  alignment: Alignment.bottomLeft,
                  child:  ClipRRect(

                    borderRadius: BorderRadius.circular(70.0),
                    child: Image.asset(
                      'assets/images/isae_icon2.png',
                      width: 30.0,
                      height: 30.0,
                    ),
                  ),

                ),






               /* VerticalDivider(color: Colors.white, width: 40),
                //--------NameSystem----------
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          height: MediaQuery.of(context).size.height * 0.30,
                          child: Text('ISAE', maxLines: 1, textAlign: TextAlign.left, style:
                          TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),

                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text('BUSINESS, TECHNOLOGY AND SYSTEMS', maxLines: 2, textAlign: TextAlign.left, style: TextStyle(fontSize: 11, color: Colors.white)),

                          ),
                        ),




                      ],
                    ),
                  ),
                ),*/
              ],
            ),
          ),
      Container(
        width: MediaQuery.of(context).size.width * 0.01,
      ),
        Expanded(

            child: Container(

              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(3, 20, 1, 1),
                    alignment: Alignment.center,
                    child: Text(title, maxLines: 2, textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
//                  Container(
//                    alignment: Alignment.center,
//                    width: MediaQuery.of(context).size.width * 0.17,
//                    child: Text(dateNow, maxLines: 1, textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: Colors.white70)),
//                  ),

                  Expanded(
                    child: Container(

                      alignment: Alignment.centerRight,
                      //color: Colors.cyan,
                      child: Row(
                        children: <Widget>[

                          Expanded(
                            child:  Container(
                              color:Color.fromRGBO(0, 132, 186, 1),
                              child: new Align(

                                alignment: Alignment.bottomCenter,
                                child: new SizedBox(

                                  width: 50.0,
                                  height: 50.0,
                                  child: new RaisedButton(
                                    padding: const EdgeInsets.all(2.0),

                                    color: Color.fromRGBO(0, 132, 186, 1),
                                    child: ClipRRect(

                                      borderRadius: BorderRadius.circular(50.0),
                                      child:
                                      //new Icon(Icons.account_circle,color: Colors.white),
                                      Image.asset(

                                        'assets/images/foto3.jpeg',
                                        width: 50.0,
                                        height: 50.0,
                                        fit: BoxFit.fill,
                                        alignment: Alignment.centerRight,

                                      ),
                                    ),
                                    shape: RoundedRectangleBorder(side: BorderSide(
                                        color: Color.fromRGBO(0, 132, 186, 1),
                                        width: 1,
                                        style: BorderStyle.solid
                                    ),
                                      borderRadius: BorderRadius.circular(60),),
                                  ),

                                ),

                              ),

                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      leading: GlobalWidgets.menuLateral(context),/*IconButton(
        icon: Icon(Icons.menu, color: Color(0xff006341), size: 40.0),
        onPressed: (){
         // menu:

        },
      ),*/

    );
  }

  /*static menuL(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'S I C R E',
              textAlign: TextAlign.center,
              textScaleFactor: 1.5,
              style: TextStyle(color: Color(0xff006341), fontSize: 25),
            ),
            decoration: BoxDecoration(
              color: Color(0xffF5F5F5),
              border: Border(
                bottom: BorderSide(color: Color(0xff006341), width: 5),
              ),
            ),
          ),
          ListTile(
            title: Text('General'),
            onTap: () {
              //InfoGnrl:
              GlobalVariables.statusModulGnrl = 1;
              GeneralCBloc.loadAllDatesGnrl(context);
              //Status Drawer:
              GlobalVariables.statusDrawer = 3;
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: Text('IMC'),
            onTap: () {
              //show spinner:
              GlobalWidgets.loadingIndicator(context, true);
              //show IMC:
              ImcRBloc.loadViewIMC(context);
              //Status Drawer:
              GlobalVariables.statusDrawer = 1;
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: Text('Vivienda'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Reservas'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Cobranzas'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Benchmarking'),
            onTap: () {},
          ),
        ],
      ),
    );
  }*/

  static menuLateral(BuildContext context) {
    return PopupMenuButton(
      color: Color.fromRGBO(9, 99, 141, 1),
      padding: EdgeInsets.all(16.0),
      offset: Offset(0, 100),
      /*child: Container(
        width: MediaQuery.of(context).size.width * 0.20,
        height: MediaQuery.of(context).size.height,
        color: Colors.amberAccent,
      ),*/
      itemBuilder: (context) => [
        PopupMenuItem(
          //height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[

              Container(
                width: MediaQuery.of(context).size.width * 0.40,
                height: MediaQuery.of(context).size.height * 0.35,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[


                      ListTile(
                        leading: new Icon(Icons.home,color: Colors.white),
                        title: Text('Proyectos', maxLines: 1, style: TextStyle(color: Colors.white, fontSize: 11)),
                        onTap: () {
//                          //show spinner:
//                          GlobalWidgets.loadingIndicator(context, true);
//                          //show IMC:
                          ImcRBloc.getProyects(context,3);
//                          //Status Drawer:
//                          GlobalVariables.statusDrawer = 1;
//                          //status animation:
//                          GlobalVariables.animationIMC = 1000;
//                          //status Bar:
//                          GlobalVariables.selectBar = null;
//                          Navigator.of(context).pop();
                        },
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.40,
                        height: MediaQuery.of(context).size.height * 0.003,
                        color: Colors.white,
                      ),
                     ListTile(
                       leading: new Icon(Icons.assignment_turned_in,color: Colors.white),
                        title: Text('Asigandos', maxLines: 1, style: TextStyle(color: Colors.white, fontSize: 11)),
                        onTap: () {},
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.40,
                        height: MediaQuery.of(context).size.height * 0.003,
                        color: Colors.white,
                      ),
                      ListTile(
                        leading: new Icon(Icons.insert_drive_file,color: Colors.white),
                        title: Text('Inventario', maxLines: 1, style: TextStyle(color: Colors.white, fontSize: 11)),
                        onTap: () {
                          ImcRBloc.getProyects(context,2);
                        },
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.40,
                        height: MediaQuery.of(context).size.height * 0.003,
                        color: Colors.white,
                      ),
                      ListTile(
                        leading: new Icon(Icons.supervisor_account,color: Colors.white),
                        title: Text('Cerrar Sesion', maxLines: 1, style: TextStyle(color: Colors.white, fontSize: 11)),
                        onTap: () {
                          ImcRBloc.closeSesion(context);
                        },
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.40,
                        height: MediaQuery.of(context).size.height * 0.003,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),


            ],
          ),


        ),
      ],
      icon: Icon(Icons.menu, color: Colors.white, size: 40.0),
    );
  }
  static textChartG(String date, String title, String subTitle){
    return Column(
      children: <Widget>[
        Expanded(
          child: Text(date, textAlign: TextAlign.center, textScaleFactor: 1.0,
              style: GlobalStyles.dateG),
        ),
        Expanded(
          child: Text(title, textAlign: TextAlign.center,
              style: GlobalStyles.titleChartG),
        ),
        Expanded(
          child: Text(subTitle, textAlign: TextAlign.center,
              style: GlobalStyles.subTitleChartG),
        ),
      ],
    );
  }

  static combChartImc(BuildContext context, double animation){
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(
        labelPlacement: LabelPlacement.betweenTicks,
        labelIntersectAction: AxisLabelIntersectAction.multipleRows,
        labelRotation: -90,
      ),
      primaryYAxis: NumericAxis(
        rangePadding: ChartRangePadding.auto,
        interval: 2500000000,
        numberFormat: GlobalStyles.numFormat,//NumberFormat.simpleCurrency(),
      ),
      legend: Legend(
          isVisible: true,
          position: LegendPosition.bottom,
          borderColor: Colors.black,
          borderWidth: 1
      ),
      //select bar for change info tables:
      //selectionType: SelectionType.cluster,
      onSelectionChanged: (SelectionArgs args){
        if(args.pointIndex != null){
          GlobalVariables.animationIMC = 0;
          GlobalVariables.selectBar = args.pointIndex;
          ImcRBloc.reloadInfoTable(context, args.pointIndex);
        }
      },
      series: <CartesianSeries>[
        StackedColumnSeries<ChartIMCData, String>(
          name: 'Liquidación',
          color: Color(0xFF7986CB), //for legend
          pointColorMapper: (ChartIMCData sales, _) => sales.c7,
          dataSource: GlobalVariables.chartData,
          xValueMapper: (ChartIMCData sales, _) => sales.x,
          yValueMapper: (ChartIMCData sales, _) => sales.y7,
          animationDuration: animation,
          selectionSettings: SelectionSettings(
            enable: false,
          ),
        ),
        StackedColumnSeries<ChartIMCData, String>(
          name: 'Cancelación',
          color: Color(0xFF81C784), //for legend
          pointColorMapper: (ChartIMCData sales, _) => sales.c6,
          dataSource: GlobalVariables.chartData,
          xValueMapper: (ChartIMCData sales, _) => sales.x,
          yValueMapper: (ChartIMCData sales, _) => sales.y6,
          animationDuration: animation,
          selectionSettings: SelectionSettings(
            enable: false,
          ),

        ),
        StackedColumnSeries<ChartIMCData, String>(
          name: 'Mejora',
          //color: Color(0xFFB39DDB),
          pointColorMapper: (ChartIMCData sales, _) => sales.c5,
          dataSource: GlobalVariables.chartData,
          xValueMapper: (ChartIMCData sales, _) => sales.x,
          yValueMapper: (ChartIMCData sales, _) => sales.y5,
          animationDuration: animation,
          selectionSettings: SelectionSettings(
            enable: false,
          ),
        ),
        StackedColumnSeries<ChartIMCData, String>(
          name: 'Reactivaciones',
          color: Color(0xFFEF9A9A), //for legend
          pointColorMapper: (ChartIMCData sales, _) => sales.c4,
          dataSource: GlobalVariables.chartData,
          xValueMapper: (ChartIMCData sales, _) => sales.x,
          yValueMapper: (ChartIMCData sales, _) => sales.y4,
          animationDuration: animation,
          selectionSettings: SelectionSettings(
            enable: false,
          ),
        ),
        StackedColumnSeries<ChartIMCData, String>(
          name: 'Colocación',
          color: Color(0xFFFFF59D), //for legend
          pointColorMapper: (ChartIMCData sales, _) => sales.c3,
          dataSource: GlobalVariables.chartData,
          xValueMapper: (ChartIMCData sales, _) => sales.x,
          yValueMapper: (ChartIMCData sales, _) => sales.y3,
          animationDuration: animation,
          selectionSettings: SelectionSettings(
            enable: false,
          ),
        ),
        StackedColumnSeries<ChartIMCData, String>(
          name: 'Deterioro',
          color: Color(0xFFF8BBD0), //for legend
          pointColorMapper: (ChartIMCData sales, _) => sales.c2,
          dataSource: GlobalVariables.chartData,
          xValueMapper: (ChartIMCData sales, _) => sales.x,
          yValueMapper: (ChartIMCData sales, _) => sales.y2,
          animationDuration: animation,
          selectionSettings: SelectionSettings(
            enable: false,
            //selectedOpacity: 1.0,
            //selectedBorderColor: Colors.black,
            //selectedBorderWidth: 2.0,
          ),
        ),
        StackedColumnSeries<ChartIMCData, String>(
          name: 'Reserva natural inicial',
          color: Color(0xFF67C5D1), //for legend
          pointColorMapper: (ChartIMCData sales, _) => sales.c1,
          dataSource: GlobalVariables.chartData,
          xValueMapper: (ChartIMCData sales, _) => sales.x,
          yValueMapper: (ChartIMCData sales, _) => sales.y1,
          animationDuration: animation,
          selectionSettings: SelectionSettings(
            enable: false,
            //selectedOpacity: 1.0,
            //selectedBorderColor: Colors.black,
            //selectedBorderWidth: 2.0,
          ),
        ),
        LineSeries<SalesData, String>(
          name: 'Reserva natural final',
          color: Colors.black,
          dataSource: GlobalVariables.salesData,
          xValueMapper: (SalesData sales, _) => sales.date,
          yValueMapper: (SalesData sales, _) => sales.sales,
          animationDuration: animation,
          selectionSettings: SelectionSettings(
            enable: false,
          ),
          markerSettings: MarkerSettings(
            isVisible: true,
            color: Colors.black,
            borderColor: Colors.black,
          ),
        ),
      ],
    );
  }

  //------------ListConceptsTable------------
  static dListFImc(BuildContext ctx){
    return ListView.separated(
      itemCount:  GlobalVariables.listConcepts.length,
      itemBuilder: (BuildContext ctx, int index){
        return Container(
          height: MediaQuery.of(ctx).size.height * 0.05,
          child: Center(child: Text('${GlobalVariables.listConcepts[index]}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(color: Colors.white),
    );
  }

  //------------ListTitles------------
  static tListSImc(BuildContext ctx){
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: GlobalVariables.listTitles.length,
      itemBuilder: (BuildContext ctx, int index){
        return Container(
          height: MediaQuery.of(ctx).size.height * 0.06,
          width: MediaQuery.of(ctx).size.width * 0.15,
          child: Center(child: Text('${GlobalVariables.listTitles[index]}', textAlign: TextAlign.right, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
        );
      },
    );
  }

  static combChartConpImc(BuildContext context){
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(
        labelPlacement: LabelPlacement.betweenTicks,
        labelIntersectAction: AxisLabelIntersectAction.multipleRows,
        labelRotation: -90,
      ),
      primaryYAxis: NumericAxis(
        rangePadding: ChartRangePadding.auto,
        interval: 2500000000,
        //interval: 1250000000,
        numberFormat: GlobalStyles.numFormat,//NumberFormat.simpleCurrency(),
      ),
      axes: <ChartAxis>[
        NumericAxis(
          opposedPosition: true,
          name: 'yAxis',
          //interval: 50,
          //minimum: -100,
          //maximum:  100,
        ),
      ],
      legend: Legend(
          isVisible: true,
          position: LegendPosition.bottom,
          borderColor: Colors.black,
          borderWidth: 1
      ),
      isTransposed: true,
      series: <ChartSeries>[
        StackedColumnSeries<IMCCBarData, String>(
          name: GlobalVariables.nameBarChart,
          dataSource: GlobalVariables.barData,
          color: Color(0xFF90CAF9),
          xValueMapper: (IMCCBarData bar, _) => bar.date,
          yValueMapper: (IMCCBarData bar, _) => bar.month,
          animationDuration: 1000,
          selectionSettings: SelectionSettings(
            enable: false,
          ),
        ),
        LineSeries<IMCCLineData, String>(
          name: 'Variación',
          color: Color(0xFFFFAB91),
          dataSource: GlobalVariables.lineData,
          xValueMapper: (IMCCLineData line, _) => line.date,
          yValueMapper: (IMCCLineData line, _) => line.month,
          animationDuration: 1000,
          yAxisName: 'yAxis',
          selectionSettings: SelectionSettings(
            enable: false,
          ),
          markerSettings: MarkerSettings(
            isVisible: true,
            color: Color(0xFFFFAB91),
            borderColor: Color(0xFFFFAB91),
          ),
        ),
      ],
    );
  }

  static dListConceptsRes(BuildContext  ctx, List<double> listNumb){
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: GlobalVariables.listConceptsR.length,
      itemBuilder: (BuildContext ctx, int index){
        return Container(
          width: MediaQuery.of(ctx).size.width * 0.30,
          height: MediaQuery.of(ctx).size.height * 0.06,
          child: ListTile(
            leading: GlobalVariables.listIconsCR[index],
            title: Text('${GlobalVariables.listConceptsR[index]}', textAlign: TextAlign.left, style: TextStyle(fontSize: 11)),
            trailing: GlobalStyles.formatInfoTIMC(listNumb[index], index),
          ),
        );
      },
    );
  }

  static loadingIndicator(BuildContext context, bool status) async {

    ProgressDialog pr;
    pr = new ProgressDialog(context,type: ProgressDialogType.Normal, showLogs: false);
    pr.style(
        message: 'Cargando...',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator(),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: TextStyle(
            color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600)
    );
    if(status == true) {
      await pr.show();
    } else {
      await pr.hide();
    }
  }




}

