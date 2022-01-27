class OgrencilerRepository {

  List ogrenciler = [
    Ogrenci('Ali', 'Yılmaz', 18, 'Erkek'),
    Ogrenci('Ayşe', 'Çelik', 20, 'Kadın'),
  ];
}


class Ogrenci {
  String ad;
  String soyad;
  int yas;
  String cinsiyet;

  Ogrenci(this.ad, this.soyad, this.yas, this.cinsiyet);
}