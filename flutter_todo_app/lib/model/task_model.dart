import 'package:uuid/uuid.dart';

class Task {
  final String
      id; // her görevi birbirinden ayırt etmek için kullanılacak. hive veri tabanında kullanım sırasında.
  String isim;
  final DateTime createdAt; // oluşturulan görevin ne zaman yapılacağı
  bool isCompleted;

  Task(
      {required this.id,
      required this.isim,
      required this.createdAt,
      required this.isCompleted});

  factory Task.create({required String isim, required DateTime createdAt}) {
    return Task(

        // Uuid().v1(): o anki zamanı Stringe dönüştürüp çıktı veriyor, 2 farklı görevi de bu şekilde ayırmış oluyoruz.
        id: const Uuid().v1(), isim: isim, createdAt: createdAt, isCompleted: false);
  }
}
