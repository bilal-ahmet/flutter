import 'package:dinamik_ortalama_hesapla/constants/app_constants.dart';
import 'package:flutter/material.dart';

class OrtalamaGster extends StatelessWidget {
  final double ortalama;
  final int dersSayisi;
  const OrtalamaGster(
      {required this.ortalama, required this.dersSayisi, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          dersSayisi > 0 ? "$dersSayisi ders girildi" : "ders seçiniz",
          style: Sabitler.dersSayisiStyle,
        ),
        Text(
          ortalama >= 0 ? "${ortalama.toStringAsFixed(2)}" : "0.0",
          style: Sabitler.ortalamaStyle,
        ),
        Text(
          "ortalama",
          style: Sabitler.dersSayisiStyle,
        ),
      ],
    );
  }
}
