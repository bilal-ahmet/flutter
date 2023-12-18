import 'package:dinamik_ortalama_hesapla/constants/app_constants.dart';
import 'package:dinamik_ortalama_hesapla/helper/data_helper.dart.dart';
import 'package:flutter/material.dart';

class HarfDropDownWidget extends StatefulWidget {
  final Function onHarfSecildi;
  const HarfDropDownWidget({required this.onHarfSecildi, super.key});

  @override
  State<HarfDropDownWidget> createState() => _HarfDropDownWidgetState();
}

class _HarfDropDownWidgetState extends State<HarfDropDownWidget> {
  var secilenHarfDegeri;
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
        hint: Text("--"),
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk,
        underline: Container(),
        value: secilenHarfDegeri,
        items: DataHelper.tumDerslerinHarfleri(),
        onChanged: (value) {
          setState(() {
            secilenHarfDegeri = value;
            widget.onHarfSecildi(secilenHarfDegeri);
          });
        },
      ),
    );
  }
}