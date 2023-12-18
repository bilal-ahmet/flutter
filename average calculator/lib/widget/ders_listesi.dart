import 'package:dinamik_ortalama_hesapla/constants/app_constants.dart';
import 'package:dinamik_ortalama_hesapla/helper/data_helper.dart.dart';
import 'package:dinamik_ortalama_hesapla/model/ders.dart';
import 'package:flutter/material.dart';

class DersListesi extends StatelessWidget {
  final Function onDismiss;
  const DersListesi({required this.onDismiss, super.key});

  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler = DataHelper.tumEklenecekDersler;
    return tumDersler.length > 0
        ? ListView.builder(
            itemCount: tumDersler.length,
            itemBuilder: ((context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (direction) {
                  onDismiss(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    child: ListTile(
                      title: Text(tumDersler[index].ad),
                      leading: CircleAvatar(
                        backgroundColor: Sabitler.anaRenk,
                        child: Text(
                            (tumDersler[index].harfNotu * tumDersler[index].kredi)
                                .toString()),
                      ),
                      subtitle: Text(
                          "${tumDersler[index].kredi} kredi, Not değeri ${tumDersler[index].harfNotu}"),
                    ),
                  ),
                ),
              );
            }))
        : Container(
            child: Center(child: Text("lütfen ders ekleyin", style: Sabitler.baslikStyle,)),
          );
  }
}
