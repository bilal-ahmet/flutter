import 'package:dinamik_ortalama_hesapla/model/ders.dart';
import 'package:flutter/material.dart';

class DataHelper {
  static List<String> _DerslerinHarfleri() {
    return ["AA", "BA", "BB", "CB", "CC", "DC", "DD", "FD", "FF"];
  }

  static List<int> _tumKrediler (){
    return List.generate(10, (index) => index + 1).toList();
  }

  static List<Ders> tumEklenecekDersler = [];

  static dersEkle(Ders ders){
    tumEklenecekDersler.add(ders);
  }

  static ortalamaHesapla(){
    double toplamNot = 0;
    double toplamKredi = 0;

    tumEklenecekDersler.forEach((element) {
      toplamNot = toplamNot + (element.kredi * element.harfNotu);
      toplamKredi += element.kredi; 
    });

    return toplamNot / toplamKredi;
  }

  static double _harfiNotaCevir(String harf) {
    switch (harf) {
      case "AA":
        return 4;
      case "BA":
        return 3.5;
      case "BB":
        return 3.0;
      case "CB":
        return 2.5;
      case "CC":
        return 2.0;
      case "DC":
        return 1.5;
      case "DD":
        return 1.0;
      case "FD":
        return 0.5;
      case "FF":
        return 0.0;
      default :
        return 1;  
    }
  }

  static List<DropdownMenuItem<double>> tumDerslerinHarfleri(){
    return _DerslerinHarfleri().map((e) => DropdownMenuItem(child: Text(e), value: _harfiNotaCevir(e))).toList();
  }

  static List<DropdownMenuItem<double>> tumDerslerinKredileri(){
    return _tumKrediler().map((e) => DropdownMenuItem(child: Text("$e"), value: e.toDouble())).toList();
  }
}
