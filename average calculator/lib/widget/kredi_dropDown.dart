import 'package:dinamik_ortalama_hesapla/constants/app_constants.dart';
import 'package:dinamik_ortalama_hesapla/helper/data_helper.dart.dart';
import 'package:flutter/material.dart';

class KrediDropDownWidget extends StatefulWidget {
  final Function onKrediSecildi;
  const KrediDropDownWidget({required this.onKrediSecildi, super.key});

  @override
  State<KrediDropDownWidget> createState() => _KrediDropDownWidgetState();
}

class _KrediDropDownWidgetState extends State<KrediDropDownWidget> {
  var secilenKrediDegeri;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
        color: Sabitler.anaRenk.shade100,
        borderRadius: Sabitler.borderRadius,
      ),
      child: DropdownButton(
        hint: Text("-.--"),
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk,
        underline: Container(),
        value: secilenKrediDegeri,
        items: DataHelper.tumDerslerinKredileri(),
        onChanged: (value) {
          setState(() {
            secilenKrediDegeri = value;
            widget.onKrediSecildi(value);
          });
        },
      ),
    );
  }
}