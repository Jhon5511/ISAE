
import 'package:flutter/material.dart';

class GnrlPieData {
  GnrlPieData(this.colorP,this.leyend, this.percent);
  final Color colorP;
  final String leyend;
  final double percent; //reserva natural final
}

class GnrlBarData {
  GnrlBarData(this.colorP,this.leyend, this.saldo);
  final Color colorP;
  final String leyend;
  final double saldo; //reserva natural final
}