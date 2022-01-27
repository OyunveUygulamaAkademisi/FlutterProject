
class Ogretmen {
  String ad;
  String soyad;
  int yas;
  String cinsiyet;

  Ogretmen(this.ad, this.soyad, this.yas, this.cinsiyet);

  Ogretmen.fromMap(Map<String, dynamic> m) : this(
      m['ad'], m['soyad'], m['yas'], m['cinsiyet']
  );
}