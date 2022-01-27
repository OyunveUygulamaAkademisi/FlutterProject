class OgretmenlerRepository {

  List ogretmenler = [
    Ogretmen('Faruk', 'Yılmaz', 18, 'Erkek'),
    Ogretmen('Semiha', 'Çelik', 20, 'Kadın'),
  ];
}


class Ogretmen {
  String ad;
  String soyad;
  int yas;
  String cinsiyet;

  Ogretmen(this.ad, this.soyad, this.yas, this.cinsiyet);
}