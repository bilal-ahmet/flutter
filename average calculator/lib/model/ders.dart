class Ders{
  final String ad;
  final double harfNotu;
  final double kredi;

  Ders({required this.ad, required this.harfNotu, required this.kredi});

  @override
  String toString() {
    return "$ad, harf notu karşılığı: $harfNotu, $kredi";
  }
}