
import 'dart:ui';

class SalesData {
  SalesData(this.date, this.sales);
  final String date;
  final double sales; //reserva natural final
}

class ChartIMCData {
  ChartIMCData(this.x, this.y1, this.y2, this.y3, this.y4,this.y5, this.y6, this.y7, this.c1, this.c2, this.c3, this.c4, this.c5, this.c6, this.c7);
  final String x;
  //final List<Double> y;
  final double y1; //reserva natural inicial
  final double y2; //deterioro
  final double y3; //colocación
  final double y4; //reactivaciones
  final double y5; // mejora
  final double y6; //cancelación
  final double y7; //liquidación
  final Color c1;   //color
  final Color c2;   //color
  final Color c3;   //color
  final Color c4;   //color
  final Color c5;   //color
  final Color c6;   //color
  final Color c7;   //color
}

class IMCCBarData {
  IMCCBarData(this.date, this.month);
  final String date;
  final double month; //reserva natural final
}

class IMCCLineData {
  IMCCLineData(this.date, this.month);
  final String date;
  final double month; //reserva natural final
}