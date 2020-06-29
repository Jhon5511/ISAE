library isae.globals;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:isae/src/complements/globalVariables.dart';
import 'package:isae/src/resources/listReoderViewCard.dart';

class GlobalStyles{
  static String textFL = "";

  /*static final numFormat = new NumberFormat.simpleCurrency(
    decimalDigits: 0,
  );*/
  static final numFormat = NumberFormat.simpleCurrency(
    //locale: 'es_MX',
    decimalDigits: 0,

  );

  static final numFormartN = NumberFormat.currency(
    symbol: '',
    decimalDigits: 0,

  );

  static final numFormatB = NumberFormat.simpleCurrency(
    //locale: 'es_MX',
    //decimalDigits: 0,

  );

  static const textTitle = TextStyle(
    color: Color.fromRGBO(36, 90, 149, 1),
  wordSpacing: 1.6,
    fontWeight: FontWeight.bold,
    fontSize: 35,
  );

  static const dateG = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );

  static const titleChartG = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 22,
  );

  static const subTitleChartG = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.normal,
    fontSize: 17,
  );

  static decorationTFLogin(String helperText){
    //bool _validate = false;
    return InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      helperText: helperText,
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFDBDBDB), width: 3.0),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xff006341),width: 3.0),
      ),
      //errorText: _validate ? 'Value Can\'t Be Empty' : null
    );
  }
  static decorationTFAdd(String helperText){
    //bool _validate = false;
    return InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      helperText: helperText,
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Color.fromRGBO(9, 99, 141, 1), width: 5.0),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Color.fromRGBO(9, 99, 141, 1),width: 5.0),
      ),
      //errorText: _validate ? 'Value Can\'t Be Empty' : null
    );
  }

  static titleLogin(String word){
    return Expanded(

      child: Text(word, textAlign: TextAlign.left,
          style: GlobalStyles.textTitle

      ),
    );
  }

  static lineBottom(double width){
    return BoxDecoration(
      border: Border(
        bottom: BorderSide(color: Color(0xFFDBDBDB), width: width),
      ),
    );
  }
  static lineTop(double width){
    return BoxDecoration(
      color: Colors.white,
      border: Border(
        top: BorderSide(color: Color(0xFFDBDBDB), width: width),
      ),
    );
  }
  static lineLeft(double width){
    return BoxDecoration(
      color: Colors.white,
      border: Border(
        left: BorderSide(color: Color(0xFFDBDBDB), width: width),
      ),
    );
  }

  static formatInfoTIMC(double numbers, int index) {
    var nMoney;
    //final substring= numberS.indexOf(".0");

    if(index == 0 || index == 1){

      nMoney = GlobalStyles.numFormat.format(numbers);

    } else if (index == 2){
      nMoney = numbers.toString() + '%';
    } else {
      nMoney = GlobalStyles.numFormartN.format(numbers);//numbers.toString();
    }

    return Text(
      nMoney, textAlign: TextAlign.right, style: TextStyle(fontSize: 11)
    );
  }

  static formatDateIMC(String date){
    final month = date.substring(5,7);
    final year = date.substring(0,4);

    if(month == '01'){
      GlobalVariables.dateNameIMC = 'Enero '+year;
    } else if(month == '02'){
      GlobalVariables.dateNameIMC = 'Febrero '+year;
    } else if(month == '03'){
      GlobalVariables.dateNameIMC = 'Marzo '+year;
    } else if(month == '04'){
      GlobalVariables.dateNameIMC = 'Abril '+year;
    } else if(month == '05'){
      GlobalVariables.dateNameIMC = 'Mayo '+year;
    } else if(month == '06'){
      GlobalVariables.dateNameIMC = 'Junio '+year;
    } else if(month == '07'){
      GlobalVariables.dateNameIMC = 'Julio '+year;
    } else if(month == '08'){
      GlobalVariables.dateNameIMC = 'Agosto '+year;
    } else if(month == '09'){
      GlobalVariables.dateNameIMC = 'Septiembre '+year;
    } else if(month == '10'){
      GlobalVariables.dateNameIMC = 'Octubre '+year;
    } else if(month == '11'){
      GlobalVariables.dateNameIMC = 'Noviembre '+year;
    } else if(month == '12'){
      GlobalVariables.dateNameIMC = 'Diciembre '+year;
    }

    return Text(
      GlobalVariables.dateNameIMC,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, decoration: TextDecoration.underline),
    );
  }

  static formatDateChartIMC(String date){
    final month = date.substring(5,7);
    final year = date.substring(0,4);

    if(month == '01'){
      GlobalVariables.dateNameIMChart = 'Ene-' + year;//'Enero '+year;
    } else if(month == '02'){
      GlobalVariables.dateNameIMChart = 'Feb-' + year;
    } else if(month == '03'){
      GlobalVariables.dateNameIMChart = 'Mar-' + year;
    } else if(month == '04'){
      GlobalVariables.dateNameIMChart = 'Abr-' + year;
    } else if(month == '05'){
      GlobalVariables.dateNameIMChart = 'May-' + year;
    } else if(month == '06'){
      GlobalVariables.dateNameIMChart = 'Jun-' + year;
    } else if(month == '07'){
      GlobalVariables.dateNameIMChart = 'Jul-' + year;
    } else if(month == '08'){
      GlobalVariables.dateNameIMChart = 'Ago-' + year;
    } else if(month == '09'){
      GlobalVariables.dateNameIMChart = 'Sep-' + year;
    } else if(month == '10'){
      GlobalVariables.dateNameIMChart = 'Oct-' + year;
    } else if(month == '11'){
      GlobalVariables.dateNameIMChart = 'Nov-' + year;
    } else if(month == '12'){
      GlobalVariables.dateNameIMChart = 'Dic-' + year;
    }

    return GlobalVariables.dateNameIMChart;
  }

  static formatDateGnrl(String date){
    final month = date.substring(5,7);
    final year = date.substring(0,4);

    if(month == '01'){
      GlobalVariables.dateGnrl = 'Enero '+year;
    } else if(month == '02'){
      GlobalVariables.dateGnrl = 'Febrero '+year;
    } else if(month == '03'){
      GlobalVariables.dateGnrl = 'Marzo '+year;
    } else if(month == '04'){
      GlobalVariables.dateGnrl = 'Abril '+year;
    } else if(month == '05'){
      GlobalVariables.dateGnrl = 'Mayo '+year;
    } else if(month == '06'){
      GlobalVariables.dateGnrl = 'Junio '+year;
    } else if(month == '07'){
      GlobalVariables.dateGnrl = 'Julio '+year;
    } else if(month == '08'){
      GlobalVariables.dateGnrl = 'Agosto '+year;
    } else if(month == '09'){
      GlobalVariables.dateGnrl = 'Septiembre '+year;
    } else if(month == '10'){
      GlobalVariables.dateGnrl = 'Octubre '+year;
    } else if(month == '11'){
      GlobalVariables.dateGnrl = 'Noviembre '+year;
    } else if(month == '12'){
      GlobalVariables.dateGnrl = 'Diciembre '+year;
    }

  }


  static colorTableIMCC(int index){
    var color;

    if(index == GlobalVariables.selectConp){
      color = 0xFF90CAF9;//Color(0xFF90CAF9),
    } else {
      color = 0xFFFFFFFF;
    }

    return Color(
      color,
    );
  }

  //--------------------General:-----------------------------
  static formatProdGnrl(String numbersPr, int index) {
    var numberD = double.parse(numbersPr);

    var nMoney;
    //final substring= numberS.indexOf(".0");

    if(index == 0 || index == 1 || index == 2 || index == 3){

      nMoney = GlobalStyles.numFormat.format(numberD);

    } else {
      nMoney = GlobalStyles.numFormartN.format(numberD);
    }

    return Text(
        nMoney, textAlign: TextAlign.right, style: TextStyle(fontSize: 12)
    );
  }

  static colorIcons(BuildContext ctx, int index){
    return Container(
      color: GlobalVariables.listColors[index],
      width: 15,
      height: 15,
      alignment: Alignment.bottomCenter,
    );
  }

  static colorBackground(BuildContext ctx, int index, int indexC){

    var color;
    if(index == indexC){
      color = GlobalVariables.listColors[index];
    } else {
      color = Colors.white;
    }

    return color;
  }

  static colorIconsE(BuildContext ctx, int index){
    var color;
    if (GlobalVariables.listProduct[index] == 'TRANSITORIO'){
      color = Color(0xffFFB300);

    } else if (GlobalVariables.listProduct[index] == 'VIGENTE'){
      color = Color(0xff7CB342);

    } else if (GlobalVariables.listProduct[index] == 'VENCIDA'){
      color = Color(0xffA93226);
    }
    //GlobalVariables.listProduct[index]
    return Container(
      color: color,
      width: 15,
      height: 15,
      alignment: Alignment.bottomCenter,
    );
  }

  static colorBackgroundE(BuildContext ctx, int index, int indexC){

    var color;

    if(index == indexC){
      //color = GlobalVariables.listColors[index];
      if (GlobalVariables.listProduct[index] == 'TRANSITORIO'){
        color = Color(0xffFFB300);

      } else if (GlobalVariables.listProduct[index] == 'VIGENTE'){
        color = Color(0xff7CB342);

      } else if (GlobalVariables.listProduct[index] == 'VENCIDA'){
        color = Color(0xffA93226);
      }
    } else {
      color = Colors.white;
    }

    return color;
  }


  //-----------------Benchmarking:----------------------------

  static formartListNBench(ListReoderViewCard widget){
    var formatText;

    if(GlobalVariables.titleCharts == 'Número de Empleados' || GlobalVariables.titleCharts == 'Número de Sucursales'){
      formatText = GlobalStyles.numFormartN.format(double.parse(widget.listBanks[widget.index]));
    } else {
      formatText = GlobalStyles.numFormatB.format(double.parse(widget.listBanks[widget.index]));
    }
    return Text(
      formatText,
      //GlobalStyles.numFormatB.format(double.parse(widget.listBanks[widget.index])),
      //widget.listBanks[widget.index],
      style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
      textAlign: TextAlign.right,
      maxLines: 5,
    );
  }
}
