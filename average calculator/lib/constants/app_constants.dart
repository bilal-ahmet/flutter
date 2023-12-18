import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sabitler {
  static const MaterialColor anaRenk = Colors.indigo;
  static const String baslik = "ortalama hesapla";
  static final TextStyle baslikStyle = GoogleFonts.quicksand(
      fontSize: 24, fontWeight: FontWeight.w900, color: anaRenk);
  static final BorderRadius borderRadius = BorderRadius.circular(24);
  static final TextStyle dersSayisiStyle = GoogleFonts.quicksand(
      fontSize: 16, fontWeight: FontWeight.w600, color: anaRenk);
  static final TextStyle ortalamaStyle = GoogleFonts.quicksand(
      fontSize: 55, fontWeight: FontWeight.w800, color: anaRenk);
  static final EdgeInsets dropDownPadding =
      EdgeInsets.symmetric(vertical: 8, horizontal: 16);
  static final EdgeInsetsGeometry paddingHorizontal8 = EdgeInsets.symmetric(horizontal: 8);
}
