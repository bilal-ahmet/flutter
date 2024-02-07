import 'package:dinamik_ortalama_hesapla/constants/app_constants.dart';
import 'package:dinamik_ortalama_hesapla/helper/data_helper.dart.dart';
import 'package:dinamik_ortalama_hesapla/model/ders.dart';
import 'package:dinamik_ortalama_hesapla/widget/ders_listesi.dart';
import 'package:dinamik_ortalama_hesapla/widget/harf_dropDown.dart';
import 'package:dinamik_ortalama_hesapla/widget/kredi_dropDown.dart';
import 'package:dinamik_ortalama_hesapla/widget/ortalama_goster.dart';
import 'package:flutter/material.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  const OrtalamaHesaplaPage({super.key});

  @override
  State<OrtalamaHesaplaPage> createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {
  var formKey = GlobalKey<FormState>();
  var secilenHarfDegeri;
  var secilenKrediDegeri;
  var girilenDersAdi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0, // appbar backround'unun opaklığını değiştirir.
          title: Center(
              child: Text(
            Sabitler.baslik,
            style: Sabitler.baslikStyle,
          )),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: _buildForm(),
                ),
                Expanded(
                  flex: 1,
                  child: OrtalamaGster(dersSayisi: DataHelper.tumEklenecekDersler.length, ortalama: DataHelper.ortalamaHesapla(),),
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Expanded(
              child: DersListesi(
                onDismiss: (index){
                  DataHelper.tumEklenecekDersler.removeAt(index);
                  setState(() {
                    
                  });
                },
              )
            )
          ],
        ));
  }

  _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: Sabitler.paddingHorizontal8,
            child: _builtTextFormField(),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                  child: Padding(
                padding: Sabitler.paddingHorizontal8,
                child: HarfDropDownWidget(
                  onHarfSecildi: (harf){
                    secilenHarfDegeri = harf;
                  },
                ),
              )),
              Expanded(
                  child: Padding(
                padding: Sabitler.paddingHorizontal8,
                child: KrediDropDownWidget(
                  onKrediSecildi: (kredi){
                    secilenKrediDegeri = kredi;
                  },
                ),
              )),
              IconButton(
                onPressed: _dersEkleVeOrtalamaHesapla,
                icon: Icon(Icons.arrow_forward_ios_sharp),
                color: Sabitler.anaRenk,
                iconSize: 28,
              ),
            ],
          )
        ],
      ),
    );
  }

  _builtTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "matematik",
        border: OutlineInputBorder(
            borderRadius: Sabitler.borderRadius, borderSide: BorderSide.none),
        filled: true,
        fillColor: Sabitler.anaRenk.shade100,
      ),
      onSaved: (value) {
        setState(() {
          girilenDersAdi = value;
        });
      },
    );
  }



  void _dersEkleVeOrtalamaHesapla() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var eklenecekDers = Ders(
          ad: girilenDersAdi,
          harfNotu: secilenHarfDegeri,
          kredi: secilenKrediDegeri);
      DataHelper.dersEkle(eklenecekDers);
      //print(DataHelper.tumEklenecekDersler);
      //print(DataHelper.ortalamaHesapla());
      setState(() {
        
      });
    }
  }
}
