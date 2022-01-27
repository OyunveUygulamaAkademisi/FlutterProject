import 'package:flutter/foundation.dart';

@immutable
class Ogrenci {
  late final String iss;
  String isim;
  int yas;


  void merhabaDe() {
    print('Merhaba, ben $isim, $yas yaşındayım.');
    iss = 'hele';
  }

  void dogumGunuKutla() {
    yas = yas + 1;
    print('$isim: yasasin dogum gunum! $yas oldum!');
  }

  Ogrenci(this.isim, this.yas);
}

void main() {

  print('merhaba!');

  Ogrenci ogr1 = Ogrenci("ali", 15);
  Ogrenci ogr2 = Ogrenci("ayse", 17);

  print("Ogrenciler:");
  ogr1.merhabaDe();
  ogr2.merhabaDe();

  ogr1.dogumGunuKutla();

  ogr1.merhabaDe();
  ogr2.merhabaDe();


}
